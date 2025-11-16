<?php
include '../includes/config.php';
session_start();

$user_id = $_SESSION['user_id'];

$sql = "
    SELECT w.id AS wid, b.*
    FROM wishlist w
    JOIN books b ON w.book_id = b.id
    WHERE w.user_id = ?
    ORDER BY w.created_at DESC
";

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$wishlist = $stmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
<title>My Wishlist</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

<style>
body {
    background: #f9f9f9;
    font-family: 'Poppins', sans-serif;
    color: #333;
}

/* Header */
.page-header {
    text-align: center;
    margin-bottom: 40px;
}

.page-title {
    font-size: 34px;
    font-weight: 700;
    color: #222;
}

.page-subtitle {
    color: #666;
    font-size: 15px;
}

/* Horizontal Card - No Image */
.book-card-horizontal {
    display: flex;
    flex-direction: column;
    align-items: center;
    background: #fff;
    border-radius: 15px;
    padding: 20px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.06);
    transition: 0.3s;
    border: 1px solid #e2e8f0;
    max-width: 500px;
    margin: 15px auto;
    text-align: center;
}

.book-card-horizontal:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 28px rgba(0,0,0,0.1);
}

/* Book Info */
.book-title {
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 8px;
}

.book-info {
    font-size: 14px;
    color: #555;
    margin-bottom: 12px;
}

/* Buttons */
.btn-modern {
    border-radius: 8px;
    font-weight: 500;
    padding: 6px 14px;
    font-size: 14px;
    margin: 3px;
}

.btn-read {
    background: #1d72e7;
    color: #fff;
}
.btn-read:hover {
    background: #155ab8;
}

.btn-reserve {
    background: #32c671;
    color: #fff;
}
.btn-reserve:hover {
    background: #27a55e;
}

.btn-remove {
    background: transparent;
    border: 1px solid #ff6b6b;
    color: #ff6b6b;
}
.btn-remove:hover {
    background: #ff6b6b;
    color: #fff;
}
</style>
</head>
<body>

<div class="container py-5">
    <div class="page-header">
        <h2 class="page-title">My Wishlist</h2>
        <p class="page-subtitle">Your saved books in a clean list view</p>
    </div>

    <?php if ($wishlist->num_rows > 0): ?>
        <?php while ($b = $wishlist->fetch_assoc()): ?>
            <div class="book-card-horizontal">

                <!-- Book Info -->
                <h5 class="book-title"><?php echo $b['book_name']; ?></h5>
                <p class="book-info"><strong>Publisher:</strong> <?php echo $b['publisher']; ?></p>
                <p class="book-info"><strong>Category:</strong> <?php echo $b['category']; ?></p>

                <!-- Buttons -->
                <div>
                    <a href="book_details.php?id=<?php echo $b['id']; ?>" class="btn btn-read btn-modern">📘 Read</a>
                    <a href="reserve.php?book_id=<?php echo $b['id']; ?>" class="btn btn-reserve btn-modern">📝 Reserve</a>
                    <a href="wishlist_remove.php?id=<?php echo $b['wid']; ?>" class="btn btn-remove btn-modern">❌ Remove</a>
                </div>

            </div>
        <?php endwhile; ?>
    <?php else: ?>
        <div class="text-center mt-5">
            <h4 class="text-muted">Your wishlist is empty.</h4>
        </div>
    <?php endif; ?>

</div>

</body>
</html>
