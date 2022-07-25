<?php
    if (isset($_POST)) {
        require_once './Conexion.php';
        session_start();

        $username = isset($_POST['change-username']) ? $_POST['change-username'] : false;

        
       if (empty($username)) {
            $_SESSION['change_username_failed'] = "Error, usuario vacio";
            header('Location: ../PAGINAS/Inicio.php');
       }else{
            if ($consulta) {
               
                $user = $_SESSION['usuario']['username'];
                $sql = "SELECT * FROM usuarios WHERE '$user' = username";
                $consulta = mysqli_query($conexion,$sql);


                
                $change = "UPDATE usuarios SET username = '$username'";
                $change_username = mysqli_query($conexion,$change);

                if ($change_username) {
                    $_SESSION['change_username_success'] = "Usuario cambiado exitosamente";       
                    header('Location: ../PAGINAS/Inicio.php');             
                    unset($_SESSION['change_username_failed']);
                }else{
                    $_SESSION['change_username_failed'] = "Error, el campo esta vacio o el usuario ya existe";
                    header('Location: ../PAGINAS/Inicio.php'); 
                }



            }else{
                
            }
       }
        
    }

    



?>