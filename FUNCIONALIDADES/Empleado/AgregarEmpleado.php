<?php
     require_once '../Conexion.php';
     session_start();

    if ($_POST) {
        $nombre = isset($_POST['name']) ? $_POST['name'] : false;
        $dni = isset($_POST['dni']) ? $_POST['dni'] : false;
        $cargo = isset($_POST['cargo']) ? $_POST['cargo'] : false;
        $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : false;
        $ciudad = isset($_POST['ciudad']) ? $_POST['ciudad'] : false;
        $telefono = isset($_POST['telefono']) ? $_POST['telefono'] : false;
        $fecha_nacimiento = isset($_POST['fecha_nacimiento']) ? $_POST['fecha_nacimiento'] : false;
        $sueldo = isset($_POST['sueldo']) ? $_POST['sueldo'] : false;

        $tipo_usuario = isset($_POST['tipo_usuario']) ? $_POST['tipo_usuario'] : 'Usuario Comun';
        $usuario = isset($_POST['usuario']) ? $_POST['usuario'] : false;
        $contraseña = isset($_POST['contraseña']) ? $_POST['contraseña'] : false;
        
        echo $nombre.'<br>'
                .$dni.'<br>'
                .$cargo.'<br>'
                .$direccion.'<br>'
                .$ciudad.'<br>'
                .$telefono.'<br>'
                .$fecha_nacimiento.'<br>'
                .$sueldo;






        $sql_empleados = "INSERT INTO empleados VALUES(NULL,'$nombre',$dni,'$cargo','$direccion','$ciudad',$telefono,'$fecha_nacimiento',$sueldo);";
        $query_empleados = mysqli_query($conexion,$sql_empleados);

        $error = mysqli_error($conexion);
        echo $error;

        echo "<hr>";

       
        $select_empleado = "SELECT * FROM empleados WHERE nombre = '$nombre'";
        $query_select_empleado = mysqli_query($conexion,$select_empleado);
        $fetch_select_empleado = mysqli_fetch_assoc($query_select_empleado);

        print_r($fetch_select_empleado['id']);

        $password_segura = password_hash($contraseña,PASSWORD_BCRYPT,['cost'=>5]);

       $crear_usuario = "INSERT INTO usuarios VALUES(NULL,$fetch_select_empleado[id],'$usuario','$tipo_usuario','$password_segura',NULL);";
       $query_crear_usuario = mysqli_query($conexion,$crear_usuario);

       $error = mysqli_error($conexion);

       if ($query_crear_usuario) {
        echo "Success";
       }else{
        echo "Failed".' '.$error;
       }


       
    }

    header('Location: ../../PAGINAS/Empleados.php');


?>