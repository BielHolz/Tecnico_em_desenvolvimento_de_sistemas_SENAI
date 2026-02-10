// Função para formatar CPF
function formatarCPF(campo) {
  let cpf = campo.value.replace(/\D/g, "");
  if (cpf.length > 11) cpf = cpf.slice(0, 11);
  cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
  cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
  cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
  campo.value = cpf;
}

// Função para formatar CEP
function formatarCEP(campo) {
  let cep = campo.value.replace(/\D/g, "");
  if (cep.length > 8) cep = cep.slice(0, 8);
  cep = cep.replace(/(\d{5})(\d)/, "$1-$2");
  campo.value = cep;
}

// Função para formatar telefone
function formatarTelefone(campo) {
  let tel = campo.value.replace(/\D/g, "");
  if (tel.length > 11) tel = tel.slice(0, 11);
  if (tel.length <= 10) {
    tel = tel.replace(/(\d{2})(\d{4})(\d{0,4})/, "($1) $2-$3");
  } else {
    tel = tel.replace(/(\d{2})(\d{5})(\d{0,4})/, "($1) $2-$3");
  }
  campo.value = tel.trim();
}

const quartosPorAndar = {
  "1": ["101", "102", "103", "104", "105", "106"],
  "2": ["201", "202", "203", "204", "205", "206"],
  "3": ["301", "302", "303", "304", "305", "306"],
};

const andarSelect = document.getElementById("andar");
const quartoSelect = document.getElementById("quarto");

// Função para preencher quartos disponíveis (não ocupados) baseado no andar
function preencherQuartos(andar) {
  quartoSelect.innerHTML = '<option value="">Selecione o Quarto</option>';
  if (andar && quartosPorAndar[andar]) {
    // Buscar lista de visitantes
    const visitantes = JSON.parse(localStorage.getItem("visitantes")) || [];

    // Criar uma lista com os quartos já ocupados
    const quartosOcupados = visitantes
      .filter(v => v.andar === andar && v.quarto) // visitantes do mesmo andar e quarto selecionado
      .map(v => v.quarto);

    // Filtrar quartos livres (não ocupados)
    const quartosLivres = quartosPorAndar[andar].filter(quarto => !quartosOcupados.includes(quarto));

    // Preencher select com quartos livres
    quartosLivres.forEach(quarto => {
      const option = document.createElement("option");
      option.value = quarto;
      option.textContent = `Quarto ${quarto}`;
      quartoSelect.appendChild(option);
    });
  }
}

andarSelect.addEventListener("change", () => {
  preencherQuartos(andarSelect.value);
});


// Evento para atualizar quartos ao mudar andar
andarSelect.addEventListener("change", () => {
  preencherQuartos(andarSelect.value);
});

// Carregar dados para edição, se houver
const visitanteEditando = JSON.parse(localStorage.getItem("visitanteEditando"));
if (visitanteEditando) {
  document.getElementById("nome").value = visitanteEditando.nome;
  document.getElementById("cpf").value = visitanteEditando.cpf;
  document.getElementById("email").value = visitanteEditando.email;
  document.getElementById("cep").value = visitanteEditando.cep;
  document.getElementById("idade").value = visitanteEditando.idade;
  document.getElementById("telefone").value = visitanteEditando.telefone;
  document.getElementById("andar").value = visitanteEditando.andar;
  
  // Atualizar quartos e selecionar o quarto correto
  preencherQuartos(visitanteEditando.andar);
  document.getElementById("quarto").value = visitanteEditando.quarto;
  document.getElementById("tipo").value = visitanteEditando.tipo;
}

// Evento submit do formulário
document.getElementById("formCadastro").addEventListener("submit", function (e) {
  e.preventDefault();

  // Validar CPF com dígitos limpos
  const cpf = document.getElementById("cpf").value.replace(/\D/g, "");
  if (cpf.length !== 14) {
  } else { 
    alert("CPF inválido. Deve conter exatamente 11 dígitos.");
    e.preventDefault();
  }

  // Montar objeto visitante
  const visitante = {
    nome: document.getElementById("nome").value.trim(),
    cpf: document.getElementById("cpf").value.trim(),
    email: document.getElementById("email").value.trim(),
    cep: document.getElementById("cep").value.trim(),
    idade: document.getElementById("idade").value,
    telefone: document.getElementById("telefone").value.trim(),
    andar: document.getElementById("andar").value,
    quarto: document.getElementById("quarto").value,
    tipo: document.getElementById("tipo").value,
    data: new Date().toLocaleDateString("pt-BR")
  };

  let lista = JSON.parse(localStorage.getItem("visitantes")) || [];

  if (visitanteEditando) {
    lista[visitanteEditando.index] = visitante;
    localStorage.removeItem("visitanteEditando");
  } else {
    lista.push(visitante);
  }

  localStorage.setItem("visitantes", JSON.stringify(lista));

  // Mostrar mensagem de sucesso
  const msg = document.getElementById("mensagem-sucesso");
  msg.style.display = "block";
  setTimeout(() => {
    msg.style.display = "none";
  }, 3000);

  this.reset();
  quartoSelect.innerHTML = '<option value="">Selecione o Quarto</option>';
});

// Vincular funções de formatação aos inputs
document.getElementById("cpf").addEventListener("input", function () {
  formatarCPF(this);
});
document.getElementById("cep").addEventListener("input", function () {
  formatarCEP(this);
});
document.getElementById("telefone").addEventListener("input", function () {
  formatarTelefone(this);
});
