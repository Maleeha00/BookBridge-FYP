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
</head>
<?php if ($news): ?>
<body>
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