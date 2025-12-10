<?php
include 'includes/config.php';
session_start();

$user_id = $_SESSION['user_id'];
$book_id = $_POST['book_id'];
$rating = $_POST['rating'];
$review = $_POST['review'];

$stmt = $conn->prepare("INSERT INTO ratings (user_id, book_id, rating, review) VALUES (?, ?, ?, ?)");
$stmt->bind_param("iiis", $user_id, $book_id, $rating, $review);
$stmt->execute();

header("Location: book_details.php?id=".$book_id);
exit();
