<?php
include_once 'includes/config.php';

$news = null;

if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $news_id = (int) $_GET['id'];

    $sql = "SELECT title, content, image, created_at 
            FROM news 
            WHERE id = $news_id";
    $result = $conn->query($sql);

    if ($result && $result->num_rows > 0) {
        $news = $result->fetch_assoc();
    }
}

?>
<?php
$newsImage = (!empty($news['image']) && file_exists($news['image']))
    ? $news['image']
    : 'uploads/assests/news-default.jpg';
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title><?= htmlspecialchars($news['title']) ?> | News</title>
  <link rel="stylesheet" href="css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&family=Open+Sans&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/auth.css">
    <link rel="icon" type="image/png" href="uploads/assests/book.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<?php if ($news): ?>
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
             <a href="policy.php" class="auth-nav-link">
             <i class="fas fa-envelope"></i>
             <span>Policy</span>
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
                <a href="login.php" class="auth-nav-link">
                    <i class="fas fa-user-plus"></i>
                    <span>Login</span>
                </a>
            </div>
        </div>
    </nav>
    <section class="container my-5">

  <h2 class="custom-heading">
    <?= htmlspecialchars($news['title']) ?>
  </h2>

  <div class="text-center mb-4 text-muted">
    <?= date("F d, Y", strtotime($news['created_at'])) ?>
  </div>

  <div class="text-center mb-4">
    <img src="<?= htmlspecialchars($newsImage) ?>"
     class="img-fluid rounded"
     style="max-height:400px; object-fit:cover;">
  </div>

  <div class="news-preview-body">
    <p style="font-size:16px; line-height:1.8;">
      <?= nl2br(htmlspecialchars($news['content'])) ?>
    </p>
  </div>

  <div class="text-center mt-4">
    <a href="news.php" class="btn btn-outline-primary">
      ← Back to News
    </a>
  </div>
</section><?php else: ?>
  <div class="container my-5 text-center">
    <h3>No News Found</h3>
    <p class="text-muted">The requested news article does not exist.</p>
    <a href="news.php" class="btn btn-outline-primary">
      ← Back to News
    </a>
  </div>
<?php endif; ?>
<?php include 'includes/footer.php'; ?>

</body>
</html>