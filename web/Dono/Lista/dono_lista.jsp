<%-- 
    Document   : dono_lista
    Created on : 23 de out. de 2025, 00:14:19
    Author     : Henrique
--%>

<%@page import="java.util.List"%>
<%@page import="modelo.DAO.DonoDAO"%>
<%@page import="modelo.Dono"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Donos</title>
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
    max-width: 1000px;
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

.tabela-donos {
    width: 100%;
    border-collapse: collapse;
    background: #fff;
    border-radius: 8px;
    overflow: hidden;
}

.tabela-donos th {
    background: #C9A66B;
    color: white;
    text-align: left;
    padding: 10px;
}

.tabela-donos td {
    padding: 10px;
    border-bottom: 1px solid #E0D4C1;
}

.tabela-donos tr:nth-child(even) {
    background: #F9F3EA;
}

.link-editar {
    color: #4A7BA7;
    text-decoration: none;
    font-weight: bold;
}

.link-editar:hover {
    text-decoration: underline;
}

.link-excluir {
    color: #B33A3A;
    text-decoration: none;
    font-weight: bold;
}

.link-excluir:hover {
    text-decoration: underline;
}

</style>
    </head>
    <body>
<div class="lista-container">

    <h2 class="titulo-lista">Lista de Donos</h2>

    <div class="links-topo">
        <a class="btn-acao" href="../Cadastro/index.html">+ Cadastrar Novo Dono</a>
        <a class="btn-voltar" href="../index.html">Voltar</a>
    </div>

    <table class="tabela-donos">
        <tr>
            <th>Ícone</th>
            <th>ID</th>
            <th>Nome</th>
            <th>CPF</th>
            <th>Telefone</th>
            <th>Email</th>
            <th>Ações</th>
        </tr>

        <%
            DonoDAO dao = new DonoDAO();
            List<Dono> lista = dao.listar();

            for (Dono d : lista) {
        %>
        <tr>
            <td><img src="${pageContext.request.contextPath}/SalvarImagem?idDono=<%= d.getIdDono() %>" width="60"></td>
            <td><%= d.getIdDono() %></td>
            <td><%= d.getNome() %></td>
            <td><%= d.getCpf() %></td>
            <td><%= d.getTelefone() %></td>
            <td><%= d.getEmail() %></td>
            <td>
                <a class="link-editar" href="../Altera/dono_cons_id.jsp?id=<%= d.getIdDono() %>">✏️ Alterar</a> |
                <a class="link-excluir" href="../Deleta/dono_excluir.jsp?id=<%= d.getIdDono() %>" onclick="return confirm('Excluir este dono e todos os dados vinculados?');">🗑️ Excluir</a>
            </td>
        </tr>
        <% } %>

    </table>

</div>
    </body>
</html>
