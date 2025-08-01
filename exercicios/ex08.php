<?php
//8. Fatorial de um número
// Peça ao usuário um número inteiro e calcule o fatorial desse número usando um laço.

if ($_POST) {
    $numero = $_POST['numero'];

    if ($numero < 0) {
        echo "Não é possível calcular o fatorial de um número negativo.";
    } else {
        $fatorial = 1;
        for ($i = 1; $i <= $numero; $i++) {
            $fatorial *= $i;
        }
        echo "O fatorial de $numero é $fatorial.";
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
                            <input type="text" name="numero" placeholder="Digite um numero para a tabuada" class="form-control">
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