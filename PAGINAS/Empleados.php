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




                <form action="../FUNCIONALIDADES/Empleado/AgregarEmpleado.php" method="post" class="update-employer">
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
                    <input type="submit" value="Actualizar Empleado">
                </form>




               

                <table id="employeed_table">
                                <thead>
                                    <tr class="employeed_table_hd">
                                        <td class="td-id">Id</td>
                                        <td class="td-name">Nombre</td>
                                        <td class="td-name">Dni</td>
                                        <td class="td-name">Cargo</td>
                                        <td class="td-name">Direccion</td>
                                        <td class="td-name">Ciudad</td>
                                        <td class="td-name">Telefono</td>
                                        <td class="td-name">Fecha de nacimiento</td>
                                        <td class="td-name">Sueldo</td>
                                        <td class="td-name">Opciones</td>
                                    </tr>
                                </thead>

                                    <?php 
                                        $sql = "SELECT * FROM empleados;";
                                        $result =  mysqli_query($conexion,$sql);

                                    

                                        while ($view = mysqli_fetch_assoc($result)) :
                                    ?>

                                <tr class="employeed_table_bd">
                                    <td><?php echo $view['id']; ?></td>
                                    <td><?php echo $view['nombre']; ?></td>
                                    <td><?php echo $view['dni']; ?></td>
                                    <td><?php echo $view['cargo']; ?></td>
                                    <td><?php echo $view['direccion']; ?></td>
                                    <td><?php echo $view['ciudad']; ?></td>
                                    <td><?php echo $view['telefono']; ?></td>
                                    <td>
                                        <?php 
                                            $newDate = date("d/m/Y", strtotime($view['fecha_nacimiento']));
                                            echo $newDate; 

                                        ?>
                                    </td>
                                    <td><?php echo $view['sueldo']; ?></td>
                                    <td>
                                        <a class='delete-icon-button' href="http://localhost/FerrerSoft/FUNCIONALIDADES/Empleado/EliminarEmpleado.php?id= <?= $view['id']?>"><i class="fas fa-trash-alt"></i></a>
                                        <a class='update-icon-button' href="http://localhost/FerrerSoft/FUNCIONALIDADES/Empleado/ActualizarEmpleado.php?id= <?= $view['id']?>"><i class="fas fa-edit"></i></a>
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