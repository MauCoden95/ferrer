<?php
    require_once './Includes.php';
    require_once '../FUNCIONALIDADES/Conexion.php';
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

            <div class="buttons">
                <div>
                    <b>Total Productos: </b>
                    <?php 
                        $sql_total_products = mysqli_query($conexion,"SELECT count(*) FROM productos;");
                       while ($pro = mysqli_fetch_assoc($sql_total_products)) {
                        //var_dump($pro);
                        echo "<span>".$pro['count(*)']."</span>";
                       }
                        //print_r("<span>$sql_total_products;</span>");
                    ?>               
                </div>
                
                <button class="btn-add__product">Agregar Producto<i class="fas fa-plus-circle add-icon"></i></button>
                <button class="btn-update__product">Actualizar Producto<i class="fas fa-edit update-icon"></i></button>
                <button class="btn-delete__product">Eliminar Producto<i class="fas fa-minus-circle delete-icon"></i></button>
                <button class="btn-list__product">Listado Productos<i class="fas fa-list list-icon"></i></button>
                    
            </div>
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
                        <?php 
                            $sql_category_select = "SELECT * FROM categorias;";
                            $query_select = mysqli_query($conexion, $sql_category_select);

                   
                         ?>


                            <select name="category" class="select">
                            <option value="--Categoria--">--Categoria--</option>
                                    <?php while($cat = mysqli_fetch_assoc($query_select)) : ?>
                                        <option value="<?= $cat['nombre'] ?>"><?= $cat['nombre'] ?></option>         
                                <?php endwhile; ?>
                            
                            </select>
                        <!-- <input type="text" name="category" placeholder="Categoria"> -->
                        <input type="number" name="price" placeholder="Precio">
                        <input type="number" name="stock" placeholder="Stock">
                        <input type="number" name="stock_reposition" placeholder="Stock de reposicion">
                        <input type="submit" value="Guardar producto">
                </form>

                <form action="../FUNCIONALIDADES/ActualizarProducto.php" method="POST" class="update-product">
                
                <?php 
                    $sql = "SELECT * FROM productos;";
                    $query = mysqli_query($conexion, $sql);

                   
                ?>


            <select name="descripcion">
            <option value="--Descripcion--">--Descripcion--</option>
                    <?php while($pro = mysqli_fetch_assoc($query)) : ?>
                        <option value="<?= pro['descripcion'] ?>"><?= $pro['descripcion'] ?></option>         
                   <?php endwhile; ?>
               
            </select>
                        <input type="text" name="description_update" placeholder="Descripcion" autocomplete="off">
                        <!--<input type="text" name="category" placeholder="Categoria">-->
                        <input type="number" name="price_update" placeholder="Precio">
                        <input type="number" name="stock_update" placeholder="Stock">
                        <input type="number" name="stock_reposition_update" placeholder="Stock de reposicion">
                        <input type="submit" value="Actualizar producto">
                </form>

                <form action="../FUNCIONALIDADES/EliminarProducto.php" method="POST" class="delete-product">
                <?php 
                    $sql = "SELECT * FROM productos;";
                    $query = mysqli_query($conexion, $sql);

                   
                ?>
                        <select name="description">
                        <option value="--Descripcion--">--Descripcion--</option>
                                <?php while($prod = mysqli_fetch_assoc($query)) : ?>
                                    <option value="<?= $prod['descripcion'] ?>"><?= $prod['descripcion'] ?></option>         
                            <?php endwhile; ?>
                        
                        </select>
                        <input type="submit" value="Eliminar producto">
                </form>
            </div>
                
         
           
            <div class="tables">

                    <div class="buttons_product">
                        <button class="product_list">Listar todos los productos</button>
                        <button class="product_list_stock">Listar productos a reponer</button>
                    </div>
                        <table id="product_table">
                            
                            <tr class="product_table_hd">
                                <td>Id</td>
                                <td>Categoria</td>
                                <td>Descripcion</td>
                                <td>Precio</td>
                                <td>Stock</td>
                                <td>Stock de reposicion</td>
                            </tr>

                                <?php 
                                    $sql = "SELECT p.id, c.nombre AS 'categoria', p.descripcion, p.precio, p.stock, p.stock_reposicion FROM productos p, categorias c WHERE c.id = p.categoria_id;";
                                    $result =  mysqli_query($conexion,$sql);

                                    

                                    while ($view = mysqli_fetch_assoc($result)) :        
                                    
                                ?>

                            <tr class="product_table_bd">
                                <td><?php echo $view['id']; ?></td>
                                <td><?php echo $view['categoria']; ?></td>
                                <td><?php echo $view['descripcion']; ?></td>
                                <td><?php echo $view['precio']; ?></td>
                                <td><?php echo $view['stock']; ?></td>
                                <td><?php echo $view['stock_reposicion']; ?></td>
                            </tr>

                            
                            <?php
                                    endwhile;

                                    
                                
                                ?>
                        </table>

    
                        <table id="product_table_stock">
                    
                            <tr class="product_table_hd">
                                <td>Id</td>
                                <td>Categoria</td>
                                <td>Descripcion</td>
                                <td>Precio</td>
                                <td>Stock</td>
                                <td>Stock de reposicion</td>
                            </tr>

                                <?php 
                                    $sql = "SELECT p.id, c.nombre AS 'categoria', p.descripcion, p.precio, p.stock, p.stock_reposicion FROM productos p, categorias c WHERE c.id = p.categoria_id AND stock <= stock_reposicion;";
                                    $result =  mysqli_query($conexion,$sql);

                                    

                                    
                                    // $sql_category = "SELECT nombre FROM categorias WHERE id IN (SELECT categoria_id FROM productos)";
                                    // $sql_category_query = mysqli_query($conexion,$sql_category);

                                    /*
                                        select e.id, e.titulo, u.nombre as 'Autor', c.nombre as 'Categoria'
                                        from entradas e, usuarios u, categorias c
                                        where e.usuario_id =  u.id and e.categoria_id = c.id ORDER BY e.id;

                                        select c.nombre
                                        from categorias c, productos p
                                        where p.categoria_id =  c.id;
                                    */

                                    //$sql_category = "SELECT c.nombre FROM categorias c, productos p WHERE  c.id = p.categoria_id;";
                                    
                                    
                                    while ($view = mysqli_fetch_assoc($result)) :        
                                        //$sql_category_query = mysqli_query($conexion,$sql_category);
                                        
                                    
                                ?>

                            <tr class="product_table_bd">
                                <td><?php echo $view['id']; ?></td>
                                <td>
                                <?php echo $view['categoria']; ?>
                                </td>
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
            
        </div>
    </section>
    

   <script src="../JS/Main.js"></script>
    </body>
</html>
