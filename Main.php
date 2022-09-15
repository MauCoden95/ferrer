<?php
    require_once './FUNCIONALIDADES/Conexion.php';

    $password = 11111111;

    $password_segura = password_hash($password,PASSWORD_BCRYPT,['cost'=>5]);

    $sql = "INSERT INTO usuarios VALUES(NULL,'DavidM','Administrador','$password_segura',NULL);";

    $query = mysqli_query($conexion,$sql);

    if ($query) {
        echo "Guardado!!!";
    }else{
        echo "No guardado";
    }


?>