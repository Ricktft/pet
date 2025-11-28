<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="modelo.DAO.AnimalDAO"%>
<%@page import="modelo.Animal"%>
<%@page import="modelo.DAO.DonoDAO"%>
<%@page import="modelo.Dono"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Animais</title>
    <style>

body {
    background-color: #F7F2EB;
    margin: 0;
    padding: 20px;
    font-family: Arial, sans-serif;
    color: #4A4A4A;
}

.lista-container {
    background: #F5E6D3;
    padding: 30px;
    border-radius: 14px;
    max-width: 1200px;
    margin: auto;
    box-shadow: 0 4px 10px rgba(0,0,0,0.15);
}

.titulo-lista {
    text-align: center;
    color: #6B4F4F;
    margin-bottom: 25px;
}

.links-topo {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

.btn-acao, .btn-voltar {
    padding: 10px 16px;
    background-color: #C9A66B;
    color: white;
    text-decoration: none;
    border-radius: 6px;
    font-weight: bold;
}

.btn-voltar {
    background-color: #A37E4B;
}

.btn-acao:hover {
    background-color: #A37E4B;
}

.btn-voltar:hover {
    background-color: #855E34;
}

.tabela-lista {
    width: 100%;
    border-collapse: collapse;
    background: #fff;
    border-radius: 8px;
    overflow: hidden;
}

.tabela-lista th {
    background: #C9A66B;
    color: white;
    padding: 10px;
    text-align: left;
}

.tabela-lista td {
    padding: 10px;
    border-bottom: 1px solid #E0D4C1;
    vertical-align: top;
}

.tabela-lista tr:nth-child(even) {
    background: #F9F3EA;
}

.link-editar {
    color: #4A7BA7;
    font-weight: bold;
    text-decoration: none;
}

.link-editar:hover {
    text-decoration: underline;
}

.link-excluir {
    color: #B33A3A;
    font-weight: bold;
    text-decoration: none;
}

.link-excluir:hover {
    text-decoration: underline;
}

</style>
</head>
<body>
    <div class="lista-container">

    <h2 class="titulo-lista">Lista de Animais</h2>

    <div class="links-topo">
        <a class="btn-acao" href="../Cadastra/animal_cadastra.jsp">+ Cadastrar Novo Animal</a>
        <a class="btn-voltar" href="../index.html">Voltar</a>
    </div>

    <table class="tabela-lista">
        <tr>
            <th>Ícone</th>
            <th>ID</th>
            <th>Nome</th>
            <th>Espécie</th>
            <th>Raça</th>
            <th>Idade</th>
            <th>Peso (kg)</th>
            <th>Data Chegada</th>
            <th>Data Saída</th>
            <th>Observações</th>
            <th>Dono</th>
            <th>Ações</th>
        </tr>

        <%
            AnimalDAO dao = new AnimalDAO();
            DonoDAO donoDAO = new DonoDAO();
            List<Animal> lista = dao.listar();

            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

            for (Animal a : lista) {
                Dono dono = donoDAO.buscarPorId(a.getIdDono());

                String chegada = (a.getData_chegada() != null)
                        ? sdf.format(a.getData_chegada())
                        : "—";

                String saida = (a.getData_saida() != null)
                        ? sdf.format(a.getData_saida())
                        : "—";
        %>

        <tr>
            <td><img src="${pageContext.request.contextPath}/SalvarImagemPet?idAnimal=<%= a.getIdAnimal() %>" width="60"></td>

            <td><%= a.getIdAnimal() %></td>
            <td><%= a.getNome() %></td>
            <td><%= a.getEspecie() %></td>
            <td><%= a.getRaca() %></td>
            <td><%= a.getIdade() %></td>
            <td><%= a.getPeso() %></td>

            <td><%= chegada %></td>
            <td><%= saida %></td>

            <td><%= a.getObservacoes() %></td>
            <td><%= (dono != null ? dono.getNome() : "Sem dono") %></td>

            <td>
                <a class="link-editar" href="../Altera/animal_altera.jsp?id=<%= a.getIdAnimal() %>">✏️ Alterar</a> |
                <a class="link-excluir" href="../Deleta/animal_excluir.jsp?id=<%= a.getIdAnimal() %>"
                   onclick="return confirm('Excluir este animal e todos os medicamentos vinculados?');">🗑️ Excluir</a>
            </td>
        </tr>

        <% } %>

    </table>

</div>
</body>
</html>
