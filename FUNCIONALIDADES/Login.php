<?php
     if (isset($_POST)) {
        require_once './Conexion.php';
        session_start();
        
        $username = isset($_POST['username']) ? $_POST['username'] : false;
        $password = isset($_POST['password']) ? $_POST['password'] : false;


        $sql = "SELECT * from usuarios where '$username' = username limit 1;";
        $consulta = mysqli_query($conexion, $sql);

        if ($sql) {
            //echo "Exist";
            $datos_usuario = mysqli_fetch_assoc($consulta);
            

            $verify = password_verify($password, $datos_usuario['password']);

            if ($verify) {
                header('Location: ../PAGINAS/Productos');
                $_SESSION['id'] = $datos_usuario[id];
                $_SESSION['usuario'] = $datos_usuario;
                //var_dump($_SESSION['usuario']);
                print_r($datos_usuario);

                if ($datos_usuario[rol] == 'Administrador') {
                    $_SESSION['es_admin'] = true;
                }else{
                    $_SESSION['es_admin'] = false;
                }
            }else{
                $_SESSION['error'] = "Error, usuario y/o contraseña incorrectos";
                header('Location: ../Index.php');
            }
        }else{
            $_SESSION['error'] = "Error, usuario y/o contraseña incorrectos";
        }

     }

        




?>