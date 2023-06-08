const modal = document.getElementById("popupCadastro");

const botao = document.getElementById("formLogin");

const botaoFechar = document.getElementById("fecharBtn");

window.addEventListener('load', function () /*a Função é ativida assim que a página carregar*/ 
{
modal.showModal(); /* Mostrar o modal(popup) */ 
});

botaoFechar.onclick = function ()
{

location.href="login.html"; /* redireciona */ 
modal.close(); /* fecha o modal(popup) */ 

}
