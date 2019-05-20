<?php
	include '../SQL.php';
	$id = $_GET['id'];
	$sql = "Delete from prop_propietarios where md5(prop_id) = '$id'";
	if($db_link->query($sql) === true){
		echo "Sucessfully deleted data";
		 header('Location:../VerCliente.php');
	}else{
		echo "No se puede eliminar, por favor vuelva a intentar ";
	}
	$db_link->close();
?>