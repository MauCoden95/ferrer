<?php 
    session_start(); 

   
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/7483adbd94.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../ASSETS/Inicio.css">
    <title>Ferrer 1.0</title>
</head>
<body>
    <header id="header">
            <img src="../ASSETS/IMG/LogoInicio.png" alt="logo">
            <div class="header-user">
                <?php if(isset($_SESSION['usuario'])) : ?>
                <h2>Bienvenido, <?php print_r($_SESSION['usuario']['username']); ?></h2>
                <?php endif; ?>
                <a href="../Index.php">Cerrar Sesión</a>
            </div>
    </header>

    <section id="container">
        <navbar id="nav">
            <ul>
                <li><a href="./Inicio.php">Panel de Control</a></li>
                <li><a href="#">Productos</a></li>
                <li><a href="#">Categoria</a></li>
                <li><a href="#">Ventas</a></li>
                <li><a href="#">Acerca de</a></li>
            </ul>
        </navbar>

    
