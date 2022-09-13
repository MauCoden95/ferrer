<?php
    require_once './Includes.php';
?>
     
<?php if($_SESSION['usuario']) : ?>
        <div class="content-div">
           
        </div>
    </section>
    

   
    </body>
</html>

<?php else : ?>

<?php 
    header('Location: ../Index.php');    
?>

<?php endif; ?>