<?php
include 'includes/config.php';

$book_id = (int)$_GET['id'];

// Current book
$query = "SELECT title, cover_image FROM ebooks WHERE id = $book_id";
$result = mysqli_query($conn, $query);
$book = mysqli_fetch_assoc($result);

// Recommended books (simple logic for now)
$rec_query = "SELECT id, title, cover_image 
              FROM ebooks 
              WHERE id != $book_id 
              ORDER BY RAND() 
              LIMIT 3";
$rec_result = mysqli_query($conn, $rec_query);
?>

<style>
.review-wrapper {
  padding-bottom: 60px;
}

.review-card {
  background: linear-gradient(135deg, #ffffff, #f4f6ff);
  border-radius: 18px;
  padding: 35px;
  box-shadow: 0 25px 50px rgba(0,0,0,0.12);
}

.book-cover {
  max-width: 220px;
  border-radius: 14px;
  box-shadow: 0 15px 30px rgba(0,0,0,0.25);
}

.star-rating {
  direction: rtl;
  font-size: 28px;
  display: inline-flex;
  gap: 6px;
}

.star-rating input {
  display: none;
}

.star-rating label {
  color: #ccc;
  cursor: pointer;
}

.star-rating input:checked ~ label,
.star-rating label:hover,
.star-rating label:hover ~ label {
  color: #ffc107;
}

.submit-btn {
  background: linear-gradient(135deg, #2b4eff, #6a7cff);
  border: none;
  padding: 12px 32px;
  border-radius: 30px;
  font-weight: 600;
  color: #fff;
}

.recommend-card {
  background: #ffffff;
  border-radius: 18px;
  padding: 25px;
  box-shadow: 0 15px 30px rgba(0,0,0,0.08);
}

.recommend-item {
  display: flex;
  gap: 12px;
  margin-bottom: 16px;
  align-items: center;
}

.recommend-item img {
  width: 60px;
  height: 90px;
  object-fit: cover;
  border-radius: 8px;
}

.recommend-item a {
  text-decoration: none;
  font-weight: 600;
  color: #2b4eff;
}

.recommend-item a:hover {
  text-decoration: underline;
}
</style>

<div class="review-wrapper">
  <div class="container">
    <div class="row g-4">

  <div class="col-lg-8">
    <div class="review-card">

      <div class="text-center mb-4">
        <img src="<?php echo $book['cover_image']; ?>" 
             alt="Book Cover"
             class="img-fluid book-cover">
      </div>

      <h2 class="mb-2"><?php echo htmlspecialchars($book['title']); ?></h2>
      <p class="text-muted mb-4">
        Share your thoughts — help others choose their next great read
      </p>

      <form action="rate_submit.php" method="POST">
        <input type="hidden" name="book_id" value="<?php echo $book_id; ?>">

        <div class="mb-4">
          <div class="d-flex align-items-center gap-3">
            <span class="fw-bold">Your Rating:</span>
            <div class="star-rating">
              <input type="radio" name="rating" id="star5" value="5" required><label for="star5">★</label>
              <input type="radio" name="rating" id="star4" value="4"><label for="star4">★</label>
              <input type="radio" name="rating" id="star3" value="3"><label for="star3">★</label>
              <input type="radio" name="rating" id="star2" value="2"><label for="star2">★</label>
              <input type="radio" name="rating" id="star1" value="1"><label for="star1">★</label>
            </div>
          </div>
        </div>

        <label class="fw-bold mb-2">Your Review</label>
        <textarea name="review"
                  rows="4"
                  class="form-control mb-4"
                  placeholder="What did you like? Would you recommend it?"
                  required></textarea>

        <button type="submit" class="submit-btn">
          Submit Review
        </button>
      </form>

    </div>
  </div>
  <div class="col-lg-4">
    <div class="recommend-card">
      <h5 class="mb-3">Recommended Books</h5>

      <?php while ($rec = mysqli_fetch_assoc($rec_result)): ?>
        <div class="recommend-item">
          <img src="<?php echo $rec['cover_image']; ?>" alt="Book">
          <div>
            <a href="rate.php?id=<?php echo $rec['id']; ?>">
              <?php echo htmlspecialchars($rec['title']); ?>
            </a>
          </div>
        </div>
      <?php endwhile; ?>

    </div>
  </div>

</div>
