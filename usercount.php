<?php
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);

        echo "<h1>Amount of users</h1>";

        $link = mysqli_connect("172.17.0.2", "myuser", "mypassword", "Trucorp");
        if (!$link){
                echo "Cannot connect mysql.";
                exit;
        }
        $result = $link->query("SELECT * FROM users");
        echo "There are " . $result->num_rows . " users";
        mysqli_close($link);
?>