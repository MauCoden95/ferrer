<?php
    require_once './Includes.php';
    require_once '../FUNCIONALIDADES/Conexion.php'
?>
<?php if($_SESSION['usuario']) : ?>

        <div class="content-div">
                <div class="buttons">                
                    <button class="btn-open">Apertura de caja<i class="fas fa-cash-register caja-open"></i></button>
                    <button class="btn-close">Cierre de caja<i class="fas fa-cash-register caja-close"></i></button>
                    <button class="btn-table-caja">Listado apertura/cierres<i class="fas fa-list list-icon"></i></button>
                </div>

                <form action="../FUNCIONALIDADES/Caja/Apertura.php" method="post" id="form-open-caja">
                      
                            <?php  if(isset($_SESSION['open_success'])) :  ?>
                                <div class="success">
                                    <p><?php print_r($_SESSION['open_success']); ?></p>
                                </div>
                            <?php  elseif(isset($_SESSION['open_failed'])) :  ?>
                                <div class="error">
                                    <p><?php print_r($_SESSION['open_failed']); ?></p>
                                </div>
                            <?php  endif;  ?>
                       
                        <input type="number" name="open">
                        <input type="submit" value="Apertura">
                </form>


                <form action="../FUNCIONALIDADES/Caja/Cierre.php" method="post" id="form-close-caja">
                  
                      <?php  if(isset($_SESSION['close_success'])) :  ?>
                          <div class="success">
                              <p><?php print_r($_SESSION['close_success']); ?></p>
                          </div>
                      <?php  elseif(isset($_SESSION['close_failed'])) :  ?>
                          <div class="error">
                              <p><?php print_r($_SESSION['close_failed']); ?></p>
                          </div>
                      <?php  endif;  ?> 
                 
                  <input type="number" name="close">
                  <input type="submit" value="Cierre">
                </form>


                <table id="caja_table">
                                <thead>
                                    <tr class="caja_table_hd">
                                        <td>Id</td>
                                        <td>Apertura de caja</td>
                                        <td>Cierre de caja</td>
                                        <td>Fecha</td>
                                        <td>Opciones</td>
                                    </tr>
                                </thead>

                                    <?php 
                                        $sql = "SELECT * FROM cajas ORDER BY fecha DESC;";
                                        $result =  mysqli_query($conexion,$sql);

                                    

                                        while ($view = mysqli_fetch_assoc($result)) :
                                    ?>

                                <tr class="caja_table_bd">
                                    <td><?php echo $view['id']; ?></td>
                                    <td><?php echo $view['apertura'].'$'; ?></td>
                                    <td><?php echo $view['cierre'].'$'; ?></td>
                                    <td>
                                        <?php 
                                            $newDate = date("d/m/Y", strtotime($view['fecha']));
                                            echo $newDate; 

                                        ?>
                                    </td>
                                    <td>
                                        <a class='delete-icon' href="http://localhost/FerrerSoft/FUNCIONALIDADES/Caja/EliminarCaja.php?id= <?= $view['id']?>"><i class="fas fa-trash-alt"></i></a>
                                        <a class='update-icon' href="http://localhost/FerrerSoft/FUNCIONALIDADES/DeleteProduct.php?id= <?= $view['id']?>"><i class="fas fa-edit"></i></a>
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