   <?php
require("Cabeza.php");
require("SQL.php");
?>
<?php
	 if($_POST){
		 
		$queEmp = "INSERT INTO `veterinaria`.`cit_cita` (`cit_id`, `cit_fecha`, `cit_hora`, `cit_programacion`, `estado`, `doc_cit_id`, `infm_cit_id`) 
		VALUES (NULL, '".$_POST["Fecha"]."', '".$_POST["Hora"].":00', '".$_POST["Programa"]."', 'Pendiente', '".$_POST["Doctor"]."', '".$_POST["Paciente"]."')";
		//echo $queEmp."<br>";
		$resEmp = mysqli_query($queEmp, $conexion) or die(mysqli_error()); 
		echo "<h1>Creacion de la cita</h1>";
		
	 }
	 else{
	 ?>
     <center><p>
	 <form name="formulario" method="POST" onSubmit='return Connprobacion()' action="AddCita.php"> 
	 <p> Añadir un nuevo usuario al sistema</p>
	 <p>Fecha (Año-Mes-Dia): <input type="text" name="Fecha"></p>
	 <p>Hora (Hora:Minuto): <input type="text" name="Hora"></p>
	 <p>Programa: <input type="text" name="Programa"></p>
	 <p>Doctor: 
		<select name="Doctor">
		<?php
		$queEmp = "SELECT * FROM emp_empleados where car_emp_id = '3'";
		//echo $queEmp;
		$resEmp = mysqli_query($queEmp, $conexion) or die(mysqli_error());
		while ($row = mysqli_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p>
	 <p>Paciente: 
		<select name="Paciente">
		<?php
		$queEmp = "SELECT * FROM infm_informacion_mascotas";
		//echo $queEmp;
		$resEmp = mysqli_query( $db_link , $queEmp) or die(mysqli_error());
		while ($row = mysqli_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p>
	 <p><input type="submit" value="Ingresar"></p>
	 </form>
	 <p></center>
<?php
	}
?>
           
<?php
require("Pie.php");
?>

