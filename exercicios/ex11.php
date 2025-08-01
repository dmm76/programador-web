<?php
// Inicializa
$soma = 0;
$numeros = [];

// Quando o formulário for enviado
if ($_POST) {
    $numero = $_POST['numero'];

    // Pega os números anteriores, se houver
    if (!empty($_POST['anteriores'])) {
        $numeros = explode(',', $_POST['anteriores']);
    }

    // Adiciona o novo número (como string)
    $numeros[] = $numero;

    // Soma todos os valores
    foreach ($numeros as $n) {
        $soma += $n;
    }

    // Mostra a soma, exceto se o número atual for 0
    if ($numero == 0) {
        echo "<h3>Total da soma: $soma</h3>";
        // Limpa os números
        $numeros = [];
    } else {
        echo "<h5>Soma parcial: $soma</h5>";
    }
}
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Somador</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="d-flex justify-content-center align-items-center vh-100">
        <div class="card p-4">
            <h4>Somar até digitar 0</h4>
            <form method="POST">
                <label for="numero" class="form-label">Número:</label>
                <input type="text" name="numero" class="form-control" placeholder="Digite número ou 0 para sair">

                <!-- Campo oculto com os números anteriores -->
                <input type="hidden" name="anteriores" value="<?php echo implode(',', $numeros); ?>">

                <button class="btn btn-primary mt-3 w-100">Enviar</button>
            </form>
        </div>
    </div>
</body>

</html>
