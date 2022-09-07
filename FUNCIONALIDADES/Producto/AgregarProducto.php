<?php
    require_once '../Conexion.php';

    if (isset($_POST)) {
        $description = isset($_POST['description']) ? $_POST['description'] : false;
        $category = isset($_POST['category']) ? $_POST['category'] : false;
        $price = isset($_POST['price']) ? $_POST['price'] : false;
        $stock = isset($_POST['stock']) ? $_POST['stock'] : false;
        $stock_reposition = isset($_POST['stock_reposition']) ? $_POST['stock_reposition'] : false;

        $prev_sql = "SELECT id FROM categorias WHERE nombre = '$category';";
        $prev_query = mysqli_query($conexion,$prev_sql);
        $fetch_query = mysqli_fetch_assoc($prev_query);
        

        $int_fetch_query = number_format($fetch_query['id']);

        var_dump($fetch_query);


        $sql = "INSERT INTO productos VALUES(null,$int_fetch_query,'$description',$price,$stock,$stock_reposition,null);";
        $query = mysqli_query($conexion,$sql);

     

        if ($query) {
            echo "Producto guardado con exito!!!";
            $_SESSION['success_product_save'] = "Nuevo producto guardado con exito";
        }else{
            echo "Hubo un error al guardar el producto";
            $_SESSION['error_product_save'] = "Hubo un error al guardar el producto";
        }

    }

    Header('Location: ../../PAGINAS/Productos.php');


?>