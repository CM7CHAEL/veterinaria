<?php
require("Cabeza.php");
require("SQL.php");
?>
	
	<?php
	 if($_POST){
		 
		 if($_POST["pass1"] == $_POST["pass2"]){
						
			$queEmp = "INSERT INTO `veterinaria`.`emp_empleados` (`emp_id`, `emp_nombre1`, `emp_apellido1`,  `emp_direccion`, `emp_telcelular`, `emp_email`, `dep_emp_id`, `gen_genero_gen_id`, `esp_emp_id`, `car_emp_id`) 
			VALUES (NULL, '".$_POST["PrimerNombre"]."', '".$_POST["PrimerApellido"]."', '".$_POST["Direcion"]."', '".$_POST["TelefonoCel"]."', '".$_POST["E-mail"]."','".$_POST["Departamento"]."', '".$_POST["SEXO"]."', '".$_POST["Especializacion"]."', '".$_POST["Cargo"]."')";
			//echo $queEmp;
			$resEmp = mysqli_query($db_link, $queEmp) or die(mysqli_error()); 
			$queEmp = "SELECT `emp_id` FROM `veterinaria`.`emp_empleados` where `emp_nombre1`='".$_POST["PrimerNombre"]."'";
			//echo "<br>".$queEmp;
			$resEmp = mysqli_query($db_link,$queEmp) or die(mysqli_error()); 
			$ron = mysqli_fetch_row($resEmp);
			//echo $ron[0];
			$queEmp0 = "INSERT INTO `veterinaria`.`usr_usuarios` (`usr_username`, `usr_passwd`, `usr_accesibilidad`, `emp_usr_id`";
			$queEmp1 = ") VALUES ('".$_POST["user"]."', '".$_POST["pass1"]."', '".$_POST["Cargo"]."', '".$ron[0]."');";
			$queEmp = $queEmp0.$queEmp1;
			//echo "<br>".$queEmp;
			$resEmp = mysqli_query($db_link,$queEmp) or die(mysqli_error()); 
			echo "<p> Creacion de Usuario Satisfactoria </p>";
			 }
		 else
			echo "<p>Las contraseñas no coinciden intented de nuevo </p>";
		 
		 }
	 else{	 
	?>
				<center><p>
	<form name="formulario" method="POST" onSubmit='return Connprobacion()' action="AddUsuario.php">
	<div align="center">
	<center>
<table border="0" cellspacing="0">
    <tr>
       <td colspan="6"><center><h2>NUEVO USUARIO</h2></center></td>
    </tr>
    <tr>
       <td>Usuario:</td><td><input  class="iuser"  type="text" name="user"></td>
       <td>Contraseña:</td><td><input type="password" name="pass1"></td>
        <td>Confirmar-Contraseña:</td><td><input  class="iuser"  type="password" name="pass2"></td>
      <tr>
       <td>Primer nombre:</td><td><input class="iuser"  type="text" name="PrimerNombre"></td>
     	
       <td>Primer Apellido:</td><td><input class="iuser"   type="text" name="PrimerApellido"></td>
       
       <td>Sexo:</td><td><p class="user"> <input class="iuser"   type=radio name=SEXO value="1" >masculino <input type=radio name=SEXO value="2">femenino</p></td>
      </tr>
      <tr>
       <td colspan="2">Cargo:</td><td>	<p> 
	<select class="iuser"   name="Cargo">
		<?php
		$queEmp = "SELECT * FROM `car_cargos`";
		$resEmp = mysqli_query($db_link, $queEmp) or die(mysqli_error());
		while ($row = mysqli_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select>
	</p></td>
       <td colspan="2">Especializacion: </td><td><select class="iuser"   name="Especializacion">
		<?php
		$queEmp = "SELECT * FROM `esp_especializaciones` ";
		$resEmp = mysqli_query($db_link, $queEmp) or die(mysqli_error());
		while ($row = mysqli_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select></td>
      </tr>
      <tr>
      	 <td>Direcion:</td><td><input class="iuser"   type="text" name="Direcion"></td>

       	       <td>Municipio:</td><td>	<select  class="iuser"  name="Municipio">
		<?php
		$queEmp = "SELECT * FROM `mun_municipio` ";
		$resEmp = mysqli_query($db_link, $queEmp) or die(mysqli_error());
		while ($row = mysqli_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select></td>
       <td>Departamento: </td><td>	<select  class="iuser"  name="Departamento">
		<?php
		$queEmp = "SELECT * FROM `dep_departamento` ";
		$resEmp = mysqli_query($db_link, $queEmp) or die(mysqli_error());
		while ($row = mysqli_fetch_row($resEmp)){
			echo "<option value=".$row[0]." selected>".$row[1]."</option>";
			}
		?>
	</select></td>
      </tr>
       <tr>
       <td colspan="2">Celular:</td><td><input type="text" name="TelefonoCel"></td>
       <td colspan="2">E-mail:</td><td><input class="iuser"   type="text" name="E-mail"></td>
       </tr>
       <tr><td colspan="6"><input type="submit" value="Ingresar"></td></tr>
      

</table>

	</center>
	</div>
	</form>
	</p>
	
	</center>
     <?php
		}
     ?>  
       
           
<?php
require("Pie.php");
?>
