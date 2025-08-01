<!-- 18. Mostrar a tabuada completa de 1 a 10
Utilize dois laços aninhados para mostrar todas as tabuadas de 1 a 10 organizadas no formato: -->

<?php

    $resultado = "";
    for($i=1; $i<=10; $i++){
        for($j=1; $j<=10; $j++){
            $resultado = $i * $j;
            echo "$i x $j = $resultado<br>";
        }
        echo "========<br>";
    }

?>