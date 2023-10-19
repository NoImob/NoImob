<?php
include_once "conexao.php";


$usuario = $_POST['usuario'];
$nome = $_POST['nome'];
$foto = $_FILES['foto'];
$sobrenome= $_POST['sobrenome'];
$email = $_POST['email'];
$senha = $_POST['senha'];
$confirmar = $_POST['confirmar'];
$dir = "../assets/foto-locador/";



if($confirmar === $senha){
$separa = explode(".", $foto['name']);
$separa = array_reverse($separa);
$tipoFoto = $separa[0];

$fileName = $usuario . "." . $tipoFoto;
if(move_uploaded_file($foto['tmp_name'], $dir . $fileName)){
    $uploadedFile = $dir . $fileName;
    }



$sql->query("INSERT INTO locador(locador_id, locador_nome_usuario, locador_nome, locador_sobrenome, locador_foto, locador_email, locador_tel, locador_senha, locador_confirmar_senha ) VALUES(NULL, '$usuario','$nome', '$sobrenome', '$uploadedFile' ,'$email', NULL, '$senha', '$confirmar')
");

header('Location: ../../Login/login.html');
 
}
else{
    header('Location: ../Cadastro_locador.html');
}

?>