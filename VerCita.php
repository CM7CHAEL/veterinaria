<?php
require("Cabeza.php");
require("SQL.php");
?>
<?php

		if($_GET)
			{
			if($_GET["Estado"] == "AA"){
				
				$queEmp =  "UPDATE `veterinaria`.`cit_cita` 
				SET `cit_fecha` = '".$_GET["Fecha"]."',`cit_hora` = '".$_GET["Hora"].":00 ' 
				WHERE `cit_cita`.`cit_id` ='".$_GET["ID"]."'";
				echo $queEmp."<br>";
				$resEmp = mysqli_query($db_link ,$queEmp) or die(mysqli_error()); 
				}
			else if($_GET["Estado"] == "A"){
				?>
					<h1> Cambio de fecha y hora</h1>
					     <center><p>
						<form name="formulario" method="Get" onSubmit='return Connprobacion()' action="VerCita.php"> 
	 
					<p>Fecha (Año-Mes-Dia): <input type="text" name="Fecha"></p>
					<p>Hora (Hora:Minuto): <input type="text" name="Hora"></p>
					<input type="radio" name="ID" value=<?php echo $_GET["ID"] ?> checked="true">Cambiar<br>
					
					<input type="radio" name="Estado" value="AA" checked="true">Cambiar<br>
					
					<p><input type="submit" value="Ingresar"></p>
						</form>
					<p></center>
				<?php
				}
			else if($_GET["Estado"] == "C"){
				$queEmp =  "UPDATE `veterinaria`.`cit_cita` SET `estado` = 'Cancelado' WHERE `cit_cita`.`cit_id` ='".$_GET["ID"]."'";
				echo $queEmp;
				$resEmp = mysqli_query($db_link ,$queEmp) or die(mysqli_error()); 
				echo "S";
				}
			}
		else
			{
	 	  	$queEmp = "SELECT * FROM cit_cita where estado = 'Pendiente' ORDER BY cit_fecha, cit_hora;";
			//echo $queEmp;
			$resEmp = mysqli_query($db_link , $queEmp) or die(mysqli_error()); 
			echo "<p><h1>Lista de Citas pendientes</h1></p>";		 
	?>
				<center><p>
		<?php
		echo "<table>"; 
		echo "<tr><td>ID</td><td>Fecha</td><td>Hora</td><td>Programacion</td><td>Estado</td><td>Doctor</td><td>Mascota</td></tr> \n"; 
			while ($row = mysqli_fetch_row($resEmp)){ 
				echo "<tr>";
				echo "<td>$row[0]</td>";
				echo "<td>$row[1]</td>";
				echo "<td>$row[2]</td>";
				echo "<td>$row[3]</td>";
				echo "<td>$row[4]</td>";
					$queEmp2 = "SELECT * FROM emp_empleados where emp_id ='".$row[5]."'";
					$resEmp2 = mysqli_query($db_link ,$queEmp2) or die(mysqli_error());
					$row2 = mysqli_fetch_row($resEmp2);
				echo "<td>$row2[2] $row2[3]</td>";
				$queEmp2 = "SELECT * FROM infm_informacion_mascotas where infm_id ='".$row[6]."'";
					$resEmp2 = mysqli_query($db_link, $queEmp2) or die(mysqli_error());
					$row2 = mysqli_fetch_row($resEmp2);
				echo "<td>$row2[1]</td>";
				echo "<td><a href='?Estado=A&ID=$row[0]'>Actualizar</a></td>";
				echo "<td><a href='?Estado=C&ID=$row[0]'>Cancelar</a></td>";
				}				
			echo "</table>"; 
		}
	?> 			
		</p></center>
           
<?php
require("Pie.php");
?>

