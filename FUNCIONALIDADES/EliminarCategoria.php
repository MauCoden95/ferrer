<?php

    if (isset($_POST)) {
        require_once './Conexion.php';
        session_start();


        $nombre_categoria = isset($_POST['category']) ? $_POST['category'] : false;


        if (empty($nombre_categoria)) {
            $_SESSION['error_category_delete'] = "Error, categoria vacia";
        }else{
            $sql = "DELETE FROM categorias WHERE nombre = '$nombre_categoria';";
            $query = mysqli_query($conexion,$sql);

            if ($query) {
               $_SESSION['success_category_delete'] = "Categoria eliminada exitosamente";
               unset($_SESSION['error_category_delete']);
            }



        }
    }

    Header('Location: ../PAGINAS/Categorias.php');


?>