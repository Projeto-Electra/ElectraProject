
<link rel="stylesheet" href="PopUp.css">

<script langauge = "JavaScript">

function Voltar(){

    location.href="Login.html"
}

</script> 

<?php

include 'Conexao.php';



$nome = $_POST['Usuário'];
$senha = $_POST['Senha'];
$cpf = $_POST['CPF'];

$incluir=$comando->query("insert into  Cliente(Nome,Senha, CPF) 
                          values('$nome', '$senha','$cpf' )"); /*Query inserindo os dados no mySQL*/ 



if($incluir){ /* se a query teve sucesso*/ 



    echo"  <dialog show id='popupCadastro'>

    <div class='alerta'>

   <img src='https://www.iconpacks.net/icons/2/free-check-mark-icon-3279-thumb.png'>

   </div>

   <p class='titulopopUp'>DADOS CADASTRADOS COM SUCESSO!</p>
 
  
    <button id='fecharBtn' onclick='Voltar()'>Fechar</button>
    
    <script src='PopUp.js'></script>

    ";

}
else{ /* se não, mostra popup*/
    echo "<script language='JavaScript'>alert('Erro no cadastro!!');</script>";   
}


?>

