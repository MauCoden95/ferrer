<?php

    if (isset($_POST)) {
        require_once '../Conexion.php';
        session_start();


        $razon_social = isset($_POST['razon_social']) ? $_POST['razon_social'] : false;
        
        echo $razon_social;

        if (empty($razon_social)) {
            $_SESSION['error_provider_delete'] = "Error, producto vacio";
        }else{
            $sql = "DELETE FROM proveedores WHERE razon_social = '$razon_social';";
            $query = mysqli_query($conexion,$sql);

            $error = mysqli_error($conexion);
            echo $error;

            if ($query) {
               $_SESSION['success_provider_delete'] = "Proveedor eliminado exitosamente";
               unset($_SESSION['error_provider_delete']);
            }



        }
    }

    Header('Location: ../../PAGINAS/Proveedores.php');


?>