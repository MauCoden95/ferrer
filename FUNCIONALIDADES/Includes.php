<?php session_start(); ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../ASSETS/Inicio.css">
    <title>Ferrer 1.0</title>
</head>
<body>
    <header id="header">
        <div class="header-div">
            <a href="../Index.php">Cerrar Sesion</a>
            <?php if(isset($_SESSION['usuario'])) : ?>
                <div class="welcome-user">
                <?php print_r("<h2>Bienvenido, ".$_SESSION['usuario']['username']."<h2>"); ?>
                </div>
            <?php endif; ?>
        </div>
        
    </header>

    <navbar id="nav">
       <div class="logo">
            <img src="../ASSETS/IMG/LogoInicio.png" alt="Logo">
       </div>

       <ul>
           <li><a href="#">Panel de Control</a></li>
           <li><a href="#">Productos</a></li>
           <li><a href="#">Categoria</a></li>
           <li><a href="#">Ventas</a></li>
           <li><a href="#">Acerca de</a></li>
       </ul>
    </navbar>

    