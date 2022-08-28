<?php session_start(); ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/7483adbd94.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./ASSETS/LoginRegistro.css">
    <title>FerrerSoft 1.0</title>
</head>
<body>
    <form action="./FUNCIONALIDADES/Login.php" method="post" id="form">
        <img src="./ASSETS/IMG/Logo.png" alt="Logo" class="logo">
        
            <?php if(isset($_SESSION['error'])) : ?>
                
                    <div class="error">
                        <p><?php print_r($_SESSION['error']); ?></p>
                    </div>
             
            <?php endif; ?>
       
        
        <div>
            <i class="fas fa-user user-icon"></i>
            <i class="fas fa-key key-icon"></i>
            <input type="text" name="username" placeholder="Ingrese su usuario" autocomplete="off">
            <input type="password" name="password" placeholder="Ingrese su contraseña" autocomplete="off">
        </div>
        <input type="submit" value="Ingresar" id="enviar">
        <a href="./PAGINAS/Registrarse.php">Crear cuenta</a>
    </form>
    <?php session_destroy(); ?>
</body>
</html>