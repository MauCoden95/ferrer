<?php
    require_once './Includes.php';
?>
         <navbar id="nav">
            <ul>
                <li><a href="./Inicio.php">Panel de Control</a></li>
                <li><a href="./Productos.php">Productos</a></li>
                <li><a href="./Categorias.php">Categorias</a></li>
                <li><a href="./Ventas.php">Ventas</a></li>
                <li><a href="./Acercade.php">Acerca de</a></li>
            </ul>
        </navbar>

        <div class="content-div">
            <form action="../FUNCIONALIDADES/AgregarProducto.php" method="POST" class="charge-product">
                    <input type="text" name="description" placeholder="Descripcion" autocomplete="off">
                    <input type="text" name="category" placeholder="Categoria">
                    <input type="number" name="price" placeholder="Precio">
                    <input type="number" name="stock" placeholder="Stock">
                    <input type="number" name="stock_reposition" placeholder="Stock de reposicion">
                    <input type="submit" value="Guardar producto">
            </form>
        </div>
    </section>
    

   
    </body>
</html>
