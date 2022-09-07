<?php

    if (isset($_POST)) {
        require_once '../Conexion.php';
        session_start();


        $category_before = isset($_POST['category_before']) ? $_POST['category_before'] : false;
        $category_new = isset($_POST['category_new']) ? $_POST['category_new'] : false;

        

        if (empty($category_before) || empty($category_new)) {
            //$_SESSION['error_category_save'] = "Error, categoria vacia";
        }else{
            $sql = "UPDATE categorias SET nombre = '$category_new' WHERE nombre = '$category_before';";
            $query = mysqli_query($conexion,$sql);

            if ($query) {
               //$_SESSION['success_category_save'] = "Nueva categoria guardada exitosamente";
               //unset($_SESSION['error_category_save']);
            }



        }
    }

    Header('Location: ../../PAGINAS/Categorias.php');


?>