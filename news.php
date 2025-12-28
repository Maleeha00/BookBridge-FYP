<?php
// ===== Dynamic Data =====
$featuredEvents = [
    [
        "date" => "NOV 20",
        "title" => "SAT Test Prep (Ages 12–18)",
        "time" => "7:00pm – 8:00pm",
        "location" => "Westerville Public Library"
    ],
    [
        "date" => "NOV 22",
        "title" => "Service Project with Seeds of Caring",
        "time" => "2:00pm – 3:30pm",
        "location" => "Westerville Public Library"
    ],
    [
        "date" => "DEC 1",
        "title" => "Family Storytime Special: ASL Storyteller",
        "time" => "9:30am – 10:00am",
        "location" => "Westerville Public Library"
    ]
];
?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Library Page</title>

<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background: #ffffff;
        color: #333;
    }

    /* Top Notice */
    .notice {
        background: #ffffff;
        border-bottom: 1px solid #ddd;
        padding: 10px 20px;
        font-size: 14px;
    }

    .notice a {
        color: #1F3A8A;
        text-decoration: none;
        font-weight: bold;
    }

    /* Layout */
    .container {
        display: grid;
        grid-template-columns: 2fr 1fr;
        gap: 20px;
        padding: 20px;
    }

    /* Cards */
    .card {
        border: 1px solid #ddd;
        padding: 15px;
        background: #fff;
    }

    .card img {
        width: 100%;
        height: auto;
        margin-bottom: 10px;
    }

    h2, h3, h4 {
        color: #1F3A8A;
        margin-top: 0;
    }

    /* Innovation box */
    .innovation {
        margin-bottom: 20px;
    }

    /* Events */
    .events {
        border: 1px solid #ddd;
        padding: 15px;
    }

    .event {
        border-bottom: 1px solid #eee;
        padding: 10px 0;
    }

    .event:last-child {
        border-bottom: none;
    }

    .event-date {
        font-weight: bold;
        color: #1F3A8A;
    }

    /* Responsive */
    @media (max-width: 900px) {
        .container {
            grid-template-columns: 1fr;
        }
    }
</style>
</head>

<body>

<!-- Top Notices -->
<div class="notice">
    <strong>November 26 (6pm) – November 28</strong> — The library will be closed for Thanksgiving.
</div>
<div class="notice">
    Find out about current and upcoming interruptions/outages affecting library services.
    <a href="#">View now</a>
</div>

<!-- Main Content -->
<div class="container">

    <!-- Left Section -->
    <div class="card">
        <img src="IMG-20251127-WA0038.jpg" alt="Dry Capital Image">
        <h2>Dry Capital of the World</h2>
        <p>
            Find out how Westerville became the “dry capital of the world”
            through the efforts of the Anti-Saloon League in its heyday.
        </p>
    </div>

    <!-- Right Section -->
    <div>

        <div class="card innovation">
            <h3>Innovation Lab</h3>
            <p>
                From podcasts to posters, bring your ideas to life with
                hands-on learning and digital creation.
            </p>
        </div>

        <div class="events">
            <h3>Featured Events</h3>

            <?php foreach ($featuredEvents as $event): ?>
                <div class="event">
                    <div class="event-date"><?php echo $event['date']; ?></div>
                    <h4><?php echo $event['title']; ?></h4>
                    <p><?php echo $event['time']; ?><br>
                       <?php echo $event['location']; ?>
                    </p>
                </div>
            <?php endforeach; ?>

        </div>

    </div>

</div>

</body>
</html>
