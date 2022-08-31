<?php
    require_once './Includes.php';
?>
         <navbar id="nav">
            <ul>
                <li><a href="./Inicio.php"><span>Panel de Control</span><i class="fas fa-cogs"></i></a></li>
                <li><a href="./Productos"><span>Productos</span><i class="fas fa-box"></i></a></li>
                <li><a href="./Categorias.php"><span>Categorias</span><i class="fas fa-list-ul"></i></a></li>
                <li><a href="./Ventas.php"><span>Ventas</span><i class="fas fa-coins"></i></a></li>
                <li><a href="./Proveedores.php"><span>Proveedores</span><i class="fas fa-cart-arrow-down"></i></a></li>
                <li><a href="./Acercade.php"><span>Acerca de</span><i class="fas fa-address-book"></i></a></li>
            </ul>
        </navbar>

        <div class="content-div">
            <div class="content-div-inicio">
            <form action="../FUNCIONALIDADES/CambiarContraseña.php" method="POST" class="change-password">
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


            <form action="../FUNCIONALIDADES/CambiarUsuario.php" method="POST" class="change-password">
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
                    
            </form>
            </div>
            
        </div>
    </section>
    

   
    </body>
</html>
