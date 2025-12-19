<?php
$con = mysqli_connect('localhost','root','','users');
if(isset($_POST['submit']))
{
    $name=$_POST['name'];
    $email=$_POST['email'];
    $city=$_POST['city'];
    $mobile=$_POST['mobile'];
    $aadhar=$_POST['aadhar'];
    $license=$_POST['license'];

    $query ="insert into users(name,email,city,mobile,aadhar,license)values ('$name','$email','$city','mobile','aadhar','license')";
}