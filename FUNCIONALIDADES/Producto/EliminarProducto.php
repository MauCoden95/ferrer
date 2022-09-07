<?php

    if (isset($_POST)) {
        require_once '../Conexion.php';
        session_start();


        $name_product = isset($_POST['description']) ? $_POST['description'] : false;
        
        echo $name_product;

        if (empty($name_product)) {
            $_SESSION['error_product_delete'] = "Error, producto vacio";
        }else{
            $sql = "DELETE FROM productos WHERE descripcion = '$name_product';";
            $query = mysqli_query($conexion,$sql);

            $error = mysqli_error($conexion);
            echo $error;

            if ($query) {
               $_SESSION['success_product_delete'] = "Producto eliminado exitosamente";
               unset($_SESSION['error_product_delete']);
            }



        }
    }

    Header('Location: ../../PAGINAS/Productos.php');


?>