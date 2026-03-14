<?php  
include 'includes/config.php';    

$book_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;    
if ($book_id <= 0) {          
    die("<div class='container mt-5 alert alert-danger'>Invalid Book ID</div>");  
}    

$message = ""; 
if ($_SERVER['REQUEST_METHOD'] === 'POST') {           
    $rating = isset($_POST['rating']) ? (int)$_POST['rating'] : 0;          
    $review = isset($_POST['review']) ? mysqli_real_escape_string($conn, $_POST['review']) : '';            
    if ($rating >= 1 && $rating <= 5 && !empty($review)) {                   
        $user_id = 1; 
        $insert = "INSERT INTO reviews_and_ratings (book_id, user_id, rating, review, reviewed_at)                     
                   VALUES ($book_id, $user_id, $rating, '$review', NOW())";                   
        if (mysqli_query($conn, $insert)) {                          
            $message = "<div class='alert alert-success border-0 shadow-sm'> Thank you! Your review has been submitted.</div>";                  
        } else {                          
            $message = "<div class='alert alert-danger border-0 shadow-sm'>Error submitting review.</div>";                  
        }          
    }  
}   

$query = "SELECT id, title, author, category, type, cover_image FROM ebooks WHERE id = $book_id";  
$result = mysqli_query($conn, $query);  
if (!$result || mysqli_num_rows($result) == 0) {          
    die("<div class='container mt-5 alert alert-warning'>Book not found.</div>");  
}  
$book = mysqli_fetch_assoc($result);   

$rec_query = "SELECT id, title, cover_image FROM ebooks WHERE id != $book_id ORDER BY RAND() LIMIT 4";  
$rec_result = mysqli_query($conn, $rec_query);   

$review_query = "
SELECT r.rating, r.review, r.reviewed_at, u.name
FROM reviews_and_ratings r
JOIN users u ON r.user_id = u.id
WHERE r.book_id = $book_id
";  
$review_result = mysqli_query($conn, $review_query);    

$avg_query = "SELECT AVG(rating) AS avg_rating, COUNT(*) AS total_reviews                
              FROM reviews_and_ratings                
              WHERE book_id = $book_id";   
$avg_result = mysqli_query($conn, $avg_query);  
$avg_data = mysqli_fetch_assoc($avg_result);  
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($book['title']); ?> | BookBridge</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/auth.css">
    <link rel="icon" type="image/png" href="uploads/assests/book.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">

    <style>
        
        body { 
            background-color: #f8fafc; 
            font-family: 'Inter', sans-serif; 
            color: #334155; 
        }
        .book-page-header {
            background: #ffffff;
            border-bottom: 1px solid #e2e8f0;
            padding: 60px 0;
            margin-bottom: 40px;
        }
        
        .hero-flex {
            display: flex;
            gap: 40px;
            align-items: center;
        }

        .main-book-cover {
            width: 200px;
            height: 300px;
            object-fit: cover;
            border-radius: 12px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }

        .content-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.02), 0 2px 4px -1px rgba(0,0,0,0.01);
            border: 1px solid #f1f5f9;
            margin-bottom: 24px;
        }

        .sticky-sidebar {
            position: sticky;
            top: 20px;
        }

        .star-rating { direction: rtl; display: inline-flex; gap: 8px; }
        .star-rating input { display: none; }
        .star-rating label { font-size: 32px; color: #e2e8f0; cursor: pointer; transition: color 0.2s; }
        .star-rating input:checked ~ label, .star-rating label:hover, .star-rating label:hover ~ label { color: #fbbf24; }

        .form-control {
            border-radius: 12px;
            padding: 15px;
            border: 1px solid #e2e8f0;
            background-color: #fcfdfe;
        }

        .submit-btn {
            background: #04054b;
            color: #fff;
            padding: 14px;
            border-radius: 12px;
            font-weight: 600;
            width: 100%;
            border: none;
            transition: 0.3s;
        }
        .submit-btn:hover { background: #000; transform: translateY(-2px); }

        .review-item {
            padding: 25px 0;
            border-bottom: 1px solid #f1f5f9;
        }
        .user-avatar {
            width: 45px; height: 45px;
            background: #e0e7ff; color: #08042d;
            border-radius: 10px;
            display: flex; align-items: center; justify-content: center; font-weight: bold;
        }

        .rec-link {
            display: flex; gap: 15px; text-decoration: none; color: inherit; margin-bottom: 20px;
        }
        .rec-link img { width: 55px; height: 80px; border-radius: 6px; object-fit: cover; }
        .rec-link .title { font-weight: 600; font-size: 0.95rem; margin: 0; }

        @media (max-width: 768px) {
            .hero-flex { flex-direction: column; text-align: center; }
        }
    </style>
</head>
<body>

    <nav class="auth-navbar">
        <div class="container">
            <a href="login.php" class="auth-logo">
               <img src="uploads/assests/book.png" alt="Library Logo" class="logo-image"> 
               <span class="navbar-title">BookBridge</span>
            </a>
            <div class="nav-left-links">
                <a href="index.php" class="auth-nav-link">
                    <i class="fas fa-home"></i>
                    <span>Home</span>
                </a>
                <a href="news.php" class="auth-nav-link">
                    <i class="fa-solid fa-newspaper"></i>
                    <span>News</span>
                </a>
                <a href="contact.php" class="auth-nav-link">
                    <i class="fas fa-envelope"></i>
                    <span>Contact</span>
                </a>
            </div>
            <div class="auth-nav-links">
                <a href="gallery.php" class="auth-nav-link">
                    <i class="fas fa-images"></i>
                    <span>Gallery</span>
                </a>
                <a href="about.php" class="auth-nav-link">
                    <i class="fas fa-info-circle"></i>
                    <span>About</span>
                </a>
            </div>
        </div>
    </nav>
    <header class="book-page-header">
        <div class="container">
            <div class="hero-flex">
                <img src="<?php echo htmlspecialchars($book['cover_image']); ?>" alt="Cover" class="main-book-cover">
                <div>
                    <h1 class="fw-bold display-5 mb-2"><?php echo htmlspecialchars($book['title']); ?></h1>
                    <p class="fs-5 text-muted">By <span class="text-dark fw-semibold"><?php echo htmlspecialchars($book['author']); ?></span></p>
                    
                    <?php if ($avg_data['total_reviews'] > 0): ?>
                        <div class="mt-4 d-flex align-items-center gap-2">
                            <span style="background: #fef3c7; color: #92400e; padding: 6px 15px; border-radius: 20px; font-weight: 700;">
                                ⭐ <?php echo number_format($avg_data['avg_rating'], 1); ?> Rating
                            </span>
                            <span class="text-muted small"><?php echo $avg_data['total_reviews']; ?> Reader Reviews</span>
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </header>

    <div class="container pb-5">
        <div class="row g-5">
            
            <div class="col-lg-7">
                <h3 class="fw-bold mb-4">Community Feed</h3>
                <div class="content-card">
                    <?php if (mysqli_num_rows($review_result) > 0): ?>
                        <?php while ($rev = mysqli_fetch_assoc($review_result)): ?>
                            <div class="review-item">
                                <div class="d-flex gap-3">
                                    <div class="user-avatar">
                                        <?php echo strtoupper(substr($rev['username'] ?? 'U', 0, 1)); ?>
                                    </div>
                                    <div class="flex-grow-1">
                                        <div class="d-flex justify-content-between">
                                            <h6 class="mb-1 fw-bold"><?php echo htmlspecialchars($rev['username'] ?? 'User'); ?></h6>
                                            <small class="text-muted"><?php echo date("M d, Y", strtotime($rev['reviewed_at'])); ?></small>
                                        </div>
                                        <div class="mb-2">
                                            <?php for ($i = 1; $i <= 5; $i++): ?>
                                                <span style="color: <?php echo ($i <= $rev['rating']) ? '#fbbf24' : '#e2e8f0'; ?>;">★</span>
                                            <?php endfor; ?>
                                        </div>
                                        <p class="text-secondary mb-0" style="line-height: 1.7;">
                                            <?php echo nl2br(htmlspecialchars($rev['review'])); ?>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <div class="text-center py-5">
                            <p class="text-muted">No reviews yet. Be the first to share your thoughts!</p>
                        </div>
                    <?php endif; ?>
                </div>
            </div>

            <div class="col-lg-5">
                <div class="sticky-sidebar">
                    <?php echo $message; ?>

                    <div class="content-card">
                        <h4 class="fw-bold mb-3">Write a Review</h4>
                        <form action="" method="POST">
                            <div class="mb-4 text-center">
                                <div class="star-rating">
                                    <input type="radio" name="rating" id="star5" value="5" required><label for="star5">★</label>
                                    <input type="radio" name="rating" id="star4" value="4"><label for="star4">★</label>
                                    <input type="radio" name="rating" id="star3" value="3"><label for="star3">★</label>
                                    <input type="radio" name="rating" id="star2" value="2"><label for="star2">★</label>
                                    <input type="radio" name="rating" id="star1" value="1"><label for="star1">★</label>
                                </div>
                                <div class="small text-muted mt-1">Tap a star to rate</div>
                            </div>

                            <div class="mb-4">
                                <label class="form-label fw-600">Share your experience</label>
                                <textarea name="review" rows="5" class="form-control" placeholder="What did you think about the book?" required></textarea>
                            </div>

                            <button type="submit" class="submit-btn shadow-sm">Submit Review</button>
                        </form>
                    </div>
                    <div class="content-card">
                        <h5 class="fw-bold mb-4">Recommended for you</h5>
                        <?php while ($rec = mysqli_fetch_assoc($rec_result)): ?>
                            <a href="rate_submit.php?id=<?php echo $rec['id']; ?>" class="rec-link">
                                <img src="<?php echo htmlspecialchars($rec['cover_image']); ?>" alt="Book">
                                <div>
                                    <p class="title"><?php echo htmlspecialchars($rec['title']); ?></p>
                                    <span class="text-muted small">View Details →</span>
                                </div>
                            </a>
                        <?php endwhile; ?>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>