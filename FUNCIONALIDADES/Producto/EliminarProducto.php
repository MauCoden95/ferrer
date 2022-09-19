<?php

    if (isset($_POST)) {
        require_once '../Conexion.php';
        session_start();

        if (isset($_GET)) {
            $id = isset($_GET['id']) ? $_GET['id'] : false;

            echo $id;

            $sql = "DELETE FROM productos WHERE id = $id;";
            $delete_query = mysqli_query($conexion,$sql);

            if ($delete_query) {
                echo "Delete success";
            }else{
                echo "Delete failed";
            }
        }


    }

    Header('Location: ../../PAGINAS/Productos.php');


?>