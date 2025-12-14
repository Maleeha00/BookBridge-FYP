<?php
include 'includes/config.php';
session_start();

$book_id = $_GET['id'];
$user_id = $_SESSION['user_id'];  // your system uses session user_id

// Fetch book details
$book = $conn->query("SELECT * FROM books WHERE id=$book_id")->fetch_assoc();

// Fetch ratings
$ratings = $conn->query("SELECT * FROM ratings WHERE book_id=$book_id");

// Calculate Average Rating
$avg = $conn->query("SELECT AVG(rating) as avg_rating, COUNT(*) as total FROM ratings WHERE book_id=$book_id")->fetch_assoc();
$average_rating = round($avg['avg_rating'], 1);
$total_ratings = $avg['total'];
if ($total_ratings == 0) { $average_rating = 0; }

// Star breakdown
$stars = [];
for($i=1; $i<=5; $i++){
    $count = $conn->query("SELECT COUNT(*) AS c FROM ratings WHERE book_id=$book_id AND rating=$i")->fetch_assoc();
    $stars[$i] = $count['c'];
}
?>

<!DOCTYPE html>
<html>
<head>
<title><?php echo $book['title']; ?></title>
<style>
body { background:#111; color:white; font-family:Arial; padding:20px; }
.container { display:flex; gap:30px; }
.left img { width:230px; border-radius:10px; }
.rating-box { background:#1c1c1c; padding:20px; border-radius:12px; width:100%; }
.bar { height:10px; background:#333; border-radius:10px; margin:5px 0; }
.fill { height:10px; background:#4CAF50; border-radius:10px; }
.review-box { background:#1c1c1c; padding:20px; border-radius:12px; margin-top:20px; }
input, textarea { width:100%; padding:10px; margin:10px 0; border-radius:8px; border:none; }
button { padding:10px 20px; background:#007bff; border:none; color:white; border-radius:8px; cursor:pointer; }
</style>
</head>
<body>

<div class="container">

    <!-- LEFT SIDE (Book Cover) -->
    <div class="left">
        <img src="uploads/<?php echo $book['cover_image']; ?>">
    </div>

    <!-- CENTER SIDE (Rating Panel) -->
    <div class="right">
        <div class="rating-box">
            <h2><?php echo $book['title']; ?></h2>

            <h1><?php echo $average_rating; ?> ★</h1>
            <p>Based on <?php echo $total_ratings; ?> ratings</p>

            <?php for($i=5; $i>=1; $i--): 
                $percentage = $total_ratings > 0 ? ($stars[$i] / $total_ratings) * 100 : 0;
            ?>
                <p><?php echo $i; ?> Stars</p>
                <div class="bar"><div class="fill" style="width:<?php echo $percentage; ?>%"></div></div>
            <?php endfor; ?>

            <h3>Write a Review</h3>
            <form method="POST" action="rate_submit.php">
                <input type="hidden" name="book_id" value="<?php echo $book_id; ?>">

                <label>Rating (1-5)</label>
                <input type="number" name="rating" min="1" max="5" required>

                <label>Your Review</label>
                <textarea name="review" required></textarea>

                <button type="submit">Submit</button>
            </form>

        </div>
    </div>

</div>

<!-- USER REVIEWS -->
<div class="review-box">
    <h2>User Reviews</h2>

    <?php while($r = $ratings->fetch_assoc()): ?>
        <div style="margin-bottom:15px;">
            <strong><?php echo $r['rating']; ?> ★</strong>
            <p><?php echo $r['review']; ?></p>
            <small><?php echo $r['created_at']; ?></small>
            <hr>
        </div>
    <?php endwhile; ?>

</div>

</body>
</html>
