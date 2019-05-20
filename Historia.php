<?php
require("Cabeza.php");
require("SQL.php");
?>
<?php
	 	  	$queEmp = "SELECT * FROM cit_cita where estado != 'Pendiente' ORDER BY cit_fecha, cit_hora;";
			//echo $queEmp;
			$resEmp = mysqli_query($db_link ,$queEmp) or die(mysqli_error()); 
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
					$resEmp2 = mysqli_query($db_link, $queEmp2) or die(mysqli_error());
					$row2 = mysqli_fetch_row($resEmp2);
				echo "<td>$row2[2] $row2[3]</td>";
				$queEmp2 = "SELECT * FROM infm_informacion_mascotas where infm_id ='".$row[6]."'";
					$resEmp2 = mysqli_query($db_link, $queEmp2) or die(mysqli_error());
					$row2 = mysqli_fetch_row($resEmp2);
				echo "<td>$row2[1]</td>";
				}				
			echo "</table>"; 
	?> 			
		</p></center>
           
<?php
require("Pie.php");
?>

