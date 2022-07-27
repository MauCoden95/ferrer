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
           <form action="../FUNCIONALIDADES/AgregarCategoria.php" method="post" class="save-category">
                <?php if(isset($_SESSION['error_category'])) : ?>
                    <div class="error">
                    <p><?php print_r($_SESSION['error_category']); ?></p>
                    </div>
                <?php elseif(isset($_SESSION['success_category'])) : ?>
                    <div class="success">
                        <p><?php print_r($_SESSION['success_category']); ?></p>
                    </div>
                 <?php endif; ?>
               <input type="text" name="category" placeholder="Nombre de la categoria...">
               <input type="submit" value="Guardar Categoria">
           </form>

           <table id="category_table">
               <tr>
                   <td>Id</td>
                   <td>Nombre</td>
               </tr>

                <?php 
                    $sql = "SELECT * FROM categorias;";
                    $result =  mysqli_query($conexion,$sql);

             

                    while ($view = mysqli_fetch_assoc($result)) :
                ?>

               <tr>
                   <td><?php $view['id']; ?></td>
                   <td><?php $view['nombre']; ?></td>
               </tr>

               <?php
                    endwhile;
                   
                ?>
           </table>
        </div>


    </section>
    

   
    </body>
</html>
