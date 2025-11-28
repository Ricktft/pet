<%@page import="modelo.DAO.MedicamentoDAO"%>
<%@page import="modelo.Medicamento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Medicamentos</title>
    <style>
        body {
            background-color: #FFF5E9;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            color: #6B3F2A;
        }

        h2 {
            text-align: center;
            color: #6B3F2A;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            margin: 5px 0;
            text-decoration: none;
            background-color: #F2A344;
            color: #fff;
            padding: 8px 16px;
            border-radius: 6px;
            font-weight: bold;
        }

        a:hover {
            background-color: #d8872f;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border: 2px solid #6B3F2A;
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            background-color: #F2A344;
            color: white;
            padding: 10px;
            text-align: left;
            border-bottom: 2px solid #6B3F2A;
        }

        td {
            padding: 8px;
            border-bottom: 1px solid #ccc;
        }

        tr:hover {
            background-color: #FFE2C4;
        }
    </style>
</head>
<body>

    <h2>Lista de Medicamentos</h2>

    <a href="../Cadastra/medicamento_cadastra.jsp">+ Cadastrar Novo</a>
    <a href="../index.html">Voltar</a>

    <table>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Intervalo (h)</th>
            <th>Dose</th>
            <th>Unidade</th>
            <th>Nome Animal</th>
            <th>Ações</th>
        </tr>
        <%
            MedicamentoDAO dao = new MedicamentoDAO();
            List<Medicamento> lista = dao.listar();

            for (Medicamento m : lista) {
        %>
        <tr>
            <td><%= m.getId_remedio() %></td>
            <td><%= m.getNome_remedio() %></td>
            <td><%= m.getIntervalo_tempo() %></td>
            <td><%= m.getDose() %></td>
            <td><%= m.getUnidade() %></td>
            <td><%= m.getNomeAnimal() %></td>

            <td>
                <a href="../Altera/medicamento_altera.jsp?id=<%= m.getId_remedio() %>">✏️ Alterar</a>
                <a href="../Excluir/medicamento_excluir.jsp?id=<%= m.getId_remedio() %>"
                   onclick="return confirm('Excluir este medicamento?');">🗑️ Excluir</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
