 // Seleciona todos os ícones de favorito
  document.querySelectorAll('.favorito-icon').forEach(icon => {
    icon.addEventListener('click', () => {
       icon.classList.toggle('bi-heart');
       icon.classList.toggle('bi-heart-fill');
    });
  });

  //Cadastro de Clientes
  document.querySelector("form").addEventListener("submit", function (e) {
  e.preventDefault();

  const cliente = {
    nome: document.getElementById("inputNome").value,
    sobrenome: document.getElementById("inputSobrenome").value,
    email: document.getElementById("inputEmail").value,
    telefone: document.getElementById("inputTelefone").value,
    cidade: document.getElementById("inputCidade").value,
    estado: document.getElementById("inputEstado").value
  };

  let clientes = JSON.parse(localStorage.getItem("clientes")) || [];
  clientes.push(cliente);
  localStorage.setItem("clientes", JSON.stringify(clientes));

  alert("Cliente cadastrado com sucesso!");
  e.target.reset();

  window.location.href = "tbclientes.html";
});
