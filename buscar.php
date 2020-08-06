<?php
$hostname='localhost';
$database='registro';
$username='Erick';
$password='root';

$usu=$_GET['usu'];


     $conn1=mysqli_connect($hostname,$username,$password,$database);
  
      

      
      $sql1="SELECT usu,nombre,Papellido,Aapellido FROM usuario WHERE usu='$usu'";
      $res=$conn1 -> query($sql1);

      while ($filas=$res -> fetch_array()) {
        $usuario[]=array_map('utf8_encode',$filas);
      }

     echo json_encode($usuario);

     $res -> close();
       

?>