<!-- 17. Simulador de senha com tentativa limitada
Peça ao usuário uma senha e permita no máximo 3 tentativas. Se acertar, mostre "Acesso permitido". Se errar 3 vezes, mostre "Acesso bloqueado". -->

<?php
$resultado = "";
$senha = 123456;
if ($_POST) {
    $numero = $_POST['numero'];

    if($numero == $senha){
        $resultado = "Senha correta, permitida a entrada";
    }else{
        $resultado =  "Senha incorreta, tente novamente";
    }
    
}
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Document</title>
</head>

<body>
    <div class="d-flex justify-content-center align-items-center vh-100">
        <div class="card">
            <div class="card-body">
                <form action="" method="POST">
                    <div class="row">
                        <div class="col-md-12">
                            <label for="">numero</label>
                            <input type="text" name="numero" placeholder="Digite um numero para verificar sua senha" class="form-control">
                        </div>                        
                        <div class="col-md-12">
                            <button class="btn btn-primary w-100 mt-3">Enviar</button>
                        </div>
                        <?php if ($resultado): ?>
                        <div class="alert alert-info mt-3 text-center">
                            <?php echo $resultado; ?>
                        </div>
                    <?php endif; ?>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>