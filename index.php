<?php
require_once("config/conection.php");
require_once("template/header.php");
?>
<div id="container">
    <div class="container mx-auto w-100 text-center" id="content">
        <?php

        include_once './model/Category.php';
        $database = new Database();
        $db = $database->connect();
        $category = new Categoria($db);
        $results = $category->all();
        echo $results;

        ?>
    </div>
    <?php
    require_once("template/rightPanel.php");
    ?>
</div>
<?php
require_once("template/footer.php");
?>