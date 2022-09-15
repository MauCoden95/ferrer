<?php

    if (isset($_POST)) {
        require_once '../Conexion.php';
        session_start();


        $id_product = isset($_POST['id_product']) ? $_POST['id_product'] : false;
        
       

        if (empty($id_product)) {
            $_SESSION['error_product_delete'] = "Error, producto vacio";
        }else{
            $sql = "DELETE FROM productos WHERE id = $id_product;";
            $query = mysqli_query($conexion,$sql);

            $error = mysqli_error($conexion);
            echo $error;

            if ($query) {
               $_SESSION['success_product_delete'] = "Producto eliminado exitosamente";
               unset($_SESSION['error_product_delete']);
            }else{
                $_SESSION['error_product_delete'] = "Error, producto vacio";
            }



        }
    }

    Header('Location: ../../PAGINAS/Productos.php');


?>