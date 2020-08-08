 <?php
$hostname='localhost';
$database='registro';
$username='Erick';
$password='root';


$nom=$_POST['nom'];

     $conn1=mysqli_connect($hostname,$username,$password,$database);
  
      $sql="call sp_eliminar('$nom')";

      
      
   

      
        if (mysqli_query($conn1,$sql)) 
            {
    	         echo "<br> Enhorabuena,se ha eliminado ";
                
                  
            }


?>