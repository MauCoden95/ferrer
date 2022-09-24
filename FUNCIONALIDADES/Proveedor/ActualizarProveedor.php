<?php
    require_once '../Conexion.php';
    session_start();

    unset($_SESSION['update_failed_provider']);
    
    if ($_GET) {
        $id = isset($_GET['id']) ? $_GET['id'] : false;

        $query_proveedores = mysqli_query($conexion,"SELECT * FROM proveedores WHERE id = $id");
        $query_proveedores_fetch = mysqli_fetch_assoc($query_proveedores);

        


        if (isset($_POST)) {
            $razon_social = isset($_POST['razon_social']) ? $_POST['razon_social'] : false;
            $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : false;
            $ciudad = isset($_POST['ciudad']) ? $_POST['ciudad'] : false;
            $codigo_postal = isset($_POST['codigo_postal']) ? $_POST['codigo_postal'] : false;
            $telefono = isset($_POST['telefono']) ? $_POST['telefono'] : false;
            $cuit = isset($_POST['cuit']) ? $_POST['cuit'] : false;


            $query_guardar = mysqli_query($conexion,"UPDATE proveedores SET razon_social = '$razon_social', direccion = '$direccion', ciudad = '$ciudad', codigo_postal = $codigo_postal, telefono = $telefono, cuit = $cuit WHERE id = $id");

            if ($query_guardar) {
                $_SESSION['update_success_provider'] = "Proveedor actualizado con exito!!!";
                unset($_SESSION['update_failed_provider']);
            }else{
                $_SESSION['update_failed_provider'] = "Hubo un error al actualizar el proveedor!";
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
                    
                    <?php endif; ?>
            </ul>
        </navbar>

        
        <div class="content-div">
                        <form action="#" method="POST" class='form-update'>
                            <?php if(isset($_SESSION['update_failed_provider'])) : ?>
                                <div class="error">
                                    <p><?php print_r($_SESSION['update_failed_provider']); ?></p>
                                </div>
                            <?php elseif(isset($_SESSION['update_success_provider'])) : ?>
                                <div class="success">
                                    <p><?php print_r($_SESSION['update_success_provider']); ?></p>
                                </div>
                            <?php endif; ?>
                             
                        <input type="text" name="razon_social" value="<?= $query_proveedores_fetch['razon_social'] ?>" autocomplete="off">
                            <input type="text" name="direccion" value="<?= $query_proveedores_fetch['direccion'] ?>" autocomplete="off">
                            <input type="text" name="ciudad" value="<?= $query_proveedores_fetch['ciudad'] ?>" autocomplete="off">
                            <input type="number" name="codigo_postal" value="<?= $query_proveedores_fetch['codigo_postal'] ?>" autocomplete="off">
                            <input type="number" name="telefono" value="<?= $query_proveedores_fetch['telefono'] ?>" autocomplete="off">
                            <input type="number" name="cuit" value="<?= $query_proveedores_fetch['cuit'] ?>" autocomplete="off">
                            <input type="submit" value="Guardar proveedor">
                </form>
                

               
    

               


               
        </div>
    </section>
    

    
    </body>
</html>