<?php
include '../includes/config.php';
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: ../login.php");
    exit();
}

$user_id = $_SESSION['user_id'];
$book_id = $_GET['book_id'];

// Check if already in wishlist
$check = $conn->prepare("SELECT * FROM wishlist WHERE user_id = ? AND book_id = ?");
$check->bind_param("ii", $user_id, $book_id);
$check->execute();
$result = $check->get_result();

if ($result->num_rows == 0) {
    $sql = $conn->prepare("INSERT INTO wishlist (user_id, book_id) VALUES (?, ?)");
    $sql->bind_param("ii", $user_id, $book_id);
    $sql->execute();
}

header("Location: wishlist.php?added=1");
?>
