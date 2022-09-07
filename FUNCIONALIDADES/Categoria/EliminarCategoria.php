<?php

    if (isset($_POST)) {
        require_once '../Conexion.php';
        session_start();


        $name_category = isset($_POST['category']) ? $_POST['category'] : false;

       
        if (empty($name_category)) {
            $_SESSION['error_category_delete'] = "Error, categoria vacia";
        }else{
            $sql = "DELETE FROM categorias WHERE nombre = '$name_category';";
            $query = mysqli_query($conexion,$sql);

            $error = mysqli_errno($query);
            echo $error;

            if ($query) {
                echo "Existe";
               $_SESSION['success_category_delete'] = "Categoria eliminada exitosamente";
               unset($_SESSION['error_category_delete']);
            }else{
               
            }



        }
    }

    Header('Location: ../../PAGINAS/Categorias.php');


?>