<?php
    require_once '../Conexion.php';
    session_start();

    if (isset($_POST)) {
        $id = isset($_POST['id_product']) ? $_POST['id_product'] : false;
        $categoria = isset($_POST['category']) ? $_POST['category'] : false;
        $proveedor = isset($_POST['provider']) ? $_POST['provider'] : false;
        $descripcion = isset($_POST['description_update']) ? $_POST['description_update'] : false;
        $precio = isset($_POST['price_update']) ? $_POST['price_update'] : false;
        $stock = isset($_POST['stock_update']) ? $_POST['stock_update'] : false;
        $stock_reposicion = isset($_POST['stock_reposition_update']) ? $_POST['stock_reposition_update'] : false;

        echo $id.' - '
                .$categoria.' - '
                .$proveedor.' - '
                .$descripcion.' - '
                .$precio.' - '
                .$stock.' - '
                .$stock_reposicion;
        echo "<hr>";

        $sql_id = "SELECT * FROM productos WHERE id = $id";
        $query_product = mysqli_query($conexion,$sql_id);
        $query_product_fetch = mysqli_fetch_assoc($query_product);
        var_dump($query_product_fetch);
        
        echo "<hr>";
        $sql_provider = "SELECT id FROM proveedores WHERE razon_social = '$proveedor'";
        $query_provider = mysqli_query($conexion,$sql_provider);
        $query_provider_fetch = mysqli_fetch_assoc($query_provider);
        var_dump($query_provider_fetch);

        echo "<hr>";
        $sql_category = "SELECT id FROM categorias WHERE nombre = '$categoria'";
        $query_category = mysqli_query($conexion,$sql_category);
        $query_category_fetch = mysqli_fetch_assoc($query_category);
        var_dump($query_category_fetch);

        echo "<hr>";

        $sql_update = "UPDATE productos SET categoria_id = $query_category_fetch[id], proveedor_id = $query_provider_fetch[id], descripcion = '$descripcion', precio = $precio, stock = $stock, stock_reposicion = $stock_reposicion  WHERE id = $id;";
        $query_update = mysqli_query($conexion,$sql_update);

        if ($query_update) {
            echo "COMPLETE";
            $_SESSION['success_product_update'] = "Producto actualizado con exito!!!";
        }else{
            echo "FAILED";
            $_SESSION['error_product_update'] = "Hubo un error al actualizar el producto";
        }
    }

    header('Location: ../../PAGINAS/Productos.php');

    
?>