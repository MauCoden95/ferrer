<?php
    require_once '../Conexion.php';

    if (isset($_POST)) {

        $razon_social = isset($_POST['name']) ? $_POST['name'] : false;
        $direccion = isset($_POST['address']) ? $_POST['address'] : false;
        $ciudad = isset($_POST['city']) ? $_POST['city'] : false;
        $codigo_postal = isset($_POST['postal_code']) ? $_POST['postal_code'] : false;
        $telefono = isset($_POST['phone']) ? $_POST['phone'] : false;
        $cuit = isset($_POST['cuit']) ? $_POST['cuit'] : false;


        echo $razon_social.' '.$direccion.' '.$ciudad.' '.$codigo_postal.' '.$telefono.' '.$cuit;

        $sql = "INSERT INTO proveedores VALUES(NULL,'$razon_social','$direccion','$ciudad',$codigo_postal,$telefono,$cuit);";
        $query = mysqli_query($conexion,$sql);

        if ($query) {
            echo "Proveedor guardado con exito!!!";

        }else{
            echo "Hubo un error al guardar el nuevo proveedor";
        }



    }

    header('Location: ../../PAGINAS/Proveedores.php');

?>




