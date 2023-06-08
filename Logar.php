
<link rel="stylesheet" href="PopUp.css">
<?php

include 'Conexao.php';




$usuário=$_POST['Usuário'];

$senha = $_POST['Senha'];

$listar = $comando->query("select * from Cliente where Nome like '$usuário' and Senha like '$senha' "); /* query para selecionar aonde o nome e a senha forem iguais aos
                                                                                                        digitados na tela*/ 
$Total=$listar->rowCount();



if($Total > 0) /* se existir registro */ 
{

    header("Location:Logado.php?Usuário=$usuário"); /* redireciona para o Logado.php com o valor do usuário pego na consulta mysql*/ 




}



else
{
  echo"  <dialog show id='popupCadastro'>

    <div class='alerta'>

   <img src='https://pt.seaicons.com/wp-content/uploads/2015/11/alert-icon1.png'>

   </div>

   <p class='titulopopUp'>ERRO!</p>
 
    <p class='erroTexto'>Verifique seu usuário e sua senha</p>
    <button id='fecharBtn'>Fechar</button>
    
    <script src='PopUp.js'></script>

    ";
}    

?>