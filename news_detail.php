<?php
include 'news_data.php';

$id = $_GET['id'] ?? null;
$selectedNews = null;

foreach ($newsList as $news) {
  if ($news['id'] == $id) {
    $selectedNews = $news;
    break;
  }
}

if (!$selectedNews) {
  echo "<h2>News not found</h2>";
  exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title><?= $selectedNews['title']; ?></title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="container my-5">
  <h2><?= $selectedNews['title']; ?></h2>
  <small class="text-muted"><?= $selectedNews['date']; ?></small>

  <img src="<?= $selectedNews['image']; ?>" class="img-fluid my-3">

  <p><?= $selectedNews['content']; ?></p>

  <a href="index.php" class="btn btn-outline-primary mt-3">← Back</a>
</div>

</body>
</html>
