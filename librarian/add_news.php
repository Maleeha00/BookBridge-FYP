<?php
include_once '../includes/config.php';
include_once '../includes/header.php';
include_once '../includes/functions.php'; 
checkUserRole('librarian');

// Action determine karein
$action = $_GET['action'] ?? 'list';
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Handle POST requests (Add/Edit)
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = $_POST['title'];
    $short_description = $_POST['short_description'];
    $full_content = $_POST['full_content'];

    // Optional image upload
    $image = '';
    if(isset($_FILES['image']) && $_FILES['image']['error'] == 0){
        $ext = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
        $image = 'uploads/news_'.time().'.'.$ext;
        move_uploaded_file($_FILES['image']['tmp_name'], '../'.$image);
    }

    if($action == 'add'){
        $stmt = $conn->prepare("INSERT INTO news (title, short_description, full_content, image) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $title, $short_description, $full_content, $image);
        $stmt->execute();
        $_SESSION['dashboard_message'] = "News added successfully!";
        $_SESSION['dashboard_message_type'] = "success";
        header("Location: librarian_news.php");
        exit;
    }

    if($action == 'edit' && $id > 0){
        // Check if new image uploaded
        if(empty($image)){
            $stmt = $conn->prepare("UPDATE news SET title=?, short_description=?, full_content=? WHERE id=?");
            $stmt->bind_param("sssi", $title, $short_description, $full_content, $id);
        } else {
            $stmt = $conn->prepare("UPDATE news SET title=?, short_description=?, full_content=?, image=? WHERE id=?");
            $stmt->bind_param("ssssi", $title, $short_description, $full_content, $image, $id);
        }
        $stmt->execute();
        $_SESSION['dashboard_message'] = "News updated successfully!";
        $_SESSION['dashboard_message_type'] = "success";
        header("Location: librarian_news.php");
        exit;
    }
}

// Handle Delete
if($action == 'delete' && $id > 0){
    $stmt = $conn->prepare("DELETE FROM news WHERE id=?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $_SESSION['dashboard_message'] = "News deleted successfully!";
    $_SESSION['dashboard_message_type'] = "danger";
    header("Location: librarian_news.php");
    exit;
}
?>

<h1 class="page-title">Manage News / Events</h1>

<?php if(isset($_SESSION['dashboard_message'])): ?>
    <div class="alert alert-<?php echo $_SESSION['dashboard_message_type']; ?> alert-dismissible fade show">
        <?php echo $_SESSION['dashboard_message']; ?>
        <button type="button" class="btn-close" onclick="this.parentElement.remove()">&times;</button>
    </div>
<?php
unset($_SESSION['dashboard_message']);
unset($_SESSION['dashboard_message_type']);
?>

<?php endif; ?>

<?php if($action == 'add' || $action == 'edit'): 
    if($action == 'edit'){
        $stmt = $conn->prepare("SELECT * FROM news WHERE id=?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        $news = $result->fetch_assoc();
    }
?>
<div class="card">
    <div class="card-header">
        <h3><?php echo ucfirst($action); ?> News/Event</h3>
    </div>
    <div class="card-body">
        <form method="POST" enctype="multipart/form-data">
            <div class="mb-3">
                <label>Title</label>
                <input type="text" name="title" class="form-control" required value="<?php echo $news['title'] ?? ''; ?>">
            </div>
            <div class="mb-3">
                <label>Short Description</label>
                <textarea name="short_description" class="form-control" required><?php echo $news['short_description'] ?? ''; ?></textarea>
            </div>
            <div class="mb-3">
                <label>Full Content</label>
                <textarea name="full_content" class="form-control" rows="5" required><?php echo $news['full_content'] ?? ''; ?></textarea>
            </div>
            <div class="mb-3">
                <label>Image (optional)</label>
                <input type="file" name="image" class="form-control">
                <?php if(!empty($news['image'])): ?>
                    <img src="../<?php echo $news['image']; ?>" width="100" class="mt-2">
                <?php endif; ?>
            </div>
            <button type="submit" class="btn btn-primary"><?php echo ucfirst($action); ?> News</button>
            <a href="librarian_news.php" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>
<?php else: ?>

<div class="mb-3 text-end">
    <a href="librarian_news.php?action=add" class="btn btn-success"><i class="fas fa-plus"></i> Add News/Event</a>
</div>

<div class="card">
    <div class="card-body">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Title</th>
                    <th>Short Description</th>
                    <th>Created At</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $sql = "SELECT * FROM news ORDER BY created_at DESC";
                $result = $conn->query($sql);
                $count = 1;
                while($row = $result->fetch_assoc()):
                ?>
                <tr>
                    <td><?php echo $count++; ?></td>
                    <td><?php echo htmlspecialchars($row['title']); ?></td>
                    <td><?php echo htmlspecialchars($row['short_description']); ?></td>
                    <td><?php echo date('M d, Y', strtotime($row['created_at'])); ?></td>
                    <td>
                        <a href="librarian_news.php?action=edit&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i></a>
                        <a href="librarian_news.php?action=delete&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure to delete this news?');"><i class="fas fa-trash"></i></a>
                    </td>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>
</div>

<?php endif; ?>

<?php
include_once '../includes/footer.php';
?>
