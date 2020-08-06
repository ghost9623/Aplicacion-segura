<?php
$hostname='localhost';
$database='registro';
$username='Erick';
$password='root';

$conn1=mysqli_connect($hostname,$username,$password,$database);
if($conn1->connect_errno)
{
   echo "el sitio es experimentando problemas";
}
else
{
	echo "se conectado con exito";
}

?>