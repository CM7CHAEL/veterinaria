<!DOCTYPE >
<head>
<meta charset="utf-8">
<title>Editar Cliente</title>
</head>
<link rel="stylesheet" type="text/css" href="../Css/estilos.css">
<link rel="stylesheet" type="text/css" href="../Css/tablas.css">
<body>

<div id="popup-box2" class="popup-position1">
<div id="popup-wrapper1">
<div id="popup-container1">
    <div id="popup-head-color1">
      <?php
include 'SQL.php';
$id = $_GET['id'];
$view = "SELECT * from cliente where md5(cod_cli) = '$id'";
$result = $db_link->query($view);
$row = $result->fetch_assoc();

if(isset($_POST['update'])){
  $nombre = $_REQUEST['nom_cli'];
  $base = $_REQUEST['cod_base'];
  $insert = "UPDATE cliente set nom_cli = '$nombre' , cod_base = $base where md5(cod_cli) = '$id'" ;
 $res = mysqli_query($db_link , $insert);
  if($res){
      header('location:../index.php#popup2');      
  }else{
    header('location:../index.php#popup2');
  }
  $db_link->close();
}
?>
         <center><h2>Editar Cliente</h2></center>
         <a href="../index.php#popup2" style="float: right; margin-top: -25px; font-size: 22px">X</a>
    </div>

    <form action="" method="POST">
    <center>
    <table border="0" align="center" cellspacing="25">    
   
  <tr>
      <td><label>Codigo:</label></td>
      <td><input class="Bcf" type="text" id="txtbox" name="id"  value="<?php echo $row['cod_cli'];?>" ></td>
  </tr>
    <tr>
      <td><label>Nombre:</label></td>
      <td><input class="Bcf" type="text" id="txtbox" name="nom_cli" value="<?php echo $row['nom_cli'];?>" ></td>
  </tr>
    <tr>
      <td><label>Base:</label></td>
      <td> <select class="Bcf"  name="cod_base" id="txtbox">
           <?php
require('../config.php');
$query="SELECT cod_base , nom_base FROM bases";
$result1=mysqli_query($db_link, $query);
while ($row1=mysqli_fetch_array($result1)){?>
    <?php echo '<option value='. $row1["cod_base"].'>' . $row1["nom_base"].'</option>'; ?>
       <?php
}?>
    
    </select></td>
  </tr>

    <tr>
        <td><input class="BtnRf" type="SUBMIT" name="update" id="btnnav" value="Actualizar"></td>
        <td><a href='../index.php#popup2');.php"><input class="BtnRf" type="button"  value="Cancelar"></a></td>
    </tr>
   </form>
    </table>
</center>
</body>
</html>
