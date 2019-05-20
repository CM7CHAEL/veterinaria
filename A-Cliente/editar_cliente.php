<!DOCTYPE >
<head>
<meta charset="utf-8">
<title>Editar Cliente</title>
</head>
<link rel="stylesheet" type="text/css" href="../css/Css/estilos.css">
<link rel="stylesheet" type="text/css" href="../Css/tablas.css">
<body>
<?php
session_start();
if(!isset($_SESSION['username'])){
	header('location:../index.php');
	}
?>
<div id="popup-box2" class="popup-position1">
<div id="popup-wrapper1">
<div id="popup-container1">
    <div id="popup-head-color1">
      <?php
include '../SQL.php';
$id = $_GET['id'];
$view = "SELECT * from prop_propietarios where md5(prop_id) = '$id'";
$result = $db_link->query($view);
$row = $result->fetch_assoc();

if(isset($_POST['update'])){
  $nombre = $_REQUEST['prop_nombre1'];
  $apellido = $_REQUEST['prop_apellido1'];
  $fnac = $_REQUEST['prop_fnacimiento'];
  $tlf = $_REQUEST['prop_telcasa'];
  $insert = "UPDATE cliente set prop_nombre1 = '$nombre' , prop_apellido1 = $apellido , prop_fnacimiento = '$fnac' , prop_telcasa = '$tlf' ,  where md5(prop_id) = '$id'" ;
 $res = mysqli_query($db_link , $insert);
  if($res){
      header('location:../VerCliente.php');      
  }else{
    header('location:../VerCliente.php');
  }
  $db_link->close();
}
?>
         <center><h2>Editar Cliente</h2></center>
         <a href="../VerCliente.php" style="float: right; margin-top: -25px; font-size: 22px">X</a>
    </div>

    <form action="" method="POST">
    <center>
    <table border="0" align="center" cellspacing="25">    
   
  <tr>
      <td><label>Codigo:</label></td>
      <td><input class="Bcf" type="text" id="txtbox" name="id"  value="<?php echo $row['prop_id'];?>" ></td>
  </tr>
    <tr>
      <td><label>Nombre:</label></td>
      <td><input class="Bcf" type="text" id="txtbox" name="nom_cli" value="<?php echo $row['prop_nombre1'];?>" ></td>
  </tr>
  <tr>
      <td><label>Apellido:</label></td>
      <td><input class="Bcf" type="text" id="txtbox" name="nom_cli" value="<?php echo $row['prop_apellido1'];?>" ></td>
  </tr>
  <tr>
      <td><label>Nombre:</label></td>
      <td><input class="Bcf" type="text" id="txtbox" name="nom_cli" value="<?php echo $row['prop_fnacimiento'];?>" ></td>
  </tr>
  <tr>
      <td><label>Nombre:</label></td>
      <td><input class="Bcf" type="text" id="txtbox" name="nom_cli" value="<?php echo $row['prop_direccion'];?>" ></td>
  </tr>
  <tr>
      <td><label>Nombre:</label></td>
      <td><input class="Bcf" type="text" id="txtbox" name="nom_cli" value="<?php echo $row['prop_telcasa'];?>" ></td>
  </tr>
    <tr>
        <td><input class="BtnRf" type="SUBMIT" name="update" id="btnnav" value="Actualizar"></td>
        <td><a href='../VerCliente.php');.php"><input class="BtnRf" type="button"  value="Cancelar"></a></td>
    </tr>
   </form>
    </table>
</center>
</body>
</html>
