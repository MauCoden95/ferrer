<?php
    require_once '../Conexion.php';
    session_start();


    if (isset($_GET)) {
        $id = isset($_GET['id']) ? $_GET['id'] : false;

       

        $query = mysqli_query($conexion,"SELECT * FROM empleados WHERE id = $id;");

        if ($query) {
            $query_fetch = mysqli_fetch_assoc($query);

            $query_usuario = mysqli_query($conexion, "SELECT * FROM usuarios WHERE empleado_id = $id");
            $query_fetch_usuario = mysqli_fetch_assoc($query_usuario);

            

            if ($_POST) {
                $nombre = isset($_POST['name']) ? $_POST['name'] : false;
                $dni = isset($_POST['dni']) ? $_POST['dni'] : false;
                $cargo = isset($_POST['cargo']) ? $_POST['cargo'] : false;
                $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : false;
                $ciudad = isset($_POST['ciudad']) ? $_POST['ciudad'] : false;
                $telefono = isset($_POST['telefono']) ? $_POST['telefono'] : false;
                $fecha_nacimiento = isset($_POST['fecha_nacimiento']) ? $_POST['fecha_nacimiento'] : false;
                $sueldo = isset($_POST['sueldo']) ? $_POST['sueldo'] : false;
            
                $tipo_usuario = isset($_POST['tipo_usuario']) ? $_POST['tipo_usuario'] : 'Usuario Comun';
                $usuario = isset($_POST['usuario']) ? $_POST['usuario'] : false;
                $contraseña = isset($_POST['contraseña']) ? $_POST['contraseña'] : false;


                if ($nombre != '' && $dni != '' && $cargo != '' && $direccion != '' && $ciudad != '' && $telefono != '' && $fecha_nacimiento != '' && $sueldo != '' && $usuario != '' && $contraseña != '') {
                    $query_update_empleado = mysqli_query($conexion, "UPDATE empleados SET nombre = '$nombre', dni = $dni, cargo = '$cargo', direccion = '$direccion', ciudad = '$ciudad', telefono = $telefono, fecha_nacimiento = '$fecha_nacimiento', sueldo = $sueldo WHERE id = $id");


                

                    $contraseña_segura = password_hash($contraseña, PASSWORD_BCRYPT, ['cost' => 5]);
    
                    $query_update_usuario = mysqli_query($conexion, "UPDATE usuarios SET username = '$usuario', rol = '$tipo_usuario', password = '$contraseña_segura' WHERE empleado_id = $id");
    
                    if ($query_update_empleado && $query_update_usuario) {
                        $_SESSION['update_success_employeed'] = "Empleado Actualizado con exito!!!";
                        unset($_SESSION['update_failed_employeed']);
                    }else{
                        $_SESSION['update_failed_employeed'] = "Hubo un error al actualizar el empleado";
                        
                    }
                    
                    
                }else{
                    $_SESSION['update_failed_employeed'] = "Hubo un error al actualizar el empleado";
                }

                

                
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
               
                <form action="#" method="post" class="form-update">
                        <?php if(isset($_SESSION['update_failed_employeed'])) : ?>
                            <div class="error">
                            <p><?php print_r($_SESSION['update_failed_employeed']); ?></p>
                            </div>
                        <?php elseif(isset($_SESSION['update_success_employeed'])) : ?>
                            <div class="success">
                                <p><?php print_r($_SESSION['update_success_employeed']); ?></p>
                            </div>
                        <?php endif; ?>
                        <input type="text" name="name" value="<?= $query_fetch['nombre'] ?>" autocomplete="off" >
                        <input type="number" name="dni" value="<?= $query_fetch['dni'] ?>" autocomplete="off">
                        <input type="text" name="cargo" value="<?= $query_fetch['cargo'] ?>" autocomplete="off">
                        <input type="text" name="direccion" value="<?= $query_fetch['direccion'] ?>" autocomplete="off">
                        <input type="text" name="ciudad" value="<?= $query_fetch['ciudad'] ?>" autocomplete="off">
                        <input type="number" name="telefono" value="<?= $query_fetch['telefono'] ?>" autocomplete="off">
                        <input type="date" name="fecha_nacimiento" value="<?= $query_fetch['fecha_nacimiento'] ?>" autocomplete="off">
                        <input type="number" name="sueldo" value="<?= $query_fetch['sueldo'] ?>" autocomplete="off">

                        <hr>
                        
                        <select name="tipo_usuario" class="select">
                                <option value="Usuario Comun">Usuario Comun</option>                                 
                                <option value="Administrador">Administrador</option> 
                        </select>
                        <input type="text" name="usuario" value="<?= $query_fetch_usuario['username'] ?>" autocomplete="off">
                        <input type="password" name="contraseña" value="11111111" autocomplete="off">
                        <input type="submit" value="Actualizar Empleado">
                    </form>
                

               
    

               


               
        </div>
    </section>
    

    
    </body>
</html>


       

                
    

        
        
        