<?php
$resultado = "";

if ($_POST) {
    $idade = $_POST['numero'];

    if ($idade >= 70) {
        $resultado = "Sua idade é $idade, seu voto é facultativo";
    } else if ($idade >= 18) {
        $resultado = "Sua idade é $idade, seu voto é obrigatório";
    } else if ($idade >= 16) {
        $resultado =  "Sua idade é $idade, se tiver título, já pode votar";
    } else {
        $resultado =  "Sua idade é $idade, você não pode votar";
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
                <form action="" method="POST">
                    <div class="mb-3">
                        <label for="numero" class="form-label">Idade</label>
                        <input type="text" name="numero" placeholder="Digite sua idade" class="form-control">
                    </div>
                    <button class="btn btn-primary w-100">Enviar</button>

                    <!-- Exibe o resultado apenas se houver -->
                    <?php if ($resultado): ?>
                        <div class="alert alert-info mt-3 text-center">
                            <?php echo $resultado; ?>
                        </div>
                    <?php endif; ?>
                </form>
            </div>
        </div>
    </div>
</body>

</html>
