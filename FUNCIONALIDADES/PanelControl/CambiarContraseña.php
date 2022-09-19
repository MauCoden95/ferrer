<?php
    if (isset($_POST)) {
        require_once '../Conexion.php';
        session_start();
        $password = isset($_POST['change-password']) ? $_POST['change-password'] : false;

        
      

       if (empty($password) || strlen($password) < 8) {
            $_SESSION['change_password_failed'] = "Error, contraseña vacia o con menos de 8 caracteres";
            header('Location: ../PAGINAS/Inicio.php');
       }else{
            $user = $_SESSION['usuario']['username'];
            
            $password_segura = password_hash($password,PASSWORD_BCRYPT,['cost'=>5]);

            
            $change = "UPDATE usuarios SET password = '$password_segura' WHERE username = '$user'";
            $change_password = mysqli_query($conexion,$change);

            if ($change_password) {
                $_SESSION['change_password_success'] = "Contraseña cambiada exitosamente";
                unset($_SESSION['change_password_failed']);
            }else{
                $_SESSION['change_password_failed'] = "Error, contraseña vacia o con menos de 8 caracteres";
                echo "Error al cambiar contraseña";
            }



            
       }
        
    }

    header('Location: ../PAGINAS/Inicio.php');

?>