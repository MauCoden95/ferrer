<?php
    require_once './Includes.php';
    require_once '../FUNCIONALIDADES/Conexion.php';
?>
     
<?php if($_SESSION['usuario']) : ?>
        <div class="content-div">
        <div class="buttons">
                <div>
                    <b>Total Empleados: </b>
                    <?php 
                        $sql_total_employees = mysqli_query($conexion,"SELECT count(*) FROM empleados;");
                       while ($emp = mysqli_fetch_assoc($sql_total_employees)) {
                        //var_dump($pro);
                        echo "<span>".$emp['count(*)']."</span>";
                       }
                        //print_r("<span>$sql_total_products;</span>");
                    ?>               
                </div>
                
                <button class="btn-add__employeed">Agregar Empleado<i class="fas fa-plus-circle add-icon"></i></button>
                <button class="btn-update__employeed">Actualizar Empleado<i class="fas fa-edit update-icon"></i></button>
                <button class="btn-delete__employeed">Eliminar Empleado<i class="fas fa-minus-circle delete-icon"></i></button>
                <button class="btn-list__employeed">Listado Empleados<i class="fas fa-list list-icon"></i></button>
                    
            </div>
        </div>
    </section>
    

   
    </body>
</html>

<?php else : ?>

<?php 
    header('Location: ../Index.php');    
?>

<?php endif; ?>