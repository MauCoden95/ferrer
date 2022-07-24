<?php
    if (isset($_POST)) {
        require_once './Conexion.php';
        session_start();

        $username = isset($_POST['username']) ? $_POST['username'] : false;
        $password = isset($_POST['password']) ? $_POST['password'] : false;
        
        //echo $username,' ',$rol,' ',$password;

        $errores = array();

        if (empty($username)) {
            $errores['username'] = "Error, usuario vacio";
        }

        if (empty($password) || strlen($password) < 8) {
            $errores['password'] = "Error, contraseña vacía o con menos de 8 caracteres";
        }
        var_dump($errores);

        if (count($errores) == 0) {
            
            $password_segura = password_hash($password, PASSWORD_BCRYPT, ['cost' => 5]);
            

            $sql = "INSERT INTO usuarios VALUES(null, '$username','Usuario Comun','$password_segura');";
            $guardar = mysqli_query($conexion,$sql);
            
           

            if ($guardar) {
                echo "Usuario creado con exito!!!";
                $_SESSION['completo'] = "Nuevo usuario creado con exito!!!";
            }
        }else{
            $_SESSION['errores'] = $errores;       
        }

        
    }

    header('Location: ../PAGINAS/Registrarse.php');    

?>