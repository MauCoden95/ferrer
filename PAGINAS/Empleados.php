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



                <form action="../FUNCIONALIDADES/Empleado/AgregarEmpleado.php" method="post" class="charge-employer">
                    <input type="text" name="name" placeholder="Nombre" autocomplete="off" required>
                    <input type="number" name="dni" placeholder="Dni" autocomplete="off" required>
                    <input type="text" name="cargo" placeholder="Cargo" autocomplete="off" required>
                    <input type="text" name="direccion" placeholder="Direccion" autocomplete="off" required>
                    <input type="text" name="ciudad" placeholder="Ciudad" autocomplete="off" required>
                    <input type="number" name="telefono" placeholder="Telefono" autocomplete="off" required>
                    <input type="date" name="fecha_nacimiento" placeholder="Fecha de Nacimiento" autocomplete="off">
                    <input type="number" name="sueldo" placeholder="Sueldo" autocomplete="off">

                    <hr>
                    <select name="tipo_usuario" class="select">
                            <option value="--Tipo de usuario--">--Tipo de usuario--</option>
                            <option value="Usuario Comun">Usuario Comun</option>                                 
                            <option value="Administrador">Administrador</option> 
                    </select>
                    <input type="text" name="usuario" placeholder="Usuario" autocomplete="off" required>
                    <input type="password" name="contraseña" placeholder="Contraseña" autocomplete="off" required>
                    <input type="submit" value="Guardar Empleado">
                </form>
        </div>
    </section>
    

   
    </body>
</html>

<?php else : ?>

<?php 
    header('Location: ../Index.php');    
?>

<?php endif; ?>