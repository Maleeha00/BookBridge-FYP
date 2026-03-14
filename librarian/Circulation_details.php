<?php 
include_once '../includes/header.php'; 

// --- DATABASE QUERIES (KEPT EXACTLY AS PER YOUR CODE) ---

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
    <title>Library Circulation Report - <?= date("Y-m-d") ?></title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- ADDED: PDF LIBRARY -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js">
        
    </script>
    
    <style>
        :root { --primary: #1a237e; --secondary: #303f9f; --light: #f5f5f5; --dark: #212121; }
        
        body { font-family: 'Segoe UI', Arial, sans-serif; background: #e0e0e0; margin: 0; padding: 20px 0; color: var(--dark); }
        
        /* Report Sheet Layout */
        .report-page { 
            width: 210mm; /* A4 Width */
            min-height: 297mm;
            margin: auto; 
            background: white; 
            padding: 20mm; 
            box-shadow: 0 0 15px rgba(0,0,0,0.2);
            box-sizing: border-box;
            position: relative;
        }

        /* Header Styling */
        .report-header { border-bottom: 3px solid var(--primary); margin-bottom: 30px; display: flex; justify-content: space-between; align-items: flex-end; padding-bottom: 10px; }
        .report-header h1 { margin: 0; color: var(--primary); font-size: 28px; text-transform: uppercase; }
        
        .no-print-btn { 
            position: fixed; top: 20px; right: 20px; 
            padding: 12px 25px; background: #28a745; color: white; 
            border: none; border-radius: 5px; cursor: pointer; font-weight: bold;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2); z-index: 1000;
        }

        /* ADDED: BOTTOM DOWNLOAD BUTTON STYLE */
        .download-footer-container {
            width: 210mm;
            margin: 20px auto;
            text-align: center;
        }

        .download-btn-bottom {
            padding: 15px 35px;
            background-color: #1a237e;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
            transition: 0.3s;
        }

        .download-btn-bottom:hover {
            background-color: #0d144d;
            transform: translateY(-2px);
        }

        /* Executive Summary Box */
        .summary-box { background: var(--light); padding: 15px; border-left: 5px solid var(--primary); margin-bottom: 30px; line-height: 1.6; }

        /* Grid Layout */
        .metrics-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 15px; margin-bottom: 30px; }
        .metric-card { border: 1px solid #ddd; padding: 15px; text-align: center; border-radius: 8px; }
        .metric-card span { display: block; font-size: 12px; color: #666; text-transform: uppercase; font-weight: bold; }
        .metric-card b { font-size: 24px; color: var(--primary); }

        .charts-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 30px; }
        .chart-container { margin-bottom: 20px; }
        .chart-container h3 { font-size: 16px; border-bottom: 1px solid #eee; padding-bottom: 5px; margin-bottom: 15px; color: var(--secondary); }

        /* Footer */
        .report-footer { margin-top: 50px; padding-top: 20px; border-top: 1px solid #eee; font-size: 12px; color: #777; text-align: center; }

        /* PRINT SETTINGS */
        @media print {
            body { background: white; padding: 0; }
            .report-page { box-shadow: none; width: 100%; margin: 0; padding: 10mm; }
            .no-print-btn, .download-footer-container { display: none; }
            .chart-container { page-break-inside: avoid; }
        }
    </style>
</head>
<body>

<button class="no-print-btn" onclick="window.print()">Print / Save as PDF</button>

<!-- ID 'report-content' added to target this specific area for PDF download -->
<div class="report-page" id="report-content">
    <div class="report-header">
        <div>
            <h1>Library Analytics</h1>
            <p style="margin:5px 0 0 0;">Official Circulation Summary Report</p>
        </div>
        <div style="text-align: right;">
            <strong>Date:</strong> <?= date("d M, Y") ?><br>
            <strong>Status:</strong> Generated System Report
        </div>
    </div>

    <div class="summary-box">
        <strong>Executive Summary:</strong><br>
        As of today, the library has recorded <b><?= $currentlyIssued ?></b> active loans with an overdue rate of <b><?= ($currentlyIssued > 0) ? round(($overdue/$currentlyIssued)*100, 1) : 0 ?>%</b>. 
        In the last 30 days, we welcomed <b><?= $newUsersCount ?></b> new registrations. 
        The inventory shows <b><?= $availableBooks ?></b> books available for immediate borrowing, while <b><?= $damagedBooks + $missingBooks ?></b> items are currently flagged for maintenance or loss.
    </div>

    <div class="metrics-grid">
        <div class="metric-card"><span>Active Loans</span><b><?= $currentlyIssued ?></b></div>
        <div class="metric-card"><span>Total Returns</span><b><?= $totalReturned ?></b></div>
        <div class="metric-card"><span>Overdue</span><b><?= $overdue ?></b></div>
        <div class="metric-card"><span>New Users</span><b><?= $newUsersCount ?></b></div>
    </div>

    <div class="charts-grid">
        <div class="chart-container">
            <h3>Borrowing & Return Trends</h3>
            <canvas id="trendChart" height="200"></canvas>
        </div>

        <div class="chart-container">
            <h3>Inventory Status Summary</h3>
            <canvas id="statusChart" height="200"></canvas>
        </div>

        <div class="chart-container">
            <h3>Most Borrowed Titles</h3>
            <canvas id="mostBorrowedChart" height="200"></canvas>
        </div>

        <div class="chart-container">
            <h3>Most Active Members</h3>
            <canvas id="userChart" height="200"></canvas>
        </div>
    </div>

    <div class="report-footer">
        This report is generated automatically by the Library Management System. 
        &copy; <?= date("Y") ?> Library Administration Department.
    </div>
</div>

<!-- ADDED: NEW DOWNLOAD BUTTON AT THE BOTTOM -->
<div class="download-footer-container">
    <button class="download-btn-bottom" id="download-pdf-btn">Download Full Report (PDF)</button>
    <p style="color: #666; font-size: 13px; margin-top: 10px;">Click the button above to save the analytics as a high-quality PDF.</p>
</div>

<script>
// --- CHART SETTINGS ---
// IMPORTANT: animation: false is required for accurate PDF capturing
Chart.defaults.font.size = 11;
Chart.defaults.font.family = "'Segoe UI', sans-serif";
Chart.defaults.animation = false; // Globally disable animations for PDF accuracy

new Chart(document.getElementById('trendChart'), {
    type: 'line',
    data: {
        labels: <?= json_encode($months) ?>,
        datasets: [
            { label: 'Issued', data: <?= json_encode($issuedTrends) ?>, borderColor: '#1a237e', backgroundColor: '#1a237e', fill: false, tension: 0.3 },
            { label: 'Returned', data: <?= json_encode($returnTrends) ?>, borderColor: '#28a745', backgroundColor: '#28a745', fill: false, tension: 0.3 }
        ]
    },
    options: { responsive: true, maintainAspectRatio: true, plugins: { legend: { position: 'bottom' } } }
});

new Chart(document.getElementById('statusChart'), {
    type: 'doughnut',
    data: {
        labels: ['Available', 'Issued', 'Damaged', 'Missing'],
        datasets: [{
            data: [<?= $availableBooks ?>, <?= $currentlyIssued ?>, <?= $damagedBooks ?>, <?= $missingBooks ?>],
            backgroundColor: ['#28a745', '#1a237e', '#ffc107', '#dc3545'],
            borderWidth: 0
        }]
    },
    options: { responsive: true, maintainAspectRatio: true, plugins: { legend: { position: 'right' } } }
});

new Chart(document.getElementById('mostBorrowedChart'), {
    type: 'bar',
    data: {
        labels: <?= json_encode($mostBorrowedNames) ?>,
        datasets: [{ label: 'Loans', data: <?= json_encode($mostBorrowedCounts) ?>, backgroundColor: '#303f9f' }]
    },
    options: { indexAxis: 'y', responsive: true, maintainAspectRatio: true, plugins: { legend: { display: false } } }
});

new Chart(document.getElementById('userChart'), {
    type: 'bar',
    data: {
        labels: <?= json_encode($userNames) ?>,
        datasets: [{ label: 'Books Borrowed', data: <?= json_encode($userCounts) ?>, backgroundColor: '#5c6bc0' }]
    },
    options: { responsive: true, maintainAspectRatio: true, plugins: { legend: { display: false } } }
});

// --- IMPROVED PDF DOWNLOAD LOGIC ---
document.getElementById('download-pdf-btn').addEventListener('click', function () {
    const btn = this;
    const element = document.getElementById('report-content');
    
    // Change button text to show progress
    btn.innerHTML = "Generating PDF... Please wait";
    btn.style.backgroundColor = "#666";

    // Options to ensure high accuracy
    const opt = {
        margin:       [10, 10, 10, 10], // top, left, bottom, right in mm
        filename:     'Library_Report_<?= date("Y-m-d") ?>.pdf',
        image:        { type: 'jpeg', quality: 1.0 }, // Maximum quality
        html2canvas:  { 
            scale: 2, 
            useCORS: true, 
            logging: false, 
            letterRendering: true,
            windowWidth: 1200 // Forces the 'camera' to see the wide layout
        },
        jsPDF:        { unit: 'mm', format: 'a4', orientation: 'portrait' }
    };

    // Use a small timeout to ensure the DOM has finished all painting
    setTimeout(() => {
        html2pdf().set(opt).from(element).save().then(() => {
            // Reset button after download
            btn.innerHTML = "Download Full Report (PDF)";
            btn.style.backgroundColor = "#1a237e";
        });
    }, 500); 
});
</script>

</body>
</html>