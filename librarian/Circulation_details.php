<?php
include_once '../includes/header.php';

// ===== BASIC STATS =====
$q1 = mysqli_query($conn, "SELECT COUNT(*) AS total FROM issued_books WHERE status='issued'");
$issued = mysqli_fetch_assoc($q1)['total'];

$q2 = mysqli_query($conn, "SELECT COUNT(*) AS total FROM issued_books WHERE status='returned'");
$returned = mysqli_fetch_assoc($q2)['total'];

$q3 = mysqli_query($conn, "SELECT COUNT(*) AS total FROM issued_books WHERE status='overdue'");
$overdue = mysqli_fetch_assoc($q3)['total'];

$q4 = mysqli_query($conn, "SELECT COUNT(*) AS total FROM books");
$totalBooks = mysqli_fetch_assoc($q4)['total'];

$q5 = mysqli_query($conn, "SELECT COUNT(DISTINCT user_id) AS total FROM issued_books");
$activeUsers = mysqli_fetch_assoc($q5)['total'];


// ===== MONTHLY TRENDS =====
$months = []; 
$issuedCounts = []; 
$returnCounts = [];

$q6 = mysqli_query($conn, "
    SELECT DATE_FORMAT(issue_date, '%b') AS month,
           SUM(status='issued') AS issuedCount,
           SUM(status='returned') AS returnedCount
    FROM issued_books
    GROUP BY MONTH(issue_date)
    ORDER BY MONTH(issue_date)
");

while ($row = mysqli_fetch_assoc($q6)) {
    $months[] = $row['month'];
    $issuedCounts[] = $row['issuedCount'];
    $returnCounts[] = $row['returnedCount'];
}


// ===== TOP ISSUED BOOKS =====
$bookNames = [];
$issueNumbers = [];

$q7 = mysqli_query($conn, "
    SELECT b.book_name, COUNT(i.book_id) AS timesIssued
    FROM issued_books i
    JOIN books b ON i.book_id=b.id
    GROUP BY i.book_id
    ORDER BY timesIssued DESC
    LIMIT 7
");
while ($row = mysqli_fetch_assoc($q7)) {
    $bookNames[] = $row['book_name'];
    $issueNumbers[] = $row['timesIssued'];
}


// ===== TOP RETURNED BOOKS =====
$returnBookNames=[];
$returnBookCounts=[];

$q8 = mysqli_query($conn, "
    SELECT b.book_name, COUNT(i.book_id) AS timesReturned
    FROM issued_books i
    JOIN books b ON i.book_id=b.id
    WHERE status='returned'
    GROUP BY i.book_id
    ORDER BY timesReturned DESC
    LIMIT 7
");

while($row=mysqli_fetch_assoc($q8)){
    $returnBookNames[]=$row['book_name'];
    $returnBookCounts[]=$row['timesReturned'];
}

?>
<!DOCTYPE html>
<html>
<head>
<title>Circulation Analytics Report</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
body {
    font-family: Arial;
    margin: 0;
    background: #f3f6ff;
}
.report {
    width: 90%;
    margin: auto;
    background: #fff;
    padding: 30px;
    border-radius: 15px;
    margin-top: 30px;
}
h1 { text-align: center; color: #2b4eff; }
.section-title {
    margin-top: 40px;
    padding-left: 10px;
    border-left: 4px solid #2b4eff;
    font-size: 22px;
}
.text-block {
    background: #eef2ff;
    padding: 15px;
    border-left: 4px solid #2b4eff;
    margin-top: 10px;
    border-radius: 8px;
}
.chart-container { margin-top: 20px; }
</style>
</head>

<body>

<div class="report">
<h1>Library Circulation Analytics Report</h1>
<p style="text-align:center;">Date: <?= date("d M, Y") ?></p>

<h2 class="section-title">1. Executive Summary</h2>
<div class="text-block">
The circulation activity of the library shows the overall borrowing behavior of students and faculty.
During this period, the library recorded <b><?= $issued ?></b> book issues, 
<b><?= $returned ?></b> returns, and <b><?= $overdue ?></b> overdue items.
A total of <b><?= $activeUsers ?></b> unique users interacted with the system, indicating active library engagement.
</div>


<!-- ================= KEY METRICS ================= -->
<h2 class="section-title">2. Key Metrics Overview</h2>
<div class="text-block">
<b>Total Books:</b> <?= $totalBooks ?><br>
<b>Total Issued:</b> <?= $issued ?><br>
<b>Total Returned:</b> <?= $returned ?><br>
<b>Total Overdue:</b> <?= $overdue ?><br>
<b>Active Users:</b> <?= $activeUsers ?><br><br>

These numbers suggest the general health of the library’s circulation system. High return rates indicate responsible borrowing, 
while higher overdue numbers may suggest need for reminders or policy changes.
</div>


<!-- ================= AREA CHART ================= -->
<h2 class="section-title">3. Monthly Trends (Issued vs Returned)</h2>
<div class="chart-container">
    <canvas id="areaChart"></canvas>
</div>


<!-- ================= HORIZONTAL BAR CHART ================= -->
<h2 class="section-title">4. Top 7 Most Issued Books</h2>
<div class="chart-container">
    <canvas id="horizontalBar"></canvas>
</div>


<!-- ================= POLAR AREA CHART ================= -->
<h2 class="section-title">5. Top Returned Books</h2>
<div class="chart-container">
    <canvas id="polarChart"></canvas>
</div>


<!-- ================= DOUGHNUT ================= -->
<h2 class="section-title">6. Overdue vs Returned Ratio</h2>
<div class="chart-container">
    <canvas id="doughnutChart"></canvas>
</div>

</div>

<script>
// AREA CHART
new Chart(document.getElementById('areaChart'), {
    type: 'line',
    data: {
        labels: <?= json_encode($months) ?>,
        datasets: [{
            label: 'Issued',
            data: <?= json_encode($issuedCounts) ?>,
            fill: true,
            borderWidth: 3
        },
        {
            label: 'Returned',
            data: <?= json_encode($returnCounts) ?>,
            fill: true,
            borderWidth: 3
        }]
    }
});


// HORIZONTAL BAR
new Chart(document.getElementById('horizontalBar'), {
    type: 'bar',
    data: {
        labels: <?= json_encode($bookNames) ?>,
        datasets: [{
            data: <?= json_encode($issueNumbers) ?>,
            borderWidth: 2
        }]
    },
    options: { indexAxis: 'y' }
});


// POLAR AREA
new Chart(document.getElementById('polarChart'), {
    type: 'polarArea',
    data: {
        labels: <?= json_encode($returnBookNames) ?>,
        datasets: [{
            data: <?= json_encode($returnBookCounts) ?>
        }]
    }
});

// DOUGHNUT
new Chart(document.getElementById('doughnutChart'), {
    type: 'doughnut',
    data: {
        labels: ['Returned', 'Overdue'],
        datasets: [{
            data: [<?= $returned ?>, <?= $overdue ?>]
        }]
    }
});
</script>

</body>
</html>
