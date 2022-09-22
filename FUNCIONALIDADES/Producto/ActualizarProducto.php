<?php 
    session_start(); 
    
    require_once '../Conexion.php';
   
    if (isset($_GET)) {
        $id = isset($_GET['id']) ? $_GET['id'] : false;

       
        $query = mysqli_query($conexion,"SELECT * FROM productos WHERE id = $id;");

        if ($query) {
            $query_fetch = mysqli_fetch_assoc($query);
            
            

            $query_categoria = mysqli_query($conexion,"SELECT * FROM categorias WHERE id = $query_fetch[categoria_id]");
            $query_categoria_fetch = mysqli_fetch_assoc($query_categoria);

            $query_proveedor = mysqli_query($conexion,"SELECT * FROM proveedores WHERE id = $query_fetch[proveedor_id]");
            $query_proveedor_fetch = mysqli_fetch_assoc($query_proveedor);
            



            if ($_POST) {
                $categoria = isset($_POST['category']) ? $_POST['category'] : false;
                $proveedor = isset($_POST['proveedor']) ? $_POST['proveedor'] : false;
                $descripcion = isset($_POST['description_update']) ? $_POST['description_update'] : false;
                $precio = isset($_POST['price_update']) ? $_POST['price_update'] : false;
                $stock = isset($_POST['stock_update']) ? $_POST['stock_update'] : false;
                $stock_reposicion = isset($_POST['stock_reposition_update']) ? $_POST['stock_reposition_update'] : false;

               
                $query_category = mysqli_query($conexion, "SELECT id FROM categorias WHERE nombre = '$categoria'");
                $fetch_query_category = mysqli_fetch_assoc($query_category);

                $query_provider = mysqli_query($conexion, "SELECT id FROM categorias WHERE nombre = '$categoria'");
                $fetch_query_provider = mysqli_fetch_assoc($query_provider);

                $query_update = mysqli_query($conexion, "UPDATE productos SET categoria_id = $fetch_query_category[id], proveedor_id = $fetch_query_provider[id], descripcion = '$descripcion', precio = $precio, stock = $stock, stock_reposicion = $stock_reposicion WHERE id = $id");
                
                if ($query_update) {
                    echo "Success";
                }else{
                    echo "Failed";
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
                <form action="#" method="POST" class='form-update'>

                             
                        <input type="text" name="category" value="<?= $query_categoria_fetch['nombre'] ?>" autocomplete="off">
                        <input type="text" name="provider" value="<?= $query_proveedor_fetch['razon_social'] ?>" autocomplete="off">
                        <input type="text" name="description_update" value="<?= $query_fetch['descripcion'] ?>" autocomplete="off">
                        <input type="number" name="price_update" value="<?= $query_fetch['precio'] ?>">
                        <input type="number" name="stock_update" value="<?= $query_fetch['stock'] ?>">
                        <input type="number" name="stock_reposition_update" value="<?= $query_fetch['stock_reposicion'] ?>">
                        <input type="submit" value="Actualizar producto">
                </form>
                

               
    

               


               
        </div>
    </section>
    

    
    </body>
</html>


       

                
    

        
        
        