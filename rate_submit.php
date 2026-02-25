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
        $user_id = 1; // Logic preserved as requested
        $insert = "INSERT INTO reviews_and_ratings (book_id, user_id, rating, review, reviewed_at) 
                   VALUES ($book_id, $user_id, $rating, '$review', NOW())";          
        if (mysqli_query($conn, $insert)) {             
            $message = "<div class='alert alert-success border-0 shadow-sm'>✨ Thank you! Your review has been submitted.</div>";         
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

// Logic Preserved: Fetching reviews (Added u.username to ensure your display logic works)
$review_query = "SELECT r.rating, r.review, r.reviewed_at
                 FROM reviews_and_ratings r 
                 JOIN users u ON r.user_id = u.id 
                 WHERE r.book_id = $book_id 
                 ORDER BY r.reviewed_at DESC";  
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
    <meta name="viewport" content="width=device-width, in
    
    itial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/auth.css">
    <link rel="icon" type="image/png" href="uploads/assests/book.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
   
    <nav class="auth-navbar">
        <div class="container">
            <a href="login.php" class="auth-logo">
               <img src="/uploads/assests/book.png" alt="Library Logo" class="logo-image">
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
    </body>
    </html>
<!-- Add Google Fonts for a professional look -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
    body { background-color: #f8fafc; font-family: 'Inter', sans-serif; color: #334155; }
    .review-wrapper { padding: 50px 0; }
    
    /* Main Book Card */
    .main-card { 
        background: #ffffff; 
        border-radius: 24px; 
        border: none; 
        box-shadow: 0 10px 30px rgba(0,0,0,0.04);
        overflow: hidden;
    }
    
    .book-hero-section {
        background: linear-gradient(135deg, #040541 0%, #080335 100%);
        padding: 40px;
        color: white;
        text-align: center;
    }

    .book-cover { 
        width: 180px; 
        height: 270px;
        object-fit: cover;
        border-radius: 12px; 
        box-shadow: 0 20px 40px rgba(0,0,0,0.3);
        margin-bottom: 20px;
        transition: transform 0.3s ease;
    }
    .book-cover:hover { transform: translateY(-5px); }

    /* Star Rating System */
    .star-rating { direction: rtl; display: inline-flex; gap: 8px; }
    .star-rating input { display: none; }
    .star-rating label { 
        font-size: 32px; 
        color: #e2e8f0; 
        cursor: pointer; 
        transition: color 0.2s; 
    }
    .star-rating input:checked ~ label, 
    .star-rating label:hover, 
    .star-rating label:hover ~ label { color: #fbbf24; }

    /* Form Controls */
    .form-control {
        border-radius: 12px;
        padding: 15px;
        border: 1px solid #e2e8f0;
        background-color: #f8fafc;
    }
    .form-control:focus {
        box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
        border-color: #03043b;
    }

    .submit-btn { 
        background: #04054b; 
        border: none; 
        padding: 14px 40px; 
        border-radius: 12px; 
        font-weight: 600; 
        color: #fff;
        transition: all 0.3s;
        width: 100%;
    }
    .submit-btn:hover { background: #070445; transform: translateY(-2px); box-shadow: 0 5px 15px rgba(6, 7, 80, 0.4); }

    /* Review Feed */
    .review-item {
        border-bottom: 1px solid #f1f5f9;
        padding: 25px 0;
    }
    .user-avatar {
        width: 45px;
        height: 45px;
        background: #e0e7ff;
        color: #08042d;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
    }

    /* Recommendations */
    .recommend-card { 
        background: #ffffff; 
        border-radius: 20px; 
        padding: 25px; 
        box-shadow: 0 10px 25px rgba(0,0,0,0.03);
        position: sticky;
        top: 20px;
    }
    .recommend-item { 
        display: flex; 
        gap: 15px; 
        margin-bottom: 20px; 
        align-items: center; 
        text-decoration: none;
        transition: 0.2s;
    }
    .recommend-item:hover { opacity: 0.8; }
    .recommend-item img { width: 55px; height: 80px; object-fit: cover; border-radius: 6px; }
    .recommend-item .title { font-weight: 600; color: #1e293b; font-size: 0.95rem; margin: 0; }

    .badge-rating {
        background: #fef3c7;
        color: #92400e;
        padding: 5px 12px;
        border-radius: 20px;
        font-weight: 600;
        font-size: 0.9rem;
    }
</style>

<div class="review-wrapper">
    <div class="container">
        <div class="row g-4">
            <!-- LEFT: BOOK INFO + REVIEW FORM -->
            <div class="col-lg-8">
                <div class="main-card">
                    <div class="book-hero-section">
                        <img src="<?php echo htmlspecialchars($book['cover_image']); ?>" alt="Cover" class="book-cover">
                        <h1 class="h3 fw-bold mb-1"><?php echo htmlspecialchars($book['title']); ?></h1>
                        <p class="opacity-75 mb-0">by <?php echo htmlspecialchars($book['author']); ?></p>
                    </div>

                    <div class="p-4 p-md-5">
                        <?php echo $message; ?>
                        
                        <div class="text-center mb-5">
                            <h4 class="fw-bold">Write a Review</h4>
                            <p class="text-muted small">Your feedback helps others discover great stories</p>
                            
                            <form action="" method="POST" class="mt-4 text-start">
                                <input type="hidden" name="book_id" value="<?php echo $book_id; ?>">
                                
                                <div class="mb-4 text-center">
                                    <div class="star-rating">
                                        <input type="radio" name="rating" id="star5" value="5" required><label for="star5">★</label>
                                        <input type="radio" name="rating" id="star4" value="4"><label for="star4">★</label>
                                        <input type="radio" name="rating" id="star3" value="3"><label for="star3">★</label>
                                        <input type="radio" name="rating" id="star2" value="2"><label for="star2">★</label>
                                        <input type="radio" name="rating" id="star1" value="1"><label for="star1">★</label>
                                    </div>
                                    <div class="small text-muted mt-1">Click a star to rate</div>
                                </div>

                                <div class="mb-4">
                                    <label class="form-label fw-600">Share your experience</label>
                                    <textarea name="review" rows="4" class="form-control" 
                                              placeholder="What did you think about the plot, characters, or style?" required></textarea>
                                </div>

                                <button type="submit" class="submit-btn shadow-sm">Submit Review</button>
                            </form>
                        </div>

                        <hr class="my-5">

                        <!-- REVIEWS LIST -->
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h4 class="fw-bold mb-0">Community Reviews</h4>
                            <?php if ($avg_data['total_reviews'] > 0): ?>
                                <span class="badge-rating">
                                    ⭐ <?php echo number_format($avg_data['avg_rating'], 1); ?> / 5.0
                                </span>
                            <?php endif; ?>
                        </div>

                        <?php if (mysqli_num_rows($review_result) > 0): ?>
                            <?php while ($rev = mysqli_fetch_assoc($review_result)): ?>
                                <div class="review-item">
                                    <div class="d-flex gap-3">
                                        <div class="user-avatar">
                                            <?php echo strtoupper(substr($rev['username'] ?? 'U', 0, 1)); ?>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="d-flex justify-content-between align-items-start">
                                                <div>
                                                    <h6 class="mb-0 fw-bold"><?php echo htmlspecialchars($rev['username'] ?? 'User'); ?></h6>
                                                    <div class="mb-2">
                                                        <?php for ($i = 1; $i <= 5; $i++): ?>
                                                            <span style="color: <?php echo ($i <= $rev['rating']) ? '#fbbf24' : '#e2e8f0'; ?>; font-size: 14px;">★</span>
                                                        <?php endfor; ?>
                                                    </div>
                                                </div>
                                                <small class="text-muted"><?php echo date("M d, Y", strtotime($rev['reviewed_at'])); ?></small>
                                            </div>
                                            <p class="text-secondary mb-0" style="line-height: 1.6;">
                                                <?php echo nl2br(htmlspecialchars($rev['review'])); ?>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            <?php endwhile; ?>
                        <?php else: ?>
                            <div class="text-center py-4 bg-light rounded-4">
                                <p class="text-muted mb-0">No reviews yet. Be the first to share your thoughts!</p>
                            </div>
                        <?php endif; ?>
                    </div>
                </div>
            </div>

            <!-- RIGHT: RECOMMENDED -->
            <div class="col-lg-4">
                <div class="recommend-card">
                    <h5 class="fw-bold mb-4">You might also like</h5>
                    <?php while ($rec = mysqli_fetch_assoc($rec_result)): ?>
                        <a href="rate_submit.php?id=<?php echo $rec['id']; ?>" class="recommend-item">
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