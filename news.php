<?php
include_once 'includes/config.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>All News | BookBridge</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<section class="news-preview-section container my-5">
  <h2 class="custom-heading">All News</h2>

  <div class="row justify-content-center">
    <?php
$sql = "SELECT id, title, short_description, image 
        FROM news 
        ORDER BY created_at DESC";
$result = $conn->query($sql);
?>
<?php while($row = $result->fetch_assoc()): ?>
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

<?php include 'includes/footer.php'; // agar hai ?>

</body>
</html>
