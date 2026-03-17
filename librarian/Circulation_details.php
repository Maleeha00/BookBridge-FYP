<?php 
include_once '../includes/header.php'; 

// 1. Executive Metrics
$q1 = mysqli_query($conn, "SELECT COUNT(*) AS total FROM issued_books WHERE status='issued'");
$currentlyIssued = mysqli_fetch_assoc($q1)['total'] ?? 0;

$q2 = mysqli_query($conn, "SELECT COUNT(*) AS total FROM issued_books WHERE status='returned'");
$totalReturned = mysqli_fetch_assoc($q2)['total'] ?? 0;

$q3 = mysqli_query($conn, "SELECT COUNT(*) AS total FROM issued_books WHERE status='overdue'");
$overdue = mysqli_fetch_assoc($q3)['total'] ?? 0;

// 2. User Activity
$userNames = []; $userCounts = [];
$qUsers = mysqli_query($conn, "SELECT u.name, COUNT(i.id) as qty FROM issued_books i JOIN users u ON i.user_id=u.id GROUP BY i.user_id ORDER BY qty DESC LIMIT 5");
while($r = mysqli_fetch_assoc($qUsers)){ 
    $userNames[] = $r['name']; 
    $userCounts[] = $r['qty']; 
}

$qNewUsers = mysqli_query($conn, "SELECT COUNT(*) as total FROM users WHERE created_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)");
$newUsersCount = mysqli_fetch_assoc($qNewUsers)['total'] ?? 0;

// 3. Time-Based Trends
$months = []; $issuedTrends = []; $returnTrends = [];
$qTrends = mysqli_query($conn, "SELECT DATE_FORMAT(issue_date, '%b') AS month, COUNT(*) AS issuedCount, SUM(status='returned') AS returnedCount FROM issued_books GROUP BY MONTH(issue_date) ORDER BY MONTH(issue_date)");
while ($row = mysqli_fetch_assoc($qTrends)) {
    $months[] = $row['month'];
    $issuedTrends[] = $row['issuedCount'];
    $returnTrends[] = $row['returnedCount'];
}

// 4. Book Status Summary
$qStatus = mysqli_query($conn, "SELECT 
    SUM(status='available') as avail, 
    SUM(status='damaged') as dmg, 
    SUM(status='missing') as msg FROM issued_books");
$resStatus = mysqli_fetch_assoc($qStatus);
$availableBooks = $resStatus['avail'] ?? 0;
$damagedBooks = $resStatus['dmg'] ?? 0;
$missingBooks = $resStatus['msg'] ?? 0;

// 5. Most Borrowed
$mostBorrowedNames = []; $mostBorrowedCounts = [];
$qMost = mysqli_query($conn, "SELECT b.book_name, COUNT(i.id) as qty FROM issued_books i JOIN books b ON i.book_id=b.id GROUP BY i.book_id ORDER BY qty DESC LIMIT 5");
while($r = mysqli_fetch_assoc($qMost)){ $mostBorrowedNames[] = $r['book_name']; $mostBorrowedCounts[] = $r['qty']; }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Library Circulation Report</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- Use a reliable CDN for html2pdf -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    
    <style>
        :root { --primary: #1a237e; --secondary: #303f9f; --light: #f5f5f5; --dark: #212121; }
        
        body { font-family: 'Segoe UI', Arial, sans-serif; background: #e0e0e0; margin: 0; padding: 20px; color: var(--dark); }
        
        /* Fixed: Adjusted for better PDF capture */
        .report-page { 
            width: 800px; /* Use pixels for more reliable capture than mm */
            margin: auto; 
            background: white; 
            padding: 40px; 
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
            box-sizing: border-box;
        }

        .report-header { border-bottom: 3px solid var(--primary); margin-bottom: 30px; display: flex; justify-content: space-between; align-items: flex-end; padding-bottom: 10px; }
        .report-header h1 { margin: 0; color: var(--primary); font-size: 28px; text-transform: uppercase; }
        
        .no-print-btn { 
            position: fixed; top: 20px; right: 20px; 
            padding: 12px 25px; background: #28a745; color: white; 
            border: none; border-radius: 5px; cursor: pointer; font-weight: bold;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2); z-index: 1000;
        }

        .download-footer-container { text-align: center; margin-top: 20px; }
        .download-btn-bottom {
            padding: 15px 35px; background: #1a237e; color: white; border: none;
            border-radius: 8px; cursor: pointer; font-size: 18px; font-weight: bold;
        }

        .summary-box { background: var(--light); padding: 15px; border-left: 5px solid var(--primary); margin-bottom: 30px; }
        .metrics-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 15px; margin-bottom: 30px; }
        .metric-card { border: 1px solid #ddd; padding: 15px; text-align: center; border-radius: 8px; }
        .metric-card b { font-size: 24px; color: var(--primary); display: block; }

        .charts-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; }
        .chart-container { margin-bottom: 20px; background: #fff; padding: 10px; border: 1px solid #f0f0f0; }
        .chart-container h3 { font-size: 14px; color: var(--secondary); margin-top: 0; border-bottom: 1px solid #eee; }

        .report-footer { margin-top: 30px; padding-top: 20px; border-top: 1px solid #eee; font-size: 11px; color: #777; text-align: center; }

        @media print {
            .no-print-btn, .download-footer-container { display: none; }
            body { background: white; padding: 0; }
            .report-page { box-shadow: none; width: 100%; }
        }
    </style>
</head>
<body>

<button class="no-print-btn" onclick="window.print()">Print via Browser</button>

<div class="report-page" id="report-content">
    <div class="report-header">
        <div>
            <h1>Library Analytics</h1>
            <p>Official Circulation Summary Report</p>
        </div>
        <div style="text-align: right;">
            <strong>Date:</strong> <?= date("d M, Y") ?>
        </div>
    </div>

    <div class="summary-box">
        <strong>Executive Summary:</strong><br>
        Currently, there are <b><?= $currentlyIssued ?></b> active loans. Inventory shows <b><?= $availableBooks ?></b> available books and <b><?= $damagedBooks + $missingBooks ?></b> lost/damaged items.
    </div>

    <div class="metrics-grid">
        <div class="metric-card"><span>Active Loans</span><b><?= $currentlyIssued ?></b></div>
        <div class="metric-card"><span>Returns</span><b><?= $totalReturned ?></b></div>
        <div class="metric-card"><span>Overdue</span><b><?= $overdue ?></b></div>
        <div class="metric-card"><span>New Users</span><b><?= $newUsersCount ?></b></div>
    </div>

    <div class="charts-grid">
        <div class="chart-container">
            <h3>Borrowing Trends</h3>
            <canvas id="trendChart"></canvas>
        </div>
        <div class="chart-container">
            <div class="chart-container" style="grid-column: span 2;">
    <h3>Inventory Composition (Total Distribution)</h3>
    <div style="display: flex; height: 30px; border-radius: 15px; overflow: hidden; margin-top: 10px; border: 1px solid #ddd;">
        <div style="width: 70%; background: #28a745;" title="Available"></div>
        <div style="width: 20%; background: #1a237e;" title="Issued"></div>
        <div style="width: 7%; background: #ffc107;" title="Damaged"></div>
        <div style="width: 3%; background: #dc3545;" title="Missing"></div>
    </div>
    <div style="display: flex; justify-content: space-between; font-size: 10px; margin-top: 5px;">
        <span>Available</span>
        <span>Issued</span>
        <span>Damaged</span>
        <span>Missing</span>
    </div>
</div>
        </div>
        <div class="chart-container">
            <h3>Top Titles</h3>
            <canvas id="mostBorrowedChart"></canvas>
        </div>
        <div class="chart-container">
            <h3>Top Members</h3>
            <canvas id="userChart"></canvas>
        </div>
    </div>

    <div class="report-footer">
        Generated by Library Management System &copy; <?= date("Y") ?>
    </div>
</div>

<div class="download-footer-container">
    <button class="download-btn-bottom" id="download-pdf-btn">Download PDF Report</button>
</div>

<script>
// IMPORTANT: Disable animations for PDF capture
Chart.defaults.animation = false;
Chart.defaults.font.size = 10;

// Trend Chart
new Chart(document.getElementById('trendChart'), {
    type: 'line',
    data: {
        labels: <?= json_encode($months) ?>,
        datasets: [
            { label: 'Issued', data: <?= json_encode($issuedTrends) ?>, borderColor: '#1a237e', tension: 0.1 },
            { label: 'Returned', data: <?= json_encode($returnTrends) ?>, borderColor: '#28a745', tension: 0.1 }
        ]
    }
});
// Unique Polar Area Chart for Status
new Chart(document.getElementById('statusChart'), {
    type: 'polarArea',
    data: {
        labels: ['Available', 'Issued', 'Damaged', 'Missing'],
        datasets: [{
            data: [<?= $availableBooks ?>, <?= $currentlyIssued ?>, <?= $damagedBooks ?>, <?= $missingBooks ?>],
            backgroundColor: [
                'rgba(40, 167, 69, 0.7)',  // Green (Semi-transparent)
                'rgba(26, 35, 126, 0.7)',  // Blue
                'rgba(255, 193, 7, 0.7)',  // Yellow
                'rgba(220, 53, 69, 0.7)'   // Red
            ],
            borderColor: [
                '#28a745', 
                '#1a237e', 
                '#ffc107', 
                '#dc3545'
            ],
            borderWidth: 2
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: true,
        scales: {
            r: {
                grid: {
                    color: '#f0f0f0'
                },
                angleLines: {
                    display: true,
                    color: '#f0f0f0'
                },
                ticks: {
                    display: false // Hides the numbers on the rings for a cleaner look
                }
            }
        },
        plugins: {
            legend: {
                position: 'bottom',
                labels: {
                    padding: 20,
                    usePointStyle: true,
                    pointStyle: 'circle'
                }
            }
        }
    }
});

// Borrowed Chart
new Chart(document.getElementById('mostBorrowedChart'), {
    type: 'bar',
    data: {
        labels: <?= json_encode($mostBorrowedNames) ?>,
        datasets: [{ label: 'Loans', data: <?= json_encode($mostBorrowedCounts) ?>, backgroundColor: '#303f9f' }]
    },
    options: { indexAxis: 'y' }
});

// User Chart
new Chart(document.getElementById('userChart'), {
    type: 'bar',
    data: {
        labels: <?= json_encode($userNames) ?>,
        datasets: [{ label: 'Borrowed', data: <?= json_encode($userCounts) ?>, backgroundColor: '#5c6bc0' }]
    }
});

// IMPROVED DOWNLOAD SCRIPT
document.getElementById('download-pdf-btn').addEventListener('click', function () {
    const btn = this;
    btn.innerHTML = "Processing...";
    
    const element = document.getElementById('report-content');
    const opt = {
        margin:       [10, 0, 10, 0],
        filename:     'Library_Report_<?= date("Y-m-d") ?>.pdf',
        image:        { type: 'jpeg', quality: 0.98 },
        html2canvas:  { 
            scale: 2, 
            useCORS: true, 
            letterRendering: true,
            scrollX: 0,
            scrollY: 0
        },
        jsPDF:        { unit: 'mm', format: 'a4', orientation: 'portrait' },
        pagebreak:    { mode: 'avoid-all' }
    };

    // Give the browser a moment to ensure all charts are painted
    setTimeout(() => {
        html2pdf().set(opt).from(element).save().then(() => {
            btn.innerHTML = "Download PDF Report";
        });
    }, 1000);
});
</script>

</body>
</html>