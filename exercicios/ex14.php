<?php
$a = $e = $i = $o = $u = 0;
$resultado = "";

if ($_POST) {
    $frase = strtolower($_POST['frase']); // transforma em minúsculo
    $letras = str_split($frase);

    foreach ($letras as $letra) {
        if ($letra == "a") {
            $a++;
        } elseif ($letra == "e") {
            $e++;
        } elseif ($letra == "i") {
            $i++;
        } elseif ($letra == "o") {
            $o++;
        } elseif ($letra == "u") {
            $u++;
        }
    }

    $resultado = "Quantidade de vogais:<br>
                  A = $a<br>
                  E = $e<br>
                  I = $i<br>
                  O = $o<br>
                  U = $u";
}
?>


<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <title>Contar Vogais</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <div class="d-flex justify-content-center align-items-center vh-100">
        <div class="card p-4">
            <h4 class="text-center">Contar Vogais na Frase</h4>
            <form action="" method="POST">
                <div class="mb-3">
                    <label class="form-label">Frase:</label>
                    <input type="text" name="frase" class="form-control" placeholder="Digite uma frase">
                </div>
                <button class="btn btn-primary w-100">Enviar</button>

                <?php if (!empty($resultado)): ?>
                    <div class="alert alert-info mt-3">
                        <?php echo $resultado; ?>
                    </div>
                <?php endif; ?>
            </form>
        </div>
    </div>
</body>

</html>