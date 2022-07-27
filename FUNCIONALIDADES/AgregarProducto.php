<?php
    require_once './Conexion.php';

    if (isset($_POST)) {
        $description = isset($_POST['description']) ? $_POST['description'] : false;
        $price = isset($_POST['price']) ? $_POST['price'] : false;
        $stock = isset($_POST['stock']) ? $_POST['stock'] : false;
        $stock_reposition = isset($_POST['stock_reposition']) ? $_POST['stock_reposition'] : false;


        $sql = "INSERT INTO productos VALUES(null,'$description',$price,$stock,$stock_reposition,null);";
        $query = mysqli_query($conexion,$sql);

        $error = mysqli_errno($query);

        if ($query) {
            echo "Producto guardado con exito!!!";
        }else{
            echo "Hubo un error al guardar el producto";
            echo $error;
        }

    }

    Header('Location: ../PAGINAS/Productos.php');


?>