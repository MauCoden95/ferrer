<?php
    require_once './Includes.php';
    require_once '../FUNCIONALIDADES/Conexion.php';
?>
       
<?php if($_SESSION['usuario']) : ?>
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


              

               
                            <table id="category_table">
                                <thead>
                                    <tr class="category_table_hd">
                                        <td class="td-id">Id</td>
                                        <td class="td-name">Nombre categoria</td>
                                        <td class="td-name">Opciones</td>
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
                                    <td>
                                        <a class='delete-icon-button' href="http://localhost/FerrerSoft/FUNCIONALIDADES/Categoria/EliminarCategoria.php?id= <?= $view['id']?>"><i class="fas fa-trash-alt"></i></a>
                                        <a class='update-icon-button' href="http://localhost/FerrerSoft/FUNCIONALIDADES/Categoria/ActualizarCategoria.php?id= <?= $view['id']?>"><i class="fas fa-edit"></i></a>
                                     </td>
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