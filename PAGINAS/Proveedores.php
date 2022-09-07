<?php
    require_once './Includes.php';
    require_once '../FUNCIONALIDADES/Conexion.php';
?>
        

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
                
                <button class="btn-add__product">Agregar Proveedor<i class="fas fa-plus-circle add-icon"></i></button>
                <button class="btn-update__product">Actualizar Proveedor<i class="fas fa-edit update-icon"></i></button>
                <button class="btn-delete__product">Eliminar Proveedor<i class="fas fa-minus-circle delete-icon"></i></button>
                <button class="btn-list__product">Listado Proveedores<i class="fas fa-list list-icon"></i></button>
                    
            </div>
        </div>
    </section>
    

   
    </body>
</html>
