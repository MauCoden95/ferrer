<?php
    session_start();
    require_once '../Conexion.php';

    if ($_GET) {
        $id = isset($_GET['id']) ? $_GET['id'] : false;

        

        if ($_POST) {
            $categoria = isset($_POST['categoria']) ? $_POST['categoria'] : false;

            if ($categoria != '') {
                $query = mysqli_query($conexion, "UPDATE categorias SET nombre = '$categoria' WHERE id = $id");
                if($query){
                    $_SESSION['update_success_category'] = "Categoria actualizada exitosamente";
                    unset($_SESSION['update_failed_category']);
                }else{
                    $_SESSION['update_failed_category'] = "Hubo un error al actualizar la categoria";
                }     
            }else{
                $_SESSION['update_failed_category'] = "Hubo un error al actualizar la categoria";
            }
                
           
        }


        
    }


?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/7483adbd94.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../../ASSETS/Inicio.css">
    <link rel="shortcut icon" href="../../ASSETS/IMG/LogoInicio.png" type="image/x-icon">



    <title>FerrerSoft 1.0</title>
</head>
<body>
    <header id="header">
            <img src="../../ASSETS/IMG/LogoInicio.png" alt="logo">
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
                <a href="../../Index.php">Cerrar Sesión</a>
            </div>
    </header>

    <section id="container">
        <navbar id="nav">
            <ul>
                    <?php if($_SESSION['es_admin'] == true): ?>
                        <li><a href="../../PAGINAS/Inicio.php"><span>Panel de Control</span><i class="fas fa-cogs"></i></a></li>
                        <li><a href="../../PAGINAS/Productos"><span>Productos</span><i class="fas fa-box"></i></a></li>
                        <li><a href="../../PAGINAS/Categorias.php"><span>Categorias</span><i class="fas fa-list-ul"></i></a></li>
                        <li><a href="../../PAGINAS/Ventas.php"><span>Ventas</span><i class="fas fa-coins"></i></a></li>
                        <li><a href="../../PAGINAS/Proveedores.php"><span>Proveedores</span><i class="fas fa-cart-arrow-down"></i></a></li>
                        <li><a href="../../PAGINAS/Empleados.php"><span>Empleados</span><i class="fas fa-briefcase"></i></a></li>
                        <li><a href="../../PAGINAS/Reportes.php"><span>Reportes</span><i class="fas fa-chart-line"></i></a></li>
                        <li><a href="../../PAGINAS/Caja.php"><span>Caja</span><i class="fas fa-money-bill-wave"></i></a></li>
                        <li><a href="../../PAGINAS/Acercade.php"><span>Acerca de</span><i class="fas fa-address-book"></i></a></li>
                    <?php else: ?>
                        <li><a href="../../PAGINAS/Inicio.php"><span>Panel de Control</span><i class="fas fa-cogs"></i></a></li>
                        <li><a href="../../PAGINAS/Ventas.php"><span>Ventas</span><i class="fas fa-coins"></i></a></li>
                        <li><a href="../../PAGINAS/Reportes.php"><span>Reportes</span><i class="fas fa-chart-line"></i></a></li>
                        <li><a href="../../PAGINAS/Caja.php"><span>Caja</span><i class="fas fa-money-bill-wave"></i></a></li>
                        <li><a href="../../PAGINAS/Acercade.php"><span>Acerca de</span><i class="fas fa-address-book"></i></a></li>
                    <?php endif; ?>
            </ul>
        </navbar>


        <div class="content-div">
        <form action="#" method="post" class="form-update">
                        <?php if(isset($_SESSION['update_failed_category'])) : ?>
                            <div class="error">
                            <p><?php print_r($_SESSION['update_failed_category']); ?></p>
                            </div>
                        <?php elseif(isset($_SESSION['update_success_category'])) : ?>
                            <div class="success">
                                <p><?php print_r($_SESSION['update_success_category']); ?></p>
                            </div>
                        <?php endif; ?>

                    <input type="text" name="categoria" placeholder="Nombre de la categoria..." autocomplete="off">
                    <input type="submit" value="Guardar Categoria">
                </form>








        </div>
    </section>



    </body>
</html>









