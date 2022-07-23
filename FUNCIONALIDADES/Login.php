<?php
     if (isset($_POST)) {
        require_once './Conexion.php';
        session_start();
        
        $username = isset($_POST['username']) ? $_POST['username'] : false;
        $password = isset($_POST['password']) ? $_POST['password'] : false;


        $sql = "SELECT * from usuarios where '$username' = username limit 1;";
        $consulta = mysqli_query($conexion, $sql);

        if ($sql) {
            $datos_usuario = mysqli_fetch_assoc($consulta);
            

            $verify = password_verify($password, $datos_usuario['password']);

            if ($verify) {
                header('Location: ../PAGINAS/Includes.php');
                $_SESSION['usuario'] = $datos_usuario;
                var_dump($_SESSION['usuario']);
            }else{
                $_SESSION['error'] = "Error, usuario y/o contraseña incorrectos";
                header('Location: ../Index.php');
            }
        }else{
            $_SESSION['error'] = "Error, usuario y/o contraseña incorrectos";
        }

     }

        




?>