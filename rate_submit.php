<?php
include 'includes/config.php';

$book_id = (int)$_GET['id'];

$query = "SELECT title, cover_image FROM ebooks WHERE id = $book_id";
$result = mysqli_query($conn, $query);
$book = mysqli_fetch_assoc($result);
?>

<style>
.review-card {
  background: linear-gradient(135deg, #ffffff, #f4f6ff);
  border-radius: 16px;
  padding: 30px;
  box-shadow: 0 25px 50px rgba(0,0,0,0.1);
}
.book-cover {
  border-radius: 14px;
  box-shadow: 0 15px 30px rgba(0,0,0,0.2);
}
.star-rating {
  direction: rtl;
  font-size: 30px;
}
.star-rating input {
  display: none;
}
.star-rating label {
  color: #ccc;
  cursor: pointer;
  transition: 0.3s;
}
.star-rating input:checked ~ label,
.star-rating label:hover,
.star-rating label:hover ~ label {
  color: #ffc107;
}
.submit-btn {
  background: linear-gradient(135deg, #2b4eff, #6a7cff);
  border: none;
  padding: 12px 25px;
  border-radius: 30px;
  font-weight: bold;
  color: white;
}
.submit-btn:hover {
  opacity: 0.9;
}
</style>

<div class="container my-5">
  <div class="row justify-content-center">
    <div class="col-lg-10">
      <div class="review-card">
        <div class="row align-items-center">

          
          <div class="col-md-4 text-center mb-3">
            <img src="<?php echo $book['cover_image']; ?>" 
                 class="img-fluid book-cover">
          </div>

          
          <div class="col-md-8">
            <h2 class="mb-2"><?php echo htmlspecialchars($book['title']); ?></h2>
            <p class="text-muted mb-4">
              Share your thoughts — help others choose their next great read 
            </p>

            <form action="rate_submit.php" method="POST">
              <input type="hidden" name="book_id" value="<?php echo $book_id; ?>">

    
              <label class="fw-bold mb-2">Your Rating</label>
              <div class="star-rating mb-4">
                <input type="radio" name="rating" id="star5" value="5" required><label for="star5">★</label>
                <input type="radio" name="rating" id="star4" value="4"><label for="star4">★</label>
                <input type="radio" name="rating" id="star3" value="3"><label for="star3">★</label>
                <input type="radio" name="rating" id="star2" value="2"><label for="star2">★</label>
                <input type="radio" name="rating" id="star1" value="1"><label for="star1">★</label>
              </div>

              
              <label class="fw-bold">Your Review</label>
              <textarea name="review" rows="4"
                        class="form-control mb-4"
                        placeholder="What did you like? Would you recommend it?"
                        required></textarea>

              <button type="submit" class="submit-btn">
                 Submit Review
              </button>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</div>
