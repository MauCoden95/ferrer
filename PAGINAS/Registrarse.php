<?php session_start(); ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/7483adbd94.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../ASSETS/LoginRegistro.css">
    <title>Ferrer 1.0</title>
</head>
<body>
    <form action="../FUNCIONALIDADES/CrearUsuario.php" method="post" id="form">
        <img src="../ASSETS/IMG/Logo.png" alt="Logo" class="logo">
        <?php if(isset($_SESSION['errores'])) : ?>
            <div class="error">
                <ul>
                    <?php isset($_SESSION['errores']['username']) ? print_r("<li>".$_SESSION['errores']['username'])."<li>" : false;  ?>
                    <?php isset($_SESSION['errores']['password']) ? print_r("<li>".$_SESSION['errores']['password'])."<li>" : false;  ?>
                </ul>
            </div>
        <?php elseif(isset($_SESSION['completo'])) : ?>
            <div class="success">
                <p><?php print_r($_SESSION['completo']); ?></p>
            </div>
        <?php endif; ?>
        <div>
            <i class="fas fa-user user-icon"></i>
            <i class="fas fa-key key-icon"></i>
            <input type="text" name="username" placeholder="Usuario" autocomplete="off">
            <input type="password" name="password" placeholder="Contraseña" autocomplete="off">
        </div>
        <input type="submit" value="Registrarse" id="enviar">
        <a href="../Index.php">Iniciar sesion</a>
    </form>
    <?php session_destroy(); ?>
</body>
</html>