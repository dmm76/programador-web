<?php
//4. Verificar se número é primo
// Solicite um número ao usuário e utilize um laço e estrutura condicional para verificar se ele é primo.

if ($_POST) {
    $numero = $_POST['numero'];

    if ($numero <= 1) {
        echo "O número $numero não é primo.";
    } else {
        $ehPrimo = true;
        for ($i = 2; $i <= sqrt($numero); $i++) {
            if ($numero % $i == 0) {
                $ehPrimo = false;
                break;
            }
        }

        if ($ehPrimo) {
            echo "O número $numero é primo.";
        } else {
            echo "O número $numero não é primo.";
        }
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
                            <input type="text" name="numero" placeholder="Digite um numero para verificação" class="form-control">
                        </div>                        
                        <div class="col-md-12">
                            <button class="btn btn-primary w-100 mt-3">Enviar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>

</html>