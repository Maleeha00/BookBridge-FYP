<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Gallery | BookBridge</title>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display&family=Open+Sans&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/auth.css">
  <link rel="icon" type="image/png" href="uploads/assests/book.png">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <?php
  include_once 'includes/config.php';
  ?>

<body>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    .new {
      padding-top: 30px;
    }
  </style>

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
  <div class="new">
    <section class="news-preview-section container my-5">
      <h2 class="custom-heading">All News</h2>

      <div class="row justify-content-center">
        <?php
        $sql = "SELECT id, title, short_description, image 
        FROM news 
        ORDER BY created_at DESC";
        $result = $conn->query($sql);
        ?>
        <?php while ($row = $result->fetch_assoc()): ?>
          <div class="col-md-4 mb-4">
            <div class="news-preview-card">
              <img src="<?= htmlspecialchars($row['image']) ?>" alt="News">

              <div class="news-preview-body">
                <h5><?= htmlspecialchars($row['title']) ?></h5>
                <p><?= htmlspecialchars($row['short_description']) ?></p>

                <a href="news_detail.php?id=<?= $row['id'] ?>" class="read-more-link">
                  Read more →
                </a>
              </div>
            </div>
          </div>
        <?php endwhile; ?>
      </div>
    </section>
  </div>
  <?php include 'includes/footer.php'; // agar hai ?>

</body>

</html>