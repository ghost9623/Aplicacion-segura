<?php
$hostname='localhost';
$database='registro';
$username='Erick';
$password='root';

$usu=$_POST['usu'];
$contra=$_POST['contra'];
$nom=$_POST['nom'];
$Pap=$_POST['Pap'];
$Aap=$_POST['Aap'];
$ciu =(int)$_POST['ciu'];

     $conn1=mysqli_connect($hostname,$username,$password,$database);
  
      $sql="INSERT INTO usuario(idusu,usu,contra,nombre,Papellido, Aapellido,ciudad) VALUES ('null','".$usu."',sha('".$contra."'),'".$nom."','".$Pap."','".$Aap."','".$ciu."')";

      
      
   

      
        if (mysqli_query($conn1,$sql)) 
            {
    	         echo "<br> Enhorabuena, se creo tu cuenta ";
                
                  
            }


?>