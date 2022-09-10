<?php
    require_once '../Conexion.php';
    session_start();

    if ($_POST) {
        $apertura = isset($_POST['open']) ? $_POST['open'] : '';


        $sql = "INSERT INTO cajas VALUES(NULL,$apertura,NULL,CURDATE());";
        $query = mysqli_query($conexion,$sql);


        echo mysqli_error($conexion);
        if ($query) {
            $_SESSION['open_success'] = "Apertura de caja exitosa!!!";
        }else{
            $_SESSION['open_error'] = "Hubo un error en la apertura de la caja";
        }
    }


    header('Location: ../../PAGINAS/Caja.php');

?>