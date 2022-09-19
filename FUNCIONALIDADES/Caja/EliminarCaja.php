<?php

    if (isset($_POST)) {
        require_once '../Conexion.php';
        session_start();

        if (isset($_GET)) {
            $id = isset($_GET['id']) ? $_GET['id'] : false;

            echo $id;

            $sql = "DELETE FROM cajas WHERE id = $id;";
            $query = mysqli_query($conexion,$sql);
        }

     
    }

    Header('Location: ../../PAGINAS/Caja.php');


?>