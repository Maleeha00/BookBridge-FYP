<?php

include_once '../includes/config.php';
session_start();

$user_id = $_SESSION['user_id'];

// Fetch user class
$user_sql = "SELECT class FROM users WHERE id = ?";
$stmt = $conn->prepare($user_sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$user_result = $stmt->get_result()->fetch_assoc();
$user_class = $user_result['class'];

// Map class → category
$mapped_category = "";

if (stripos($user_class, "IT") !== false) {
    $mapped_category = "Computer";
} elseif (stripos($user_class, "ENG") !== false) {
    $mapped_category = "English";
} elseif (stripos($user_class, "HPE") !== false) {
    $mapped_category = "Health";
} else {
    $mapped_category = $user_class; 
}

// Fetch recommended books
$sql = "
    SELECT b.id, b.book_name, b.publisher, b.category,
           COUNT(ib.book_id) AS issue_count
    FROM issued_books ib
    JOIN books b ON ib.book_id = b.id
    WHERE b.category LIKE ?
    GROUP BY b.id
    ORDER BY issue_count DESC
    LIMIT 8
";

$likeCategory = "%$mapped_category%";
$stmt2 = $conn->prepare($sql);
$stmt2->bind_param("s", $likeCategory);
$stmt2->execute();
$recommendations = $stmt2->get_result();

?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>Recommended Books</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />

<style>
body {
    background: #f2f5f9;
    font-family: 'Poppins', sans-serif;
}

.header-title {
    font-size: 36px;
    font-weight: 700;
    color: #222;
}

.reco-card {
    border: none;
    border-radius: 18px;
    overflow: hidden;
    background: rgba(255, 255, 255, 0.9);
    backdrop-filter: blur(10px);
    transition: 0.3s ease-in-out;
}

.reco-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

.card-title {
    font-size: 1.15rem;
    font-weight: 700;
    color: #333;
}

.card-text {
    font-size: 0.9rem;
}
</style>
</head>

<body>

<div class="container mt-5">
    <h2 class="text-center header-title">Recommended Books for You</h2>
    <p class="text-center text-muted">
        Based on your class:
        <strong><?php echo $user_class; ?></strong>  
        → Showing books for category:
        <strong><?php echo $mapped_category; ?></strong>
    </p>

    <div class="row g-4 mt-4">

        <?php if ($recommendations->num_rows > 0) { ?>

            <?php while ($row = $recommendations->fetch_assoc()) { ?>
            <div class="col-md-3">
                <div class="card reco-card h-100 p-3">

                    <h5 class="card-title"><?php echo $row['book_name']; ?></h5>

                    <p class="card-text text-muted mb-1">
                        <strong>Publisher:</strong> <?php echo $row['publisher']; ?>
                    </p>

                    <p class="card-text text-muted">
                        <strong>Category:</strong> <?php echo $row['category']; ?>
                    </p>

                </div>
            </div>
            <?php } ?>

        <?php } else { ?>

            <div class="col-12 text-center mt-5">
                <h4 class="text-muted">No recommendations found for your class.</h4>
            </div>

        <?php } ?>

    </div>
</div>

</body>
</html>
