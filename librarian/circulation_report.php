<?php
include_once '../includes/header.php';
// Total Issued
$q1 = mysqli_query($conn, "SELECT COUNT(*) AS total FROM issued_books WHERE status='issued'");
$issued = mysqli_fetch_assoc($q1)['total'];

// Total Returned
$q2 = mysqli_query($conn, "SELECT COUNT(*) AS total FROM issued_books WHERE status='returned'");
$returned = mysqli_fetch_assoc($q2)['total'];

// Total Overdue
$q3 = mysqli_query($conn, "SELECT COUNT(*) AS total FROM issued_books WHERE status='overdue'");
$overdue = mysqli_fetch_assoc($q3)['total'];


$months = [];
$issuedCounts = [];
$returnCounts = [];

$q4 = mysqli_query($conn, "
    SELECT 
        MONTHNAME(issue_date) AS month,
        SUM(status='issued') AS iCount,
        SUM(status='returned') AS rCount
    FROM issued_books
    GROUP BY MONTH(issue_date)
    ORDER BY MONTH(issue_date)
");

while ($row = mysqli_fetch_assoc($q4)) {
    $months[] = $row['month'];
    $issuedCounts[] = $row['iCount'];
    $returnCounts[] = $row['rCount'];
}

$bookNames = [];
$issueNumbers = [];

$q5 = mysqli_query($conn, "
    SELECT b.book_name, COUNT(i.book_id) AS timesIssued
    FROM issued_books i
    JOIN books b ON i.book_id = b.id
    GROUP BY i.book_id
    ORDER BY timesIssued DESC
    LIMIT 5
");

while ($row = mysqli_fetch_assoc($q5)) {
    $bookNames[] = $row['book_name'];
    $issueNumbers[] = $row['timesIssued'];
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Circulation Report</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        body {
            font-family: Arial;
            margin: 0;
            background: #f1f4fb;
        }
        .container { padding: 20px 40px; }
        h1 { margin-bottom: 10px; }

        /* Dashboard Cards */
        .cards { display: flex; gap: 20px; margin-top: 20px; }
        .card {
            background: white;
            padding: 25px;
            width: 260px;
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
        }
        .number {
            font-size: 42px;
            font-weight: bold;
            color: #2b4eff;
        }

       
        .chart-box {
            margin-top: 40px;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
            width: 95%;
        }

        .charts-grid {
            display: grid;
            grid-template-columns: 60% 35%;
            gap: 30px;
            margin-top: 30px;
        }
    </style>
</head>

<body>

<div class="container">
    <h1>Circulation Report</h1>
    <p>Dashboard overview of issue/return activity and most issued books.</p>

    <div class="cards">
        <div class="card">
            <h3>Total Issued</h3>
            <div class="number"><?= $issued ?></div>
        </div>

        <div class="card">
            <h3>Total Returned</h3>
            <div class="number"><?= $returned ?></div>
        </div>

        <div class="card">
            <h3>Overdue Books</h3>
            <div class="number"><?= $overdue ?></div>
        </div>
    </div>

    <div class="charts-grid">

        
        <div class="chart-box">
            <h2>Issued vs Returned (Month-wise)</h2>
            <canvas id="lineChart"></canvas>
        </div>

        
        <div class="chart-box">
            <h2>Top 5 Most Issued Books</h2>
            <canvas id="pieChart"></canvas>
        </div>

    </div>
</div>

<script>
// GRAPH 1: LINE CHART (Issued vs Returned)
new Chart(document.getElementById('lineChart'), {
    type: 'line',
    data: {
        labels: <?= json_encode($months) ?>,
        datasets: [
            {
                label: 'Issued',
                data: <?= json_encode($issuedCounts) ?>,
                borderWidth: 3
            },
            {
                label: 'Returned',
                data: <?= json_encode($returnCounts) ?>,
                borderWidth: 3
            }
        ]
    }
});

new Chart(document.getElementById('pieChart'), {
    type: 'pie',
    data: {
        labels: <?= json_encode($bookNames) ?>,
        datasets: [{
            data: <?= json_encode($issueNumbers) ?> 
        }]
    }
});
</script>

</body>
</html>
