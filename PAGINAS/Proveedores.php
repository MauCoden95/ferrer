<?php
    require_once './Includes.php';
    require_once '../FUNCIONALIDADES/Conexion.php';
?>
        
<?php if($_SESSION['usuario']) : ?>
    <div class="content-div">
        <div class="buttons">
                <div>
                    <b>Total Proveedores: </b>
                    <?php 
                        $sql_total_providers = mysqli_query($conexion,"SELECT count(*) FROM proveedores;");
                       while ($prov = mysqli_fetch_assoc($sql_total_providers)) {
                        //var_dump($pro);
                        echo "<span>".$prov['count(*)']."</span>";
                       }
                        //print_r("<span>$sql_total_products;</span>");
                    ?>               
                </div>
                
                <button class="btn-add__provider">Agregar Proveedor<i class="fas fa-plus-circle add-icon"></i></button>
                <button class="btn-update__provider">Actualizar Proveedor<i class="fas fa-edit update-icon"></i></button>
                <button class="btn-delete__provider">Eliminar Proveedor<i class="fas fa-minus-circle delete-icon"></i></button>
                <button class="btn-list__provider">Listado Proveedores<i class="fas fa-list list-icon"></i></button>
                    
            </div>

            <div class="forms-provider">
                    <form action="../FUNCIONALIDADES/Proveedor/AgregarProveedor.php" method="POST" class="charge-provider">
                            
                            <input type="text" name="name" placeholder="Razon social" autocomplete="off">
                            <input type="text" name="address" placeholder="Direccion" autocomplete="off">
                            <input type="text" name="city" placeholder="Ciudad" autocomplete="off">
                            <input type="number" name="postal_code" placeholder="Codigo Postal" autocomplete="off">
                            <input type="number" name="phone" placeholder="Telefono" autocomplete="off">
                            <input type="number" name="cuit" placeholder="Cuit" autocomplete="off">
                            <input type="submit" value="Guardar proveedor">
                    </form>

                <form action="../FUNCIONALIDADES/Producto/ActualizarProducto.php" method="POST" class="update-provider">
                
                            <?php 
                                $sql = "SELECT * FROM proveedores;";
                                $query = mysqli_query($conexion, $sql);

                            
                            ?>


                            <select name="descripcion">
                            <option value="--Razon Social--">--Razon Social--</option>
                                    <?php while($pro = mysqli_fetch_assoc($query)) : ?>
                                        <option value="<?= pro['razon_social'] ?>"><?= $pro['razon_social'] ?></option>         
                                <?php endwhile; ?>
                            
                            </select>
                            <input type="text" name="name" placeholder="Razon social" autocomplete="off">
                            <input type="text" name="address" placeholder="Direccion" autocomplete="off">
                            <input type="text" name="city" placeholder="Ciudad" autocomplete="off">
                            <input type="number" name="postal_code" placeholder="Codigo Postal" autocomplete="off">
                            <input type="number" name="phone" placeholder="Telefono" autocomplete="off">
                            <input type="number" name="cuit" placeholder="Cuit" autocomplete="off">
                        <input type="submit" value="Actualizar proveedor">
                </form>

                <form action="../FUNCIONALIDADES/Proveedor/EliminarProveedor.php" method="POST" class="delete-provider">
                <?php 
                    $sql = "SELECT * FROM proveedores;";
                    $query = mysqli_query($conexion, $sql);

                   
                ?>
                        <select name="razon_social">
                        <option value="--Razon Social--">--Razon Social--</option>
                                <?php while($prod = mysqli_fetch_assoc($query)) : ?>
                                    <option value="<?= $prod['razon_social'] ?>"><?= $prod['razon_social'] ?></option>         
                            <?php endwhile; ?>
                        
                        </select>
                        <input type="submit" value="Eliminar proveedor">
                </form>
            </div>
                

            <table id="provider_table">
                                <thead>
                                    <tr class="provider_table_hd">
                                        <td>Id</td>
                                        <td>Razon Social</td>
                                        <td>Direccion</td>
                                        <td>Ciudad</td>
                                        <td>Codigo Postal</td>
                                        <td>Telefono</td>
                                        <td>Cuit</td>
                                    </tr>
                                </thead>

                                    <?php 
                                        $sql = "SELECT * FROM proveedores;";
                                        $result =  mysqli_query($conexion,$sql);

                                    

                                        while ($view = mysqli_fetch_assoc($result)) :
                                    ?>

                                <tr class="provider_table_bd">
                                    <td><?php echo $view['id']; ?></td>
                                    <td><?php echo $view['razon_social']; ?></td>
                                    <td><?php echo $view['direccion']; ?></td>
                                    <td><?php echo $view['ciudad']; ?></td>
                                    <td><?php echo $view['codigo_postal']; ?></td>
                                    <td><?php echo $view['telefono']; ?></td>
                                    <td><?php echo $view['cuit']; ?></td>
                                </tr>

                                
                                <?php
                                        endwhile;

                                        
                                    
                                    ?>
                            </table>
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