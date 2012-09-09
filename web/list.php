<html>
<head>
<title>listing</title>
</head>
<body>
<h1>Names</h1>
<ul>
<?php
require_once "/tmp/webapp-config.php";

$conn = new mysqli($database_server_ip, $database_user, $database_password, $database_name);
if ($conn->connect_error) {
  die('Connect Error (' . $conn->connect_errno . ') '
    . $conn->connect_error);
}

if ($res = $conn->query("select id, name from demo2")) { 
  while ($row = $res->fetch_assoc()) {
    echo "<li>";
    echo '<a href="edit.php?id=', $row['id'], '">', $row['name'], "</a></li>\n";
  }

  $res->close();
}

?>
</ul>
<a href="new.php">Add entry</a>
</body>
</html>
