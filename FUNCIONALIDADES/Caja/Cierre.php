<?php
    require_once '../Conexion.php';
    session_start();

    if ($_POST) {
        $close = isset($_POST['close']) ? $_POST['close'] : '';


        $sql = "UPDATE cajas SET cierre = '$close' WHERE fecha = CURDATE();";
        $query = mysqli_query($conexion,$sql);


        echo mysqli_error($conexion);
        if ($query) {
            echo "Cierre de caja con exito!!!";
            $_SESSION['close_success'] = "Cierre de caja exitoso!!!";
        }else{
            echo "Failed";
            $_SESSION['close_error'] = "Hubo un error en el cierre de la caja";
        }
    }


    header('Location: ../../PAGINAS/Caja.php');

?>