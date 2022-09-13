<?php
    require_once './Includes.php';
    require_once '../FUNCIONALIDADES/Conexion.php';
?>
<?php if($_SESSION['usuario']) : ?>

    <div class="content-div">
        
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