<?php

    if (isset($_POST)) {
        require_once './Conexion.php';
        session_start();


        $nombre_categoria = isset($_POST['category']) ? $_POST['category'] : false;


        if (empty($nombre_categoria)) {
            $_SESSION['error_category'] = "Error, categoria vacia";
        }else{
            $sql = "INSERT INTO categorias VALUES(null,'$nombre_categoria');";
            $query = mysqli_query($conexion,$sql);

            if ($query) {
               $_SESSION['success_category'] = "Nueva categoria guardada exitosamente";
               unset($_SESSION['error_category']);
            }



        }
    }

    Header('Location: ../PAGINAS/Categorias.php');


?>