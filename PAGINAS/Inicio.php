<?php require_once './Includes.php'; ?>

    <div id="pannel-user">
            <div class="logout">
                    <a href="../Index.php">Cerrar Sesión <i class="fas fa-sign-out-alt"></i></a>
            </div>

            <form action="../FUNCIONALIDADES/CambiarUsuario.php" method="post" class="change-username">
                <h3>Cambiar nombre o contraseña del usuario</h3>
                <input type="text" name="username" placeholder="Cambiar usuario">
                <input type="text" name="password" placeholder="Cambiar contraseña">

                <input type="submit" value="Cambiar">
            </form>
    </div>

</body>
</html>
