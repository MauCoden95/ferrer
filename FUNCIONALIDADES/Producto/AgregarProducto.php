<?php
    require_once '../Conexion.php';

    if (isset($_POST)) {





        $description = isset($_POST['description']) ? $_POST['description'] : false;
        $category = isset($_POST['category']) ? $_POST['category'] : false;
        $provider = isset($_POST['provider']) ? $_POST['provider'] : false;
        $price = isset($_POST['price']) ? $_POST['price'] : false;
        $stock = isset($_POST['stock']) ? $_POST['stock'] : false;
        $stock_reposition = isset($_POST['stock_reposition']) ? $_POST['stock_reposition'] : false;

        $prev_sql = "SELECT id FROM categorias WHERE nombre = '$category';";
        $prev_query = mysqli_query($conexion,$prev_sql);
        $fetch_query = mysqli_fetch_assoc($prev_query);
        

        $int_fetch_query = number_format($fetch_query['id']);

        //var_dump($fetch_query);

        $provider_sql = "SELECT id FROM proveedores WHERE razon_social = '$provider';";
        $prev_query_provider = mysqli_query($conexion,$provider_sql);
        $fetch_query_provider = mysqli_fetch_assoc($prev_query_provider);
        $int_fetch_query_provider = number_format($fetch_query_provider['id']);

        $sql = "INSERT INTO productos VALUES(null,$int_fetch_query,$int_fetch_query_provider,'$description',$price,$stock,$stock_reposition,null);";
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


