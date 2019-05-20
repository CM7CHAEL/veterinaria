     
<?php
require("Cabeza.php");
require("SQL.php");
?>
<?php
	 	  	$queEmp = "SELECT * FROM `infm_informacion_mascotas`";
			//echo $queEmp;
			$resEmp = mysqli_query($db_link ,  $queEmp) or die(mysqli_error()); 
			echo "<p><h1>Lista de Mascotaz</h1></p>";		 
	?>
				<center><p>
		<?php
		echo "<table>"; 
		echo "<tr><td>ID</td><td>Nombre</td><td>Apellido 1</td><td>Apellido 2</td><td>Fecha de nacimiento</td><td>Descripcion</td><td>ID Propietario</td><td>Especie</td><td>Genero</td><td>Estado</td><td>Estado Clinico</td><td>Fecha de ingreso</td><td>Fecha de alta</td><td>Famila</td></tr> \n"; 
			while ($row = mysqli_fetch_row($resEmp)){ 
				echo "<tr>";
				echo "<td>$row[0]</td>";
				echo "<td>$row[1]</td>";
				echo "<td>$row[2]</td>";
				echo "<td>$row[3]</td>";
				echo "<td>$row[5]</td>";
				echo "<td>$row[6]</td>";
				
					$queEmp2 = "SELECT * FROM prop_propietarios where prop_id ='".$row[7]."'";
					$resEmp2 = mysqli_query($db_link ,$queEmp2) or die(mysqli_error());
					$row2 = mysqli_fetch_row($resEmp2);
				echo "<td>$row2[2] $row2[3]</td>";
				
					$queEmp2 = "SELECT * FROM mas_mascotas where  mas_id='".$row[8]."'";
					$resEmp2 = mysqli_query( $db_link ,$queEmp2) or die(mysqli_error());
					$row2 = mysqli_fetch_row($resEmp2);
				echo "<td>$row2[1]</td>";
					$queEmp2 = "SELECT * FROM gen_genero where  gen_id='".$row[9]."'";
					$resEmp2 = mysqli_query($db_link ,$queEmp2) or die(mysqli_error());
					$row2 = mysqli_fetch_row($resEmp2);
				echo "<td>$row2[1]</td>";
					$queEmp2 = "SELECT * FROM esm_estado_mascotas where  esm_id='".$row[10]."'";
					$resEmp2 = mysqli_query($db_link ,$queEmp2) or die(mysqli_error());
					$row2 = mysqli_fetch_row($resEmp2);
				echo "<td>$row2[1]</td>";
					$queEmp2 = "SELECT * FROM tps_tipo_salida where  tps_id='".$row[11]."'";
					$resEmp2 = mysqli_query($db_link ,$queEmp2) or die(mysqli_error());
					$row2 = mysqli_fetch_row($resEmp2);
				echo "<td>$row2[1]</td>";
				echo "<td>$row[12]</td>";
				echo "<td>$row[13]</td>";
					$queEmp2 = "SELECT * FROM fam_familia where  fam_id='".$row[14]."'";
					$resEmp2 = mysqli_query($db_link ,$queEmp2) or die(mysqli_error());
					$row2 = mysqli_fetch_row($resEmp2);
				echo "<td>$row2[1]</td>";
				echo "</tr>"; 
				} 
			echo "</table>"; 
	?> 			
		</p></center>
           
<?php
require("Pie.php");
?>

