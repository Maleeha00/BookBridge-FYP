<?php
include_once 'includes/config.php';
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
$stmt = $conn->prepare("SELECT * FROM news WHERE id=?");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$news = $result->fetch_assoc();

if(!$news){
    echo "News not found!";
    exit;
}
?>

<h1><?= htmlspecialchars($news['title']) ?></h1>
<p><?= htmlspecialchars($news['short_description']) ?></p>
<?php if(!empty($news['image'])): ?>
    <img src="<?= $news['image'] ?>" width=" ">
<?php endif; ?>
<p><?= nl2br(htmlspecialchars($news['content'])) ?></p>
<small>Posted on <?= date('M d, Y', strtotime($news['created_at'])) ?></small>
