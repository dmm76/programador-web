let carro = {
    marca: "VW",
    ano: 2020,
    andar: ()=> ("Carro andando")
}

const evento = ()=>{

    const andar = carro.andar();

    document.getElementById("texto").innerHTML = andar;
    
}
