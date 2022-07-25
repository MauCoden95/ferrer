<?php
    if (isset($_POST)) {
        require_once './Conexion.php';
        session_start();

        $password = isset($_POST['change-password']) ? $_POST['change-password'] : false;

        $user = $_SESSION['usuario']['username'];
        $sql = "SELECT * from usuarios where '$user' = username";
        $consulta = mysqli_query($conexion,$sql);

       if (empty($password) || strlen($password) < 8) {
            $_SESSION['change_password_failed'] = "Error, contraseña vacia o con menos de 8 caracteres";
            header('Location: ../PAGINAS/Inicio.php');
       }else{
            if ($consulta) {
                $password_segura = password_hash($password,PASSWORD_BCRYPT,['cost'=>5]);

                
                $change = "UPDATE usuarios SET password = '$password_segura'";
                $change_password = mysqli_query($conexion,$change);

                if ($change_password) {
                    $_SESSION['change_password_success'] = "Contraseña cambiada exitosamente";
                    header('Location: ../PAGINAS/Inicio.php');
                    unset($_SESSION['change_password_failed']);
                }else{
                    $_SESSION['change_password_failed'] = "Error, contraseña vacia o con menos de 8 caracteres";
                    header('Location: ../PAGINAS/Inicio.php');
                    echo "Error al cambiar contraseña";
                }



            }else{
                
            }
       }
        
    }



?>