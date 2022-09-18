<?php
    require_once './Includes.php';
    require_once '../FUNCIONALIDADES/Conexion.php';

?>
<?php if($_SESSION['usuario']) : ?>
        <div class="content-div">
            <div class="content-div-inicio">
            <form action="../FUNCIONALIDADES/PanelControl/CambiarContraseña.php" method="POST" class="change-password">
                <h2>Cambiar contraseña</h2>
                <?php if(isset($_SESSION['change_password_failed'])) : ?>
                    <div class="error">
                    <p><?php print_r($_SESSION['change_password_failed']); ?></p>
                    </div>
                <?php elseif(isset($_SESSION['change_password_success'])) : ?>
                    <div class="success">
                        <p><?php print_r($_SESSION['change_password_success']); ?></p>
                    </div>
                 <?php endif; ?>
                <input type="password" name="change-password">
                <input type="submit" value="Cambiar">
            </form>


            <form action="../FUNCIONALIDADES/PanelControl/CambiarUsuario.php" method="POST" class="change-username">
            <h2>Cambiar nombre de usuario</h2>
                <?php if(isset($_SESSION['change_username_failed'])) : ?>
                    <div class="error">
                    <p><?php print_r($_SESSION['change_username_failed']); ?></p>
                    </div>
                <?php elseif(isset($_SESSION['change_username_success'])) : ?>
                    <div class="success">
                        <p><?php print_r($_SESSION['change_username_success']); ?></p>
                    </div>
                 <?php endif; ?>
                <input type="text" name="change-username" autocomplete="off">
                <input type="submit" value="Cambiar">
            </form>

            
            
            <form action="../FUNCIONALIDADES/DatosUsuario.php" method="POST" class="info-user">
            <h2>Datos del usuario</h2>
                    <?php
                        $id_user = $_SESSION['id'];
                        $sql_usuarios = "SELECT * FROM usuarios WHERE id = $id_user;";
                        $query_usuarios = mysqli_query($conexion,$sql_usuarios);
                        $sql_usuarios_fetch = mysqli_fetch_assoc($query_usuarios);


                        $sql_empleados = "SELECT * FROM empleados WHERE id = $sql_usuarios_fetch[empleado_id]";
                        $query_empleados = mysqli_query($conexion,$sql_empleados);
                        $sql_empleados_fetch = mysqli_fetch_assoc($query_empleados);

                        $newDate = date("d/m/Y", strtotime($sql_empleados_fetch['fecha_nacimiento']));
                                            
                    ?>

                    <p><b>Nombre:</b> <?= $sql_empleados_fetch['nombre'] ?></p>
                    <p><b>Dni:</b> <?= $sql_empleados_fetch['dni'] ?></p>
                    <p><b>Cargo:</b> <?= $sql_empleados_fetch['cargo'] ?></p>
                    <p><b>Direccion:</b> <?= $sql_empleados_fetch['direccion'] ?></p>
                    <p><b>Ciudad:</b> <?= $sql_empleados_fetch['ciudad'] ?></p>
                    <p><b>Telefono:</b> <?= $sql_empleados_fetch['telefono'] ?></p>
                    <p><b>Fecha de nacimiento:</b> <?= $newDate ?></p>
                    <p><b>Sueldo:</b> <?= $sql_empleados_fetch['sueldo'].' $' ?></p>
                    <p><b>Usuario:</b> <?= $sql_usuarios_fetch['username'] ?></p>
            </form>
            </div>
            
        </div>
    </section>
    

   
    </body>
</html>

<?php else : ?>

<?php 
    header('Location: ../Index.php');    
?>

<?php endif; ?>