
<?php
require("Cabeza.php");
require("SQL.php");
?>
	
	<?php
	 if($_POST){
		 
		 if($_POST["pass1"] == $_POST["pass2"]){
			$queEmp = "UPDATE `veterinaria`.`usr_usuarios` SET `usr_passwd` = '".$_POST["pass1"]."' WHERE `usr_usuarios`.`usr_username` = '".$_SESSION["Usuario"]."'";
			//echo $queEmp;
			$resEmp = mysqli_query($db_link, $queEmp) or die(mysqli_error()); 
			echo "<p> Modificacion de Contraseña Satisfactoria </p>";
			 }
		 else
			echo "<p>Las contraseñas no coinciden intented de nuevo </p>";
		 
		 }
	 else{	 
	?>
				<center><p>
	<form name="formulario" method="POST" onSubmit='return Connprobacion()' action="EditUsuario.php">
	
	<p>Nueva Contraseña<input type="password" name="pass1"></p>
	<p>Confirmar-Contraseña<input type="password" name="pass2"></p>
	<p><input type="submit" value="Ingresar"></p>
	</form>
				</p></center>
       
     <?php
		}
     ?>  
       
           
<?php
mysqli_close($db_link);
require("Pie.php");
?>
