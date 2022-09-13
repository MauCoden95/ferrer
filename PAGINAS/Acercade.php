<?php
    require_once './Includes.php';
?>
      
<?php if($_SESSION['usuario']) : ?>
        <div class="content-div">
           <div class="about-content">
               <img src="../ASSETS/IMG/Logo.png" alt="Logo">

               <div class="info-system">
                    <h2>Acerca de</h2>
                    <h3>Sistema de Inventario y Facturación Ferrer</h3>
                    <h3>Versión: 1.0</h3>
                    <h3>Desarrollado por: Mauro Miguel</h3>
                    <h3>Contacto con el desarrollador: migmauro95@gmail.com</h3>
                </div>
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