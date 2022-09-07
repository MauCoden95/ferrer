<?php
    require_once '../Conexion.php';
    session_start();

    if (isset($_POST)) {
        $id = isset($_POST['id']) ? $_POST['id'] : false;
        $descripcion = isset($_POST['description_update']) ? $_POST['description_update'] : false;
        $categoria = isset($_POST['category']) ? $_POST['category'] : false;
        $precio = isset($_POST['price_update']) ? $_POST['price_update'] : false;
        $stock = isset($_POST['stock_update']) ? $_POST['stock_update'] : false;
        $stock_reposicion = isset($_POST['stock_reposition_update']) ? $_POST['stock_reposition_update'] : false;

        

        $sql = "SELECT * FROM productos WHERE id = '$id';";
        $query = mysqli_query($conexion,$sql);
        //echo mysqli_errno($query);

        //var_dump($query);

        while ($products = mysqli_fetch_assoc($query)) {
            print_r($products); 
        }
        
        
        if ($products) {
           $sql_update = "UPDATE productos SET descripcion = '$descripcion' AND precio = $precio AND stock = $stock AND stock_reposicion = $stock_reposicion WHERE id = $id;";
            $query_update = mysqli_query($conexion, $sql_update);

            if ($query_update) {
                //$_SESSION['update_product'] = "SUCCESS";
            }else{
                //$_SESSION['update_product'] = "FAILED";
            }
        }
    }

    header('Location: http://localhost/Ferrer/PAGINAS/Productos.php');

    
?>