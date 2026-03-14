<?php
include_once '../includes/header.php';

// --- DATA PROCESSING ---

// 1. Monthly Trends (Activity Pulse)
$months = []; $issuedTrends = []; $returnTrends = [];
$qTrends = mysqli_query($conn, "SELECT DATE_FORMAT(issue_date, '%b') AS month, COUNT(*) AS iCount, SUM(status='returned') AS rCount FROM issued_books GROUP BY MONTH(issue_date) ORDER BY MONTH(issue_date) LIMIT 6");
while ($row = mysqli_fetch_assoc($qTrends)) {
    $months[] = $row['month'];
    $issuedTrends[] = $row['iCount'];
    $returnTrends[] = $row['rCount'];
}

// 2. Inventory Health (Status)
$qStatus = mysqli_query($conn, "SELECT 
    SUM(status='available') as avail, 
    (SELECT COUNT(*) FROM issued_books WHERE status='issued') as issued,
    (SELECT COUNT(*) FROM issued_books WHERE status='overdue') as overdue,
    SUM(status='damaged' OR status='missing') as lost FROM issued_books");
$s = mysqli_fetch_assoc($qStatus);

// 3. Leaderboard (Top 5 Books)
$topLabels = []; $topValues = [];
$qTop = mysqli_query($conn, "SELECT b.book_name, COUNT(i.id) as qty FROM issued_books i JOIN books b ON i.book_id=b.id GROUP BY i.book_id ORDER BY qty DESC LIMIT 5");
while($r = mysqli_fetch_assoc($qTop)) {
    $topLabels[] = (strlen($r['book_name']) > 12) ? substr($r['book_name'],0,10).'..' : $r['book_name'];
    $topValues[] = $r['qty'];
}
?>

<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        :root { --sidebar-width: 250px; --topbar-height: 60px; }
        body { background: #f8f9fc; font-family: 'Segoe UI', sans-serif; margin: 0; }

        .dashboard-wrapper {
            margin-left: var(--sidebar-width);
            padding: 25px;
            box-sizing: border-box;
        }

        .chart-grid {
            display: grid;
            grid-template-columns: 1.5fr 1fr;
            grid-template-rows: auto auto;
            gap: 20px;
        }

        .chart-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            border: 1px solid #e3e6f0;
        }

        .chart-card h3 {
            margin: 0 0 15px 0;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #4e73df;
            border-bottom: 1px solid #f1f1f1;
            padding-bottom: 10px;
        }

        .full-width { grid-column: span 2; }
        
        canvas { max-height: 250px !important; }
        
        .header-lite { margin-bottom: 20px; display: flex; justify-content: space-between; align-items: center; }
        .header-lite h2 { margin: 0; font-weight: 300; color: #333; }

        /* --- NEW BUTTON STYLE --- */
        .btn-report {
            background: #4e73df;
            color: white !important;
            padding: 8px 18px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            transition: all 0.3s;
            border: none;
            display: inline-flex;
            align-items: center;
            box-shadow: 0 4px 6px rgba(78, 115, 223, 0.2);
        }

        .btn-report:hover {
            background: #2e59d9;
            box-shadow: 0 6px 12px rgba(78, 115, 223, 0.3);
            transform: translateY(-1px);
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 15px;
        }
    </style>
</head>
<body>

<div class="dashboard-wrapper">
    <div class="header-lite">
        <h2>Library Insights</h2>
        <div class="header-actions">
            <!-- NEW VIEW REPORT BUTTON -->
            <a href="circulation_details.php" class="btn-report">
                View Report
            </a>
            
            <span style="background:#e8edff; color:#2b4eff; padding:8px 12px; border-radius:8px; font-size:12px; font-weight:bold;">
                Updated: <?= date("H:i A") ?>
            </span>
        </div>
    </div>

    <div class="chart-grid">
        <!-- 1. Activity Pulse -->
        <div class="chart-card">
            <h3>Borrowing Pulse (Trends)</h3>
            <canvas id="pulseChart"></canvas>
        </div>

        <!-- 2. Inventory Health -->
        <div class="chart-card">
            <h3>Inventory Status</h3>
            <canvas id="healthChart"></canvas>
        </div>

        <!-- 3. Leaderboard -->
        <div class="chart-card full-width">
            <h3>Top Performing Titles</h3>
            <canvas id="leaderChart"></canvas>
        </div>
    </div>
</div>

<script>
// Chart 1: Pulse (Line Chart)
const ctxPulse = document.getElementById('pulseChart').getContext('2d');
const gradient = ctxPulse.createLinearGradient(0, 0, 0, 400);
gradient.addColorStop(0, 'rgba(78, 115, 223, 0.2)');
gradient.addColorStop(1, 'rgba(78, 115, 223, 0)');

new Chart(ctxPulse, {
    type: 'line',
    data: {
        labels: <?= json_encode($months) ?>,
        datasets: [{
            label: 'Issues',
            data: <?= json_encode($issuedTrends) ?>,
            borderColor: '#4e73df',
            backgroundColor: gradient,
            fill: true,
            tension: 0.4,
            borderWidth: 3
        }, {
            label: 'Returns',
            data: <?= json_encode($returnTrends) ?>,
            borderColor: '#1cc88a',
            fill: false,
            tension: 0.4,
            borderDash: [5, 5]
        }]
    },
    options: { plugins: { legend: { position: 'bottom' } }, scales: { y: { beginAtZero: true, grid: { display: false } } } }
});

// Chart 2: Health (Doughnut)
new Chart(document.getElementById('healthChart'), {
    type: 'doughnut',
    data: {
        labels: ['Available', 'On Loan', 'Overdue', 'Lost/Dmg'],
        datasets: [{
            data: [<?= (int)$s['avail'] ?>, <?= (int)$s['issued'] ?>, <?= (int)$s['overdue'] ?>, <?= (int)$s['lost'] ?>],
            backgroundColor: ['#1cc88a', '#4e73df', '#f6c23e', '#e74a3b'],
            hoverOffset: 10,
            borderWidth: 0
        }]
    },
    options: { cutout: '75%', plugins: { legend: { position: 'bottom', labels: { boxWidth: 12 } } } }
});

// Chart 3: Leaderboard (Horizontal Bar)
new Chart(document.getElementById('leaderChart'), {
    type: 'bar',
    data: {
        labels: <?= json_encode($topLabels) ?>,
        datasets: [{
            label: 'Total Loans',
            data: <?= json_encode($topValues) ?>,
            backgroundColor: '#4e73df',
            borderRadius: 5,
            barThickness: 25
        }]
    },
    options: {
        indexAxis: 'y',
        plugins: { legend: { display: false } },
        scales: { x: { grid: { display: false } }, y: { grid: { display: false } } }
    }
});
</script>

</body>
</html>