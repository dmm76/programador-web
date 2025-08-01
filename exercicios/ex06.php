<?php
//6. Listar números de 1 a 30 e indicar se são pares ou ímpares
// Use um laço para listar os números de 1 a 30 e ao lado de cada número, indique se ele é par ou ímpar.
    for($i=1;$i<=30;$i++){
        if($i%2==0){
            echo "numero: " . $i . " é par<br>";
        }else{
             echo "numero: " . $i . " é impar<br>";
        }
    }
?>