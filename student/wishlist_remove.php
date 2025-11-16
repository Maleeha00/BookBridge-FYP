<?php
include '../includes/config.php';
session_start();

$id = $_GET['id'];

$stmt = $conn->prepare("DELETE FROM wishlist WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();

header("Location: wishlist.php?removed=1");
?>
