<?php
//7. Média de notas de alunos
// Crie um laço que peça a nota de 5 alunos e, ao final, exiba a média das notas digitadas.

$nota1 = 10;
$nota2 = 9;
$nota3 = 8;
$nota4 = 7;
$nota5 = 6;


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
                        <?php
                        for($i=1; $i<=5; $i++){
                            <div class="col-md-12">
                            <label for="">numero</label>
                            <input type="text" name="nota$i" placeholder="Digite a nota '$i'" class="form-control">
                    </div>                    
                    }                    
                    ?>
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