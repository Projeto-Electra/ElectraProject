<link rel="stylesheet" href="PopUp.css">

<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@600&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@500;900&display=swap');

    * 
    {
       
        margin: 0;
       
        font-family:'Montserrat', sans-serif;
    }
body,html
    {
      overflow-x: hidden;
        background-color: white;
        color:BLACK;    
 
        justify-content: center;
    }   
    .container-cards
      {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-wrap: wrap;
        width: 100%;
        min-height: 60vh;
        gap: 2px;
      } 
      
      .card
      {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        position: relative;
        width: 350px;
        height: 450px;
        
      }
      
      .img_moto
      {
        width: 200px;
      }
      
      .button_comprar
      {
        width: 180px;
        height: 35px;
        background-color: red;
        border: none;
        color: #f2f2f2;
        cursor: pointer;
        font-size: 25px;
        font-weight: bold;
        position: absolute;
        bottom: 0;
        margin-bottom: 20px;
        transition: all 0.6s;
      }
      
      .button_comprar :hover
      {
        background-color: rgba(51, 19, 19, 0.804);
        color: #625555;
      }

      .card  h2
      {
        margin-top: 20px;
      }
      
 
      .btnVoltar {
margin-top:1vw;
  width: 180px;
  height: 35px;
  background-color: red;
  border:none;
  color: #f2f2f2;
  cursor: pointer;
  font-size: 2vw;
  font-weight: bold;
  position: absolute;
  

  left: 50%;
  transform: translateX(-50%);

  transition: all 0.6s;
}

.btnVoltar:hover {
  background-color: rgba(200, 19, 19);
  color: #f2f2f2;
}
   
#popupCadastro{

  margin-top:10vw;
  margin-left:35vw;
}
#Alinhar{
  display:flex;
  justify-content: center;
  flex-wrap: wrap;
}
@media only screen and (max-width:699px)
     {

    .btnVoltar{
      font-size:4vw;
  margin-bottom: -160vw;

}

     }

</style>

<script language = "JavaScript">

function Voltar(){

    location.href="Pesquisa.html"
}

</script>   

<div id="Alinhar">
<?php

include 'Conexao.php';

$criterio = $_POST['criterio'];
$listar = $comando->query("select * from Produto where NomeProduto like '$criterio%'"); /* executa a query do mySQL para pesquisa aonde o nome do produto for igual ao criterio*/ 
$Total = $listar->rowCount();


if ($Total > 0) /*Verifica se existe algum registro segundo o criterio*/ 
{


   
    while ($linha = $listar->fetch(PDO::FETCH_ASSOC))   /*Enquanto ele lê o registro, ele imprime a div*/ 
    {
        $vcodi = $linha['CódigoProduto'];
        $vnom = $linha['NomeProduto'];
        $vpreço = $linha['Preço'];
      
        echo "
        <section id = 'Produto'>
        <div class='container-cards'>
        <div class='card'>";
        
        echo"<img src='Imagens/$vnom.png' alt='' class='img_moto'>
     
        <h2>$vnom</h2>

        
        <h2>R$$vpreço</h2>
      
        <button class='button_comprar'>COMPRAR</button>";

        echo "</div> 
              </div>
          
              </section>";
    }
   echo" <button class='btnVoltar'  onclick='Voltar()' >RETORNAR</button>";


}

else /*se não, nenhum registro foi encontrado e mostra o popup*/ 
{
  echo"  <dialog show id='popupCadastro'>

  <div class='alerta'>

 <img src='https://pt.seaicons.com/wp-content/uploads/2015/11/alert-icon1.png'>

 </div>

 <p class='titulopopUp'>ERRO!</p>

  <p class='erroTexto'>Não existem produtos com esse nome</p>
  <button id='fecharBtn1' onclick='Voltar()'>Fechar</button>
  
  <script src='PopUp.js'></script>

  ";

}

?>
</div>