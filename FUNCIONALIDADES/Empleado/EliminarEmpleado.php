<?php

    if (isset($_POST)) {
        require_once '../Conexion.php';
        session_start();

        if (isset($_GET)) {
            $id = isset($_GET['id']) ? $_GET['id'] : false;

            echo $id;

           

            $sql_empleado = "DELETE FROM usuarios WHERE empleado_id = $id;";
            $query_empleado = mysqli_query($conexion,$sql_empleado);

            $sql = "DELETE FROM empleados WHERE id = $id;";
            $query = mysqli_query($conexion,$sql);
        }

     
    }

    Header('Location: ../../PAGINAS/Empleados.php');


?>