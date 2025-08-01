<?php
    // 1. Imprimir números pares de 1 a 50
    // Crie um script que utilize um laço de repetição para imprimir todos os números pares de 1 a 50.
    "<h1>Imprimir os numeros pares entre 1 e 50</h1>";

    for($i=1; $i<=50; $i++){
        if($i%2==0){
            echo "Numero " . $i . " é par<br>";
        }
    }

?>