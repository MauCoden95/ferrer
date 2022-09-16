<?php

    if (isset($_POST)) {
        require_once '../Conexion.php';
        session_start();


        $id = isset($_POST['id_provider']) ? $_POST['id_provider'] : false;
        
        //echo $razon_social;

        if (empty($id)) {
            $_SESSION['error_provider_delete'] = "Error, producto vacio";
        }else{
            $sql = "DELETE FROM proveedores WHERE id = $id;";
            $query = mysqli_query($conexion,$sql);

            $error = mysqli_error($conexion);
            echo $error;

            if ($query) {
               $_SESSION['success_provider_delete'] = "Proveedor eliminado exitosamente";
               unset($_SESSION['error_provider_delete']);
            }else{
                $_SESSION['failed_provider_delete'] = "Hubo un error al eliminar al proveedor";
            }



        }
    }

    Header('Location: ../../PAGINAS/Proveedores.php');


?>