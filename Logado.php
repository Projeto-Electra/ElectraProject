<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>

        body{
            background-color:rgb(253, 235, 235);
            background-size:cover;
            background-repeat: no-repeat;
        }

        .UserImg{
                border-radius:100%;
                background-color: rgb(190, 67, 67);
                width:22vw;
                height:22vw;
                margin-left:39vw;
        }

        .LoginBox{
        
                justify-content: center;
                margin-top:5vw;
        }
        .BemVindoTxt{
            font-size:4vw;
            margin-left:35vw;
            white-space:nowrap;
      border-right:3px solid rgb(255,255,255);
      overflow:hidden;
      animation: login 5s steps(110,end) alternate infinite;
        }
        .btn-login
    {
        width: 25%;
        padding: 16px 0px;
        margin-top:-1vw;
        
        border: none;
        border-radius: 7px;
        outline: none;
        text-transform:uppercase;
        font-weight: 700;
        letter-spacing: 3px;
        color: #000000;
        background:#991616;
        cursor: pointer;
        margin-left:38vw;
        box-shadow: 0px 10px 40px -12px #00000056;
    }
    .btn-login:hover{
        background: #831616;
    }
    
    @keyframes login{
      0%{
          width:0;   /*width 0 para que não seja possível visualizar o texto, enquanto a "barrinha" não passar pelo texto */
          border-color:transparent; /*color da "barrinha" transparent para dar o efeito de digitação*/
  
      }
      50%{
          border-color:rgb(255,255,255); /*color da "barrinha" branca para dar o efeito de digitação*/
   
      }
      100%{
          width:60%;  /*width 60% para que seja possível visualizar o texto, enquanto a "barrinha" passar pelo texto */
          border-color:transparent;
      }
  }
  @media only screen and (max-width:699px)
     {
        .UserImg{
                border-radius:100%;
                background-color: rgb(190, 67, 67);
                width:42vw;
                height:42vw;
                margin-left:28vw;
        }
        .BemVindoTxt{
            font-size:6vw;
            width:100%;
            margin-left:19vw;
            white-space:nowrap;
      border-right:3px solid rgb(255,255,255);
      overflow:hidden;
      animation: login 5s steps(110,end) alternate infinite;
        }
  .btn-login
    {
        width: 50%;
        padding: 16px 0px;
        margin-top:-1vw;
        
        border: none;
        border-radius: 7px;
        outline: none;
        text-transform:uppercase;
        font-weight: 700;
        letter-spacing: 3px;
        color: #000000;
        background:#991616;
        cursor: pointer;
        margin-left:25vw;
        box-shadow: 0px 10px 40px -12px #00000056;
    }
}
        </style>
</head>
<body>

<script langauge = "JavaScript">

function Voltar(){

    location.href="index.html"
}

</script>   

    <?php
     
    include 'Conexao.php';
    
     
    $usuário = isset($_GET['Usuário']) ? $_GET['Usuário'] : ""; /* Recebe o usuário que está sendo mandando atráves do Logar.php */ 
  

    echo "<div class='LoginBox'>";

    echo "<img class='UserImg' src='https://img.freepik.com/free-vector/flat-design-vintage-motorcycle-illustration_52683-86598.jpg?w=740&t=st=1685619520~exp=1685620120~hmac=9465ee2d03f47756a793a20a921355adf6e459d752e7ec430d116e3c5c5547fe'>";

    echo "<p class='BemVindoTxt'>Bem Vindo(a), $usuário </p>";

    echo "<input type='submit' onclick='Voltar()' class='btn-login' value='RETORNAR '></input>";

    echo"</div>";


    ?>

     

         
</body>
</html>