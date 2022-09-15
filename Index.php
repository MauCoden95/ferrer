<?php 
    session_start();
    require_once './FUNCIONALIDADES/Conexion.php';
 ?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/7483adbd94.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./ASSETS/Login.css">
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
            <!-- <input type="text" name="username" placeholder="Ingrese su usuario" autocomplete="off"> -->
            <?php 
                    $sql = "SELECT * FROM usuarios;";
                    $query = mysqli_query($conexion, $sql);

                   
                ?>


            <select name="username">
            <option value="--usuario--">--Usuario--</option>
                    <?php while($user = mysqli_fetch_assoc($query)) : ?>
                        <option value="<?= $user['username'] ?>"><?= $user['username'] ?></option>         
                   <?php endwhile; ?>
               
            </select>
            <input type="password" name="password" placeholder="Ingrese su contraseña" autocomplete="off">
        </div>
        <input type="submit" value="Ingresar" id="enviar">
       
    </form>
    <?php session_destroy(); ?>
</body>
</html>