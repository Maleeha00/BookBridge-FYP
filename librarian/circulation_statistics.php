<?php
// Include your database connection
include_once '../includes/config.php'; 

// 1. Fetch Monthly Trends (Last 6 Months)
$months = [];
$issuedData = [];
$returnedData = [];

$trendsQuery = "SELECT 
                    DATE_FORMAT(issue_date, '%b') as month,
                    COUNT(*) as issued_count,
                    SUM(CASE WHEN status = 'returned' OR actual_return_date IS NOT NULL THEN 1 ELSE 0 END) as returned_count
                FROM issued_books 
                WHERE issue_date >= DATE_SUB(NOW(), INTERVAL 6 MONTH)
                GROUP BY MONTH(issue_date)
                ORDER BY issue_date ASC";

$trendsResult = mysqli_query($conn, $trendsQuery);
while ($row = mysqli_fetch_assoc($trendsResult)) {
    $months[] = $row['month'];
    $issuedData[] = (int)$row['issued_count'];
    $returnedData[] = (int)$row['returned_count'];
}

// 2. Fetch Inventory Distribution
$statusQuery = "SELECT 
                    (SELECT SUM(available_quantity) FROM books) as total_avail,
                    (SELECT COUNT(*) FROM issued_books WHERE status = 'issued') as total_issued,
                    (SELECT COUNT(*) FROM issued_books WHERE status = 'overdue') as total_overdue";
$statusResult = mysqli_fetch_assoc(mysqli_query($conn, $statusQuery));

// 3. Fetch Most Borrowed Books
$mostBorrowed = [];
$borrowedQuery = "SELECT b.book_name, b.author, b.category, COUNT(ib.id) as borrow_count, b.available_quantity 
                  FROM issued_books ib
                  JOIN books b ON ib.book_id = b.id
                  GROUP BY ib.book_id
                  ORDER BY borrow_count DESC
                  LIMIT 5";
$borrowedResult = mysqli_query($conn, $borrowedQuery);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Analytics | Live Data</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        :root {
            --bg-color: #f8fafc;
            --card-bg: #ffffff;
            --primary: #334155;
            --accent: #3b82f6;
            --success: #10b981;
            --warning: #f59e0b;
            --danger: #ef4444;
            --text-main: #1e293b;
            --text-muted: #64748b;
            --border: #e2e8f0;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Inter', sans-serif; background: var(--bg-color); color: var(--text-main); padding: 20px; }

        .dashboard-wrapper { max-width: 1200px; margin: 0 auto; }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .dashboard-header h2 { font-size: 1.5rem; font-weight: 700; color: var(--primary); }

        .view-report-btn {
            background-color: var(--accent);
            color: white;
            padding: 10px 20px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
        }

        .view-report-btn:hover { background-color: #2563eb; transform: translateY(-2px); }

        /* Main Area (Charts & Table) */
        .main-grid { display: grid; grid-template-columns: 1.5fr 1fr; gap: 24px; }
        .full-row { grid-column: span 2; }
        
        .panel { 
            background: var(--card-bg); 
            padding: 24px; 
            border-radius: 12px; 
            border: 1px solid var(--border); 
            box-shadow: 0 1px 3px rgba(0,0,0,0.02);
        }

        .panel h4 { font-size: 1rem; margin-bottom: 20px; color: var(--primary); font-weight: 600; display: flex; align-items: center; gap: 8px; }
        
        /* Table Styling */
        table { width: 100%; border-collapse: collapse; }
        th { text-align: left; padding: 12px; font-size: 0.75rem; color: var(--text-muted); border-bottom: 1px solid var(--border); text-transform: uppercase; }
        td { padding: 14px 12px; font-size: 0.85rem; border-bottom: 1px solid var(--border); }
        .book-title { font-weight: 600; color: var(--text-main); }
        .badge { padding: 4px 10px; border-radius: 6px; font-size: 0.7rem; font-weight: 700; }
        .bg-available { background: #dcfce7; color: #15803d; }
        .bg-out { background: #fee2e2; color: #991b1b; }

        @media (max-width: 992px) { 
            .main-grid { grid-template-columns: 1fr; } 
            .full-row { grid-column: span 1; } 
        }
    </style>
</head>
<body>

<div class="dashboard-wrapper">
    
    <div class="dashboard-header">
        <div>
            <h2>Circulation Analytics</h2>
            <p style="color: var(--text-muted); font-size: 0.85rem;">Real-time trends based on actual library transactions.</p>
        </div>
        <a href="circulation_details.php" class="view-report-btn">
            <i class="fa-solid fa-file-invoice"></i>
            View Report
        </a>
    </div>

    <div class="main-grid">
        <!-- Monthly Trends Chart (Live PHP Data) -->
        <div class="panel">
            <h4><i class="fa-solid fa-chart-line" style="color:var(--accent)"></i> Monthly Issue vs Return Trends</h4>
            <canvas id="trendsChart" height="180"></canvas>
        </div>

        <!-- Inventory Status (Live PHP Data) -->
        <div class="panel">
            <h4><i class="fa-solid fa-chart-pie" style="color:var(--warning)"></i> Inventory Health</h4>
            <canvas id="statusChart" height="180"></canvas>
        </div>

        <!-- Most Borrowed List (Live PHP Data) -->
        <div class="panel full-row">
            <h4><i class="fa-solid fa-ranking-stars" style="color:var(--success)"></i> Most Popular Books</h4>
            <table>
                <thead>
                    <tr>
                        <th>Book Information</th>
                        <th>Category</th>
                        <th>Times Borrowed</th>
                        <th>In Stock</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($book = mysqli_fetch_assoc($borrowedResult)): ?>
                    <tr>
                        <td>
                            <div class="book-title"><?php echo htmlspecialchars($book['book_name']); ?></div>
                            <div style="font-size: 0.75rem; color: var(--text-muted)"><?php echo htmlspecialchars($book['author']); ?></div>
                        </td>
                        <td><?php echo htmlspecialchars($book['category']); ?></td>
                        <td><strong><?php echo $book['borrow_count']; ?></strong> times</td>
                        <td><?php echo $book['available_quantity']; ?></td>
                        <td>
                            <?php if($book['available_quantity'] > 0): ?>
                                <span class="badge bg-available">Available</span>
                            <?php else: ?>
                                <span class="badge bg-out">Out of Stock</span>
                            <?php endif; ?>
                        </td>
                    </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    // Trends Chart - Dynamic Data from PHP
    new Chart(document.getElementById('trendsChart').getContext('2d'), {
        type: 'line',
        data: {
            labels: <?php echo json_encode($months); ?>,
            datasets: [
                {
                    label: 'Books Issued',
                    data: <?php echo json_encode($issuedData); ?>,
                    borderColor: '#3b82f6',
                    backgroundColor: 'rgba(59, 130, 246, 0.05)',
                    fill: true,
                    tension: 0.4
                },
                {
                    label: 'Books Returned',
                    data: <?php echo json_encode($returnedData); ?>,
                    borderColor: '#10b981',
                    borderDash: [5, 5],
                    fill: false,
                    tension: 0.4
                }
            ]
        },
        options: {
            responsive: true,
            plugins: { legend: { position: 'bottom' } },
            scales: { 
                y: { beginAtZero: true, grid: { color: '#f1f5f9' } },
                x: { grid: { display: false } } 
            }
        }
    });

    // Status Chart - Dynamic Data from PHP
    new Chart(document.getElementById('statusChart').getContext('2d'), {
        type: 'pie',
        data: {
            labels: ['Available in Library', 'Currently Issued', 'Overdue'],
            datasets: [{
                data: [
                    <?php echo $statusResult['total_avail']; ?>, 
                    <?php echo $statusResult['total_issued']; ?>, 
                    <?php echo $statusResult['total_overdue']; ?>
                ],
                backgroundColor: ['#10b981', '#3b82f6', '#ef4444'],
                borderWidth: 2,
                borderColor: '#ffffff'
            }]
        },
        options: {
            responsive: true,
            plugins: { legend: { position: 'bottom' } }
        }
    });
</script>

</body>
</html>