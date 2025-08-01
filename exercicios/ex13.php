<!-- 13. Listar múltiplos de 3 entre 1 e 100
Use um laço para imprimir todos os números entre 1 e 100 que são múltiplos de 3. -->

<?php
$resultado = "";

for($i=0; $i<=100; $i++){
    if($i%3==0){
        $resultado = $i;
        echo $resultado . "<br>";
    }
}
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Validação de Idade</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="d-flex justify-content-center align-items-center vh-100">
        <div class="card">
            <div class="card-body">
                     <!-- Exibe o resultado apenas se houver -->
                    <?php if ($resultado): ?>
                        <div class="alert alert-info mt-3 text-center">
                            <?php echo $resultado; ?>
                        </div>
                    <?php endif; ?>
                
            </div>
        </div>
    </div>
</body>

</html>
