<?php
    require_once '../Conexion.php';
    session_start();

    if (isset($_POST)) {
        $id = isset($_POST['id_provider']) ? $_POST['id_provider'] : false;
        $razon_social = isset($_POST['name']) ? $_POST['name'] : false;
        $direccion = isset($_POST['address']) ? $_POST['address'] : false;
        $ciudad = isset($_POST['city']) ? $_POST['city'] : false;
        $codigo_postal = isset($_POST['postal_code']) ? $_POST['postal_code'] : false;
        $telefono = isset($_POST['phone']) ? $_POST['phone'] : false;
        $cuit = isset($_POST['cuit']) ? $_POST['cuit'] : false;

        echo $id.' - '
                .$razon_social.' - '
                .$direccion.' - '
                .$ciudad.' - '
                .$codigo_postal.' - '
                .$telefono.' - '
                .$cuit;
        echo "<hr>";

        $sql_id = "SELECT * FROM proveedores WHERE id = $id";
        $query_provider = mysqli_query($conexion,$sql_id);
        $query_provider_fetch = mysqli_fetch_assoc($query_provider);
        var_dump($query_provider_fetch[id]);

        echo "<hr>";

        $sql_update = "UPDATE proveedores SET  razon_social = '$razon_social', direccion = '$direccion', ciudad = '$ciudad', codigo_postal = $codigo_postal, telefono = $telefono, cuit = $cuit  WHERE id = $id;";
        $query_update = mysqli_query($conexion,$sql_update);

        if ($query_update) {
            echo "COMPLETE";
            $_SESSION['success_provider_update'] = "Proveedor actualizado con exito!!!";
        }else{
            echo "FAILED";
            $_SESSION['error_provider_update'] = "Hubo un error al actualizar el proveedor";
        }

    }

    header('Location: ../../PAGINAS/Proveedores.php');

    
?>