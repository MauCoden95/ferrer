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
    <link rel="shortcut icon" href="../ASSETS/IMG/LogoInicio.png" type="image/x-icon">
    <title>FerrerSoft 1.0</title>
</head>
<body>
    <header id="header">
            <img src="../ASSETS/IMG/LogoInicio.png" alt="logo">
            <div id="date">
                <?php
                    setlocale(LC_ALL,"es_ES");
                    $mes = array("enero", "febrero", "marzo", "abril", "mayo", "junio", "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre");
                    $dia = array("Monday" => "Lunes",
                    "Tuesday" => "Martes",
                    "Wednesday"=>"Miercoles",
                    "Thursday"=>"Jueves",
                    "Friday"=>"Viernes",
                    "Saturday"=>"Sabado",
                    "Sunday"=>"Domingo");
                    $hour = date("h:I");
                    $newHour = strtotime('-2 hour',strtotime($hour));
                    echo $dia[date("l")]." ".date("d")." de ".$mes[date("m")-1]." de ".date("Y");
                 
                    echo "  |  ".date("h:i");
                    
                ?>

            </div>
            <div class="header-user">
                <?php if(isset($_SESSION['usuario'])) : ?>
                <h2>Bienvenido, <?php print_r($_SESSION['usuario']['username']); ?></h2>
                <?php endif; ?>
                <a href="../Index.php">Cerrar Sesión</a>
            </div>
    </header>

    <section id="container">
       

    
