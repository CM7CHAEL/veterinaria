<?php
require("Cabeza.php");
require("SQL.php");
?>
	
	<?php
	 if($_POST){
		  	$queEmp = "INSERT INTO `veterinaria`.`prop_propietarios` (`prop_id`, `prop_nombre1`, `prop_apellido1`, `prop_fnacimiento`, `prop_direccion`, `prop_telcasa`, `prop_telcel`, `prop_teltrabajo`, `prop_email`, `prop_nit`, `prop_regfiscal`, `gen_genero_gen_id`) 
		  	VALUES (null, '".$_POST["Nombre1"]."', '".$_POST["Apellido1"]."','".$_POST["Fecha"]."', '".$_POST["Direcion"]."', '".$_POST["TelefonoCasa"]."', NULL, NULL, NULL, '".$_POST["NIT"]."', NULL, '1');";
			//echo $queEmp."<br>";
			$resEmp = mysqli_query($db_link, $queEmp) or die(mysqli_error()); 
			echo "<p> Creacion de Cliente Satisfecha </p>";
		 }
	 else{	 
	?>
				<center><p>
	<form name="formulario" method="POST" onSubmit='return Connprobacion()' action="AddCliente.php">
	<div align="center">
		  <table border="1">
		  	   <tr><td colspan="4"> <h2>REGISTRAR PROPIETARIO</h2></td></TR>
		  	  <tr>
		  	  	<td>Primer Nombre:</td><td><input type="text" name="Nombre1"></td>
		  	  	<td>Primer Apellido:</td><td><input type="text" name="Apellido1"></td>
		  	  </tr>
		  	  <tr>
		  	  	<td>Fecha de nacimiento</td><td><input type="date" name="Fecha"></td>
		  	  	<td>Direcion:</td><td><input type="text" name="Direcion"></td>
		  	  	<tr>
		  	     <td>Telefono </td><td><input type="text" name="TelefonoCasa"></td>
		  	     <td>NIT</td><td> <input type="text" name="NIT"></td>	
		  	  	</tr>
              <tr>
              	<td colspan="4"><input type="submit" value="Ingresar"></td>
              </tr>
                
	</form>
				</p></center>
       
     <?php
		}
     ?>  