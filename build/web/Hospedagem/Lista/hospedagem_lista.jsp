<%@page import="modelo.DAO.HospedagemDAO"%>
<%@page import="modelo.Hospedagem"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Lista de Hospedagens</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #FFF5E9;
            margin: 0;
            padding: 20px;
            color: #6B3F2A;
        }

        h2 {
            color: #6B3F2A;
            text-align: center;
            margin-bottom: 25px;
        }

        a {
            color: #F2A344;
            font-weight: bold;
            text-decoration: none;
            margin-right: 15px;
        }

        a:hover {
            color: #6B3F2A;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #FFFFFF;
            border: 2px solid #6B3F2A;
            border-radius: 8px;
            overflow: hidden;
        }

        th {
            background: #6B3F2A;
            color: #FFF5E9;
            padding: 10px;
            font-size: 16px;
            text-transform: uppercase;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #A6755B;
            text-align: center;
        }

        tr:nth-child(even) {
            background: #FFF1DD;
        }

        tr:hover {
            background: #F2A34433;
        }

        .top-links {
            margin-bottom: 20px;
            display: flex;
            gap: 20px;
        }

        .acao a {
            padding: 5px 8px;
            border-radius: 6px;
        }

        .acao a:hover {
            background: #F2A34455;
        }
    </style>
</head>
<body>

<h2>Lista de Hospedagens</h2>

<div class="top-links">
    <a href="../Cadastra/hospedagem_cadastra.jsp">+ Nova Hospedagem</a>
    <a href="../index.html">Voltar</a>
</div>

<table>
<tr>
  <th>ID</th>
  <th>Dono</th>
  <th>Animal</th>
  <th>Entrada</th>
  <th>Saída</th>
  <th>Diária</th>
  <th>Total</th>
  <th>Observações</th>
  <th>Ações</th>
</tr>

<%
  SimpleDateFormat br = new SimpleDateFormat("dd/MM/yyyy");
  HospedagemDAO dao = new HospedagemDAO();
  List<Hospedagem> lista = dao.listar();

  for (Hospedagem h : lista) {
%>
<tr>
  <td><%= h.getIdHospedagem() %></td>
  <td><%= h.getIdDono() %></td>
  <td><%= h.getIdAnimal() %></td>
  <td><%= (h.getDataEntrada()!=null? br.format(h.getDataEntrada()):"—") %></td>
  <td><%= (h.getDataSaida()!=null? br.format(h.getDataSaida()):"—") %></td>
  <td>R$ <%= String.format("%.2f", h.getValorDiaria()) %></td>
  <td>R$ <%= String.format("%.2f", h.getValorTotal()) %></td>
  <td><%= h.getObservacoes() %></td>

  <td class="acao">
    <a href="../Altera/hospedagem_altera.jsp?id=<%= h.getIdHospedagem() %>">✏️</a>
    |
    <a href="../Deleta/hospedagem_deleta.jsp?id=<%= h.getIdHospedagem() %>"
       onclick="return confirm('Excluir hospedagem?');">🗑️</a>
  </td>
</tr>
<% } %>
</table>

</body>
</html>
