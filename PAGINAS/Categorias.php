<?php
    require_once './Includes.php';
    require_once '../FUNCIONALIDADES/Conexion.php';
?>
       

        <div class="content-div">
            <div class="buttons">
            <div>
                    <b>Total Categorias: </b>
                    <?php 
                        $sql_total_categories = mysqli_query($conexion,"SELECT count(*) FROM categorias;");
                       while ($cat = mysqli_fetch_assoc($sql_total_categories)) {
                        //var_dump($pro);
                        echo "<span>".$cat['count(*)']."</span>";
                       }
                        //print_r("<span>$sql_total_products;</span>");
                    ?>               
                </div>
                <button class="btn-add__category">Agregar Categoria<i class="fas fa-plus-circle add-icon"></i></button>
                <button class="btn-update__category">Actualizar Categoria<i class="fas fa-edit update-icon"></i></button>
                <button class="btn-delete__category">Eliminar Categoria<i class="fas fa-minus-circle delete-icon"></i></button>
                <button class="btn-list__category">Listar Categorias<i class="fas fa-list list-icon"></i></button>
            </div>

            <form action="../FUNCIONALIDADES/Categoria/AgregarCategoria.php" method="post" class="save-category">
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

                <form action="../FUNCIONALIDADES/Categoria/ActualizarCategoria.php" method="post" class="update-category">
                    <input type="text" name="category_before" placeholder="Nombre categoria anterior" autocomplete="off">
                    <input type="text" name="category_new" placeholder="Nombre categoria nuevo" autocomplete="off">
                    <input type="submit" value="Actualizar Categoria">
                </form>

                <form action="../FUNCIONALIDADES/Categoria/EliminarCategoria.php" method="post" class="delete-category">
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

               
                            <table id="category_table">
                                <thead>
                                    <tr class="category_table_hd">
                                        <td class="td-id">Id</td>
                                        <td class="td-name">Nombre categoria</td>
                                    </tr>
                                </thead>

                                    <?php 
                                        $sql = "SELECT * FROM categorias;";
                                        $result =  mysqli_query($conexion,$sql);

                                    

                                        while ($view = mysqli_fetch_assoc($result)) :
                                    ?>

                                <tr class="category_table_bd">
                                    <td><?php echo $view['id']; ?></td>
                                    <td><?php echo $view['nombre']; ?></td>
                                </tr>

                                
                                <?php
                                        endwhile;

                                        
                                    
                                    ?>
                            </table>
            <!--
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

                <form action="../FUNCIONALIDADES/ActualizarCategoria.php" method="post" class="update-category">
                    <input type="text" name="category_before" placeholder="Nombre categoria anterior" autocomplete="off">
                    <input type="text" name="category_new" placeholder="Nombre categoria nuevo" autocomplete="off">
                    <input type="submit" value="Actualizar Categoria">
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

                                    -->
        </div>


    </section>
    

    <script src="../JS/Main.js"></script>
    </body>
</html>
