<?php
session_start();
include_once '../includes/config.php';
include_once '../includes/functions.php'; // contains checkUserRole()
checkUserRole('librarian');

// Action determine karein
$action = $_GET['action'] ?? 'list';
$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

// Handle POST requests (Add/Edit)
if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $title = $_POST['title'];
    $short_description = $_POST['short_description'] ?? '';
    $content = $_POST['full_content'] ?? '';
    $author_id = $_SESSION['user_id'];

  // Optional image upload
$image = '';
    if(isset($_FILES['image']) && $_FILES['image']['error'] == 0){
        $ext = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
        $image = 'uploads/news_'.time().'.'.$ext;
        move_uploaded_file($_FILES['image']['tmp_name'], '../'.$image);
    
}


    if ($action == 'add') {
        $stmt = $conn->prepare(
            "INSERT INTO news (title, short_description, content, author_id, image ) VALUES (?, ?, ?, ?,?)"
        );
        $stmt->bind_param("sssis", $title, $short_description, $content, $author_id ,$image);
        $stmt->execute();

        $_SESSION['dashboard_message'] = "News added successfully!";
        $_SESSION['dashboard_message_type'] = "success";

        header("Location: add_news.php"); 
        exit;
    }

    if($action == 'edit' && $id > 0){
        if(empty($image)){
            $stmt = $conn->prepare(
                "UPDATE news SET title=?, short_description=?, content=? WHERE id=?"
            );
            $stmt->bind_param("sssi", $title, $short_description, $content, $id);
        } else {
            $stmt = $conn->prepare(
                "UPDATE news SET title=?, short_description=?, content=?, image=? WHERE id=?"
            );
            $stmt->bind_param("ssssi", $title, $short_description, $content, $image, $id);
        }
        $stmt->execute();

        $_SESSION['dashboard_message'] = "News updated successfully!";
        $_SESSION['dashboard_message_type'] = "success";

        header("Location: add_news.php"); 
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

    header("Location: add_news.php"); 
    exit;
}

include_once '../includes/header.php';
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
    $news = [];
    if($action == 'edit'){
        $stmt = $conn->prepare("SELECT * FROM news WHERE id=?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        $news = $result->fetch_assoc() ?? [];
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
                <input type="text" name="title" class="form-control" required value="<?php echo htmlspecialchars($news['title'] ?? ''); ?>">
            </div>
            <div class="mb-3">
                <label>Short Description</label>
                <textarea name="short_description" class="form-control" required><?php echo htmlspecialchars($news['short_description'] ?? ''); ?></textarea>
            </div>
            <div class="mb-3">
                <label>Full Content</label>
                <textarea name="full_content" class="form-control" rows="5" required><?php echo htmlspecialchars($news['content'] ?? ''); ?></textarea>
            </div>
            <div class="mb-3">
                <label>Image (optional)</label>
                <input type="file" name="image" class="form-control">
                <?php if(!empty($news['image'])): ?>
        <img src="../<?= $news['image'] ?>" width=" ">

    <?php endif; ?>
            </div>
            <button type="submit" class="btn btn-primary"><?php echo ucfirst($action); ?> News</button>
            <a href="add_news.php" class="btn btn-secondary">Cancel</a>
        </form>
    </div>
</div>
<?php else: ?>

<div class="mb-3 text-end">
<a href="?action=add" class="btn btn-success">Add News/Event</a>
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
                        <a href="?action=edit&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-warning">Edit</a>
                        <a href="?action=delete&id=<?php echo $row['id']; ?>" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">Delete</a>
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
