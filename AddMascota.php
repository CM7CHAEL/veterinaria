   
<?php
require("Cabeza.php");
require("SQL.php");
?>
	
	<?php
	 if($_POST){
		  	$queEmp = "INSERT INTO `veterinaria`.`infm_informacion_mascotas` (`infm_id`, `infm_nombre`, `infm_apellido1`, `infm_apellido2`, `infm_foto`, `infm_nacimiento`, `infm_descripcion`, `id_propietario`, `mas_infm_id`, `gen_infm_id`, `esm_infm_id`, `tps_infm_id`, `infm_fingreso`, `infm_fsalida`, `fam_infm_id`, `genm_infm_id`) 
		  	VALUES (NULL, '".$_POST["Nombre1"]."','".$_POST["Apellido1"]."', '".$_POST["Apellido2"]."', NULL, '".$_POST["Nacimiento"]."','".$_POST["Descripcion"]."', '".$_POST["Propietario"]."', '".$_POST["Especie"]."', '".$_POST["Genero"]."', '".$_POST["Estado"]."', '".$_POST["EstadoClinico"]."', '".$_POST["FechaIngeso"]."', null, '".$_POST["Familia"]."', '".$_POST["Genero"]."')";
		  	echo $queEmp;
			$resEmp = mysqli_query($db_link ,$queEmp) or die(mysqli_error()); 
			echo "<p> Creacion de Cliente mascota </p>";
		 }
	 else{	 
	?>
				<center><p>
	<form name="formulario" method="POST" onSubmit='return Connprobacion()' action="AddMascota.php">
	
	<p>Primer nombre: <input type="text" name="Nombre1"></p>
	<p>Primer Apelliso: <input type="text" name="Apellido1"></p>
	<p>Segundo Apellido: <input type="text" name="Apellido2"></p>
	<p>Nacimiento(Año-Mes-Dia): <input type="text" name="Nacimiento"></p>
	<p>Descripcion: <input type="text" name="Descripcion"></p>
	<p>Propietario: 
	<select name="Propietario">
		<?php
		$queEmp = "SELECT * FROM `prop_propietarios` ";
		$resEmp = mysqli_query($db_link, $queEmp) or die(mysqli_error());
		while ($row = mysqli_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p>
	<p>Especie: 
	<select name="Especie">
		<?php
		$queEmp = "SELECT * FROM `mas_mascotas`";
		$resEmp = mysqli_query($db_link ,$queEmp) or die(mysqli_error());
		while ($row = mysqli_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p>
	<p>Familia:
	<select name="Familia">
		<?php
		$queEmp = "SELECT * FROM `fam_familia`";
		$resEmp = mysqli_query($db_link, $queEmp) or die(mysql_error());
		while ($row = mysqli_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p>
	<p>Genero: 
	<select name="Genero">
		<?php
		$queEmp = "SELECT * FROM `gen_genero`";
		$resEmp = mysqli_query($db_link, $queEmp) or die(mysqli_error());
		while ($row = mysqli_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	
	<p>Estado control: 
	<select name="Estado">
		<?php
		$queEmp = "SELECT * FROM `esm_estado_mascotas`";
		$resEmp = mysqli_query($db_link ,$queEmp) or die(mysqli_error());
		while ($row = mysqli_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p>
	<p>Estado clinico: 
	<select name="EstadoClinico">
		<?php
		$queEmp = "SELECT * FROM `tps_tipo_salida`";
		$resEmp = mysqli_query($db_link, $queEmp) or die(mysqli_error());
		while ($row = mysqli_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p>
	<p>Fecha de ingreso(Año-Mes-Dia): <input type="text" name="FechaIngeso"></p>
	
	<p><input type="submit" value="Ingresar"></p>
	</form>
				</p></center>
       
     <?php
		}
     ?>  
       
           
<?php
require("Pie.php");
?>


