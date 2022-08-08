<?php
    require_once './Includes.php';
    require_once '../FUNCIONALIDADES/Conexion.php';
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
            <div class="forms-product">
                <form action="../FUNCIONALIDADES/AgregarProducto.php" method="POST" class="charge-product">
                        <?php if(isset($_SESSION['error_category_save'])) : ?>
                            <div class="error">
                            <p><?php print_r($_SESSION['error_category_save']); ?></p>
                            </div>
                        <?php elseif(isset($_SESSION['success_product_save'])) : ?>
                            <div class="success">
                                <p><?php print_r($_SESSION['success_product_save']); ?></p>
                            </div>
                        <?php endif; ?>
                        <input type="text" name="description" placeholder="Descripcion" autocomplete="off">
                        <input type="text" name="category" placeholder="Categoria">
                        <input type="number" name="price" placeholder="Precio">
                        <input type="number" name="stock" placeholder="Stock">
                        <input type="number" name="stock_reposition" placeholder="Stock de reposicion">
                        <input type="submit" value="Guardar producto">
                </form>

                <form action="../FUNCIONALIDADES/EliminarProducto.php" method="POST" class="delete-product">
                        <input type="text" name="description" placeholder="Descripcion" autocomplete="off">
                        <input type="submit" value="Eliminar producto">
                </form>

            </div>
                            
            <table id="product_table">
                    <tr class="product_table_hd">
                        <td>Id</td>
                        <td>Descripcion</td>
                        <td>Precio</td>
                        <td>Stock</td>
                        <td>Stock de reposicion</td>
                    </tr>

                        <?php 
                            $sql = "SELECT * FROM productos;";
                            $result =  mysqli_query($conexion,$sql);

                            

                            while ($view = mysqli_fetch_assoc($result)) :        
                             
                        ?>

                    <tr class="product_table_bd">
                        <td><?php echo $view['id']; ?></td>
                        
                        <td><?php echo $view['descripcion']; ?></td>
                        <td><?php echo $view['precio']; ?></td>
                        <td><?php echo $view['stock']; ?></td>
                        <td><?php echo $view['stock_reposicion']; ?></td>
                    </tr>

                    
                    <?php
                            endwhile;

                            
                        
                        ?>
                </table>

            
        </div>
    </section>
    

   
    </body>
</html>
