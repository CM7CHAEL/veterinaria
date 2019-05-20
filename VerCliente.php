  
<?php
require("Cabeza.php");
require("SQL.php");
?>
<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body>
        <table border="0" cellpadding="0" cellspacing="0" align="center" width="100%" style="border:1px solid #999; color:#033;">
     <tr>
    </tr>
      <tr height="30px">
        <th style="border-bottom:1px solid #333;"> Nombre </th>
        <th style="border-bottom:1px solid #333;"> Apellido </th>
        <th style="border-bottom:1px solid #333;"> Fecha Nac </th>
        <th style="border-bottom:1px solid #333;"> Direccions </th>
        <th style="border-bottom:1px solid #333;"> Direccions </th>
        <th style="border-bottom:1px solid #333;"> Direccions </th>
        <th style="border-bottom:1px solid #333;"> Direccions </th>
      </tr> 
       <?php
$query="SELECT * FROM prop_propietarios";
$result=mysqli_query($db_link, $query);
while ($row=mysqli_fetch_array($result)){?>
      <tr align="center" style="height:25px">
        <td style="border-bottom:1px solid #333;"> <?php echo $row['prop_id']; ?> </td>
        <td style="border-bottom:1px solid #333;"> <?php echo $row['prop_nombre1']; ?> </td>
        <td style="border-bottom:1px solid #333;"> <?php echo $row['prop_apellido1']; ?> </td>
         <td style="border-bottom:1px solid #333;"> <?php echo $row['prop_fnacimiento']; ?> </td>
        <td style="border-bottom:1px solid #333;"> <?php echo $row['prop_direccion']; ?> </td>
        <td style="border-bottom:1px solid #333;"> <?php echo $row['prop_telcasa']; ?> </td>                        
        <td style="border-bottom:1px solid #333;">    
        <a href="A-Cliente/eliminar_cliente.php?id=<?php echo md5($row['prop_id']);?>"><input type="button" value="Eliminar" style="width:85px; height:20; color:#FFF; background: #900; border:1px solid #900; border-radius:3px;"></a>
         <a href="A-Cliente/editar_cliente.php?id=<?php echo md5($row['prop_id']);?>">
        <input type="button" value="Editar" style="width:70px; height:20px; color:#FFF; background:#069; border:1px solid #069; border-radius:3px;"> 
        </td>
      </tr>

   <?php
}?>
    </table>  
  </td>
  </tr>
  </table>
</body>
</html>
       
<?php
require("Pie.php");
?>