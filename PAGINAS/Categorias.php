<?php
    require_once './Includes.php';
    require_once '../FUNCIONALIDADES/Conexion.php';
?>
         <navbar id="nav">
            <ul>
                <li><a href="./Inicio.php">Panel de Control</a></li>
                <li><a href="./Productos">Productos</a></li>
                <li><a href="./Categorias">Categorias</a></li>
                <li><a href="./Ventas.php">Ventas</a></li>
                <li><a href="./Acercade.php">Acerca de</a></li>
            </ul>
        </navbar>

        <div class="content-div">
            <div class="forms-category">
                <form action="../FUNCIONALIDADES/AgregarCategoria.php" method="post" class="save-category">
                    <?php if(isset($_SESSION['error_category_save'])) : ?>
                        <div class="error">
                        <p><?php print_r($_SESSION['error_category_save']); ?></p>
                        </div>
                    <?php elseif(isset($_SESSION['success_category_save'])) : ?>
                        <div class="success">
                            <p><?php print_r($_SESSION['success_category_save']); ?></p>
                        </div>
                    <?php endif; ?>
                    <input type="text" name="category" placeholder="Nombre de la categoria..." autocomplete="off">
                    <input type="submit" value="Guardar Categoria">
                </form>

                <form action="../FUNCIONALIDADES/EliminarCategoria.php" method="post" class="delete-category">
                    <?php if(isset($_SESSION['error_category_delete'])) : ?>
                        <div class="error">
                        <p><?php print_r($_SESSION['error_category_delete']); ?></p>
                        </div>
                    <?php elseif(isset($_SESSION['success_category_delete'])) : ?>
                        <div class="success">
                            <p><?php print_r($_SESSION['success_category_delete']); ?></p>
                        </div>
                    <?php endif; ?>
                    <input type="text" name="category" placeholder="Nombre de la categoria..." autocomplete="off">
                    <input type="submit" value="Eliminar Categoria">
                </form>

                <form action="../FUNCIONALIDADES/ActualizarCategoria.php" method="post" class="update-category">
                    <input type="text" name="category_before" placeholder="Nombre categoria anterior" autocomplete="off">
                    <input type="text" name="category_new" placeholder="Nombre categoria nuevo" autocomplete="off">
                    <input type="submit" value="Actualizar Categoria">
                </form>

            </div>
           
            <div class="tables">
                        <div>
                            <h2>Todas las categorias</h2>
                                <table id="category_table">
                                <tr class="category_table_hd">
                                    <td>Id</td>
                                    <td>Nombre categoria</td>
                                </tr>

                                    <?php 
                                        $sql = "SELECT * FROM categorias;";
                                        $result =  mysqli_query($conexion,$sql);

                                    

                                        while ($view = mysqli_fetch_assoc($result)) :
                                    ?>

                                <tr class="category_table_bd">
                                    <td><?php echo $view['id']; ?></td>
                                    <td><?php echo $view['nombre']; ?></tdss=>
                                </tr>

                                
                                <?php
                                        endwhile;

                                        
                                    
                                    ?>
                            </table>
                        </div>
            </div>

           
        </div>


    </section>
    

   
    </body>
</html>
