<?php
    $servidor="localhost";
    $port="3306";
    $user="root";
    $password="";
    $db="dietas";
    $conexion=new mysqli($servidor,$user,$password,$db);
    if($conexion->connect_error){
        die("no se puede conectar a mysql PRENDELO");
    }
?>