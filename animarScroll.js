
const animacao = document.querySelectorAll('[data-animacao]'); /*Selecionando todos os elementos com data-animação*/ 
const classeAnimacao = 'animate'; /* classe animate*/ 

function animacaoScroll() /*Função para a animação*/ 
{

    const topoSite = window.pageYOffset + (window.innerHeight * 0.75)  ; /* Variável que calcula a distância da barra de scroll
                                                                           para o topo + (tamanho da tela * 0.75) para que seja funcional
                                                                           em diferentes tamanhos de tela  */
  

    animacao.forEach(function(element) /* Para cada elemento que tiver na const animação  */
    {
      
       
        if((topoSite) > element.offsetTop) /*Se a distância pro topo do site for maior que a distância do topo do elemento */
        {

            element.classList.add("animate"); /*Adiciona a classe animate, que ativa a animação no CSS*/ 

        }
      
       
    });

}

window.addEventListener('scroll', function() /*Função para quando ocorrer o scroll*/ 
{

    animacaoScroll(); /*Chama a função quando ocorrer o scroll*/ 

});