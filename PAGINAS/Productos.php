<?php
    require_once './Includes.php';
    require_once '../FUNCIONALIDADES/Conexion.php';
?>

<?php if($_SESSION['usuario']) : ?>
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
                <button class="btn-list__product">Listado Productos<i class="fas fa-list list-icon"></i></button>

            </div>



         <div class="forms-product">
                <form action="../FUNCIONALIDADES/Producto/AgregarProducto.php" method="POST" class="charge-product">
                        <?php if(isset($_SESSION['error_product_save'])) : ?>
                            <div class="error">
                            <p><?php print_r($_SESSION['error_product_save']); ?></p>
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


                            $sql_provider_select = "SELECT * FROM proveedores;";
                            $query_select_provider = mysqli_query($conexion, $sql_provider_select);
                         ?>


                            <select name="category" class="select">
                            <option value="--Categoria--">--Categoria--</option>
                                    <?php while($cat = mysqli_fetch_assoc($query_select)) : ?>
                                        <option value="<?= $cat['nombre'] ?>"><?= $cat['nombre'] ?></option>
                                <?php endwhile; ?>

                            </select>
                            <select name="provider" class="select">
                            <option value="--Proveedor--">--Proveedor--</option>
                                <?php while($prov = mysqli_fetch_assoc($query_select_provider)) : ?>
                                        <option value="<?= $prov['razon_social'] ?>"><?= $prov['razon_social'] ?></option>
                                <?php endwhile; ?>

                            </select>
                        <!-- <input type="text" name="category" placeholder="Categoria"> -->
                        <input type="number" name="price" placeholder="Precio">
                        <input type="number" name="stock" placeholder="Stock">
                        <input type="number" name="stock_reposition" placeholder="Stock de reposicion">
                        <input type="submit" value="Guardar producto">
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
                                <td>Proveedor</td>
                                <td>Descripcion</td>
                                <td>Precio</td>
                                <td>Stock</td>
                                <td>Stock de reposicion</td>
                                <td>Opciones</td>
                            </tr>

                                <?php
                                    $sql = "SELECT p.id, c.nombre AS 'categoria', pr.razon_social AS 'razon_social', p.descripcion, p.precio, p.stock, p.stock_reposicion FROM productos p, categorias c, proveedores pr WHERE c.id = p.categoria_id AND pr.id = p.proveedor_id;";
                                    $result =  mysqli_query($conexion,$sql);



                                    while ($view = mysqli_fetch_assoc($result)) :

                                ?>

                            <tr class="product_table_bd">
                                <td><?php echo $view['id']; ?></td>
                                <td><?php echo $view['categoria']; ?></td>
                                <td><?php echo $view['razon_social']; ?></td>
                                <td><?php echo $view['descripcion']; ?></td>
                                <td><?php echo $view['precio']; ?></td>
                                <td><?php echo $view['stock']; ?></td>
                                <td><?php echo $view['stock_reposicion']; ?></td>
                                <td>
                                    <a class='delete-icon-button' href="http://localhost/FerrerSoft/FUNCIONALIDADES/Producto/EliminarProducto.php?id= <?= $view['id']?>"><i class="fas fa-trash-alt"></i></a>
                                    <a class='update-icon-button' href="http://localhost/FerrerSoft/FUNCIONALIDADES/Producto/ActualizarProducto.php?id= <?= $view['id']?>"><i class="fas fa-edit"></i></a>
                                </td>

                            </tr>


                            <?php
                                    endwhile;



                                ?>
                        </table>


                        <table id="product_table_stock">

                            <tr class="product_table_hd">
                                <td>Id</td>
                                <td>Categoria</td>
                                <td>Proveedor</td>
                                <td>Descripcion</td>
                                <td>Precio</td>
                                <td>Stock</td>
                                <td>Stock de reposicion</td>
                            </tr>

                                <?php
                                    $sql = "SELECT p.id, c.nombre AS 'categoria', pr.razon_social AS 'razon_social', p.descripcion, p.precio, p.stock, p.stock_reposicion FROM productos p, categorias c, proveedores pr WHERE c.id = p.categoria_id AND pr.id = p.proveedor_id AND stock <= stock_reposicion;";
                                    $result =  mysqli_query($conexion,$sql);







                                    while ($view = mysqli_fetch_assoc($result)) :



                                ?>

                            <tr class="product_table_bd">
                                <td><?php echo $view['id']; ?></td>
                                <td>
                                <?php echo $view['categoria']; ?>
                                </td>
                                <td><?php echo $view['razon_social']; ?></td>
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


<?php else : ?>

<?php
    header('Location: ../Index.php');
?>

<?php endif; ?>