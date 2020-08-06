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
  
      

      
      $sql1="SELECT idusu FROM usuario WHERE nombre='$nom'";
            $result=mysqli_query($conn1,$sql1);

            if($result->num_rows>0){}

            	$row=$result->fetch_array(MYSQLI_ASSOC);
                
                $id=$row['idusu'];

       $update = "UPDATE usuario
		set usu = '$usu', 
			contra = '$contra' 
		where idusu = $id";



      
        if (mysqli_query($conn1,$update)) 
            {
    	         echo "<br> Enhorabuena, se creo tu cuenta ";
                
                  
            }


?>
