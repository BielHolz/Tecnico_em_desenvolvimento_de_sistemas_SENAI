const container = document.getElementById("listaVisitantes");
let visitantes = JSON.parse(localStorage.getItem("visitantes")) || [];

function renderizarLista() {
  container.innerHTML = "";

  if (visitantes.length === 0) {
    container.innerHTML = "<p>Nenhum visitante cadastrado.</p>";
    return;
  }

  visitantes.forEach((v, index) => {
    const card = document.createElement("div");
    card.className = "visitante-card";
    card.innerHTML = `
      <p><strong>Nome:</strong> ${v.nome}</p>
      <p><strong>CPF:</strong> ${v.cpf}</p>
      <p><strong>Email:</strong> ${v.email}</p>
      <p><strong>CEP:</strong> ${v.cep}</p>
      <p><strong>Idade:</strong> ${v.idade}</p>
      <p><strong>Telefone:</strong> ${v.telefone || "N/A"}</p>
      <p><strong>Andar do Quarto:</strong> ${v.andar}</p>
      <p><strong>Tipo do Quarto:</strong> ${v.tipo}</p>
      <p><strong>Número do Quarto:</strong> ${v.quarto}</p>
      <p><strong>Data:</strong> ${v.data || "Não informado"}</p>
      <div class="btns">
        <button class="btn-editar" onclick="editarVisitante(${index})">Editar</button>
        <button class="btn-excluir" onclick="excluirVisitante(${index})">Excluir</button>
      </div>
    `;
    container.appendChild(card);
  });
}

function excluirVisitante(index) {
  visitantes.splice(index, 1);
  localStorage.setItem("visitantes", JSON.stringify(visitantes));
  renderizarLista();
  mostrarMensagem("Visitante excluído com sucesso!");
}


function mostrarMensagem(texto) {
  const mensagem = document.getElementById("mensagem");
  mensagem.textContent = texto;
  mensagem.style.display = "block";
  setTimeout(() => {
    mensagem.style.display = "none";
  }, 3000);
}

function editarVisitante(index) {
  const visitante = visitantes[index];
  localStorage.setItem("visitanteEditando", JSON.stringify({ ...visitante, index }));
  window.location.href = "index.html";
}


// Inicializa a lista na tela
renderizarLista();
