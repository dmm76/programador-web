<?php
//3. Soma dos 100 primeiros números naturais
// Utilize um laço para calcular e exibir a soma de todos os números de 1 até 100.

 $cont = 0;
for($i=1; $i<=100; $i++){
   
    $cont = $cont + $i;
}

echo "A soma dos numeros entre 1 e 100 é: " . $cont;

?>