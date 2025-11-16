<?php

include 'includes/config.php'; 
session_start();

$user_id = $_SESSION['user_id'];

$user_sql = "SELECT class FROM users WHERE id = ?";
$stmt = $conn->prepare($user_sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$user_result = $stmt->get_result()->fetch_assoc();
$user_class = $user_result['class'];
$sql = "
    SELECT b.id, b.book_name, b.publisher, b.category,
           COUNT(ib.book_id) AS issue_count
    FROM issued_books ib
    JOIN books b ON ib.book_id = b.id
    WHERE b.category = ?
    GROUP BY b.id
    ORDER BY issue_count DESC
    LIMIT 8
";

$stmt2 = $conn->prepare($sql);
$stmt2->bind_param("s", $user_class);
$stmt2->execute();
$recommendations = $stmt2->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Recommended Books</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4 text-center fw-bold">Recommended Books for You</h2>
    <p class="text-center text-muted">Based on your class: <strong><?php echo $user_class; ?></strong></p>
    <div class="row g-4 mt-4">
        <?php while ($row = $recommendations->fetch_assoc()) { ?>
            <div class="col-md-3">
                <div class="card shadow-sm border-0 h-100">
                    <div class="card-body">
                        <h5 class="card-title fw-bold"><?php echo $row['book_name']; ?></h5>
                        <p class="card-text small text-muted mb-1"><strong>Publisher:</strong> <?php echo $row['publisher']; ?></p>
                        <p class="card-text small text-muted"><strong>Category:</strong> <?php echo $row['category']; ?></p>
                    </div>
                </div>
            </div>
        <?php } ?>
    </div>
</div>
</body>
</html>