<?php include 'news_data.php'; ?>

<section class="container my-5">
  <h2 class="custom-heading">Latest News</h2>

  <?php foreach ($newsList as $news): ?>
    <div class="mb-3 pb-3 border-bottom">
      <h5>
        <a href="news_detail.php?id=<?= $news['id']; ?>" class="text-decoration-none">
          <?= $news['title']; ?>
        </a>
      </h5>
      <p class="text-muted mb-1"><?= $news['short']; ?></p>
      <small class="text-secondary"><?= $news['date']; ?></small>
    </div>
  <?php endforeach; ?>

</section>
