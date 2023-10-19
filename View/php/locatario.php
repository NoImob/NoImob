<?php
include_once "conexao.php";


$usuario = $_POST['usuario'];
$nome = $_POST['nome'];
$sobrenome= $_POST['sobrenome'];
$CPF = $_POST['CPF'];
$foto = $_FILES['foto'];
$email = $_POST['email'];
$senha = $_POST['senha'];
$confirmar = $_POST['confirmar'];
$dir = "../assets/foto-locatario/";



if($confirmar === $senha){
$separa = explode(".", $foto['name']);
$separa = array_reverse($separa);
$tipoFoto = $separa[0];

$fileName = $usuario . "." . $tipoFoto;
if(move_uploaded_file($foto['tmp_name'], $dir . $fileName)){
    $uploadedFile = $dir . $fileName;
    }

$sql->query("INSERT INTO locatario(locatario_id, locatario_nome_usuario, locatario_nome, locatario_cpf,  locatario_sobrenome, locatario_foto, locatario_email, locatario_senha, locatario_confirmar_senha ) VALUES(NULL, '$usuario','$nome', '$CPF', '$sobrenome', '$uploadedFile' ,'$email', '$senha', '$confirmar')
");

header('Location: ../../Login/login.html');

}
else{
    header("Location: ../Cadastro_locatario.php");
}

?>