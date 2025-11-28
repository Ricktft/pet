<%@page import="modelo.DAO.HospedagemDAO"%>
<%@page import="modelo.Hospedagem"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Alterar Hospedagem</title>
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

        form {
            background: #fff;
            border: 2px solid #6B3F2A;
            border-radius: 10px;
            max-width: 500px;
            margin: 0 auto;
            padding: 25px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #6B3F2A;
            border-radius: 6px;
            box-sizing: border-box;
        }

        input[type="submit"],
        input[type="reset"],
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            background-color: #F2A344;
            color: #fff;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover,
        a:hover {
            background-color: #d8872f;
        }

        p {
            text-align: center;
            font-weight: bold;
        }

        .center-btn {
            text-align: center;
        }
    </style>
</head>
</head>
<body>
<h2>Alterar Hospedagem</h2>

<%
  String idStr = request.getParameter("id");
  if (idStr == null || idStr.isEmpty()) {
      out.println("<p style='color:red;'>ID não informado.</p>");
      return;
  }

  int id = Integer.parseInt(idStr);
  HospedagemDAO dao = new HospedagemDAO();
  Hospedagem h = dao.buscarPorId(id);

  if (h == null) {
      out.println("<p style='color:red;'>Hospedagem não encontrada.</p>");
      return;
  }

  if ("POST".equalsIgnoreCase(request.getMethod())) {
      try {
          java.sql.Date entrada = java.sql.Date.valueOf(request.getParameter("dataEntrada"));
          java.sql.Date saida   = java.sql.Date.valueOf(request.getParameter("dataSaida"));
          double diaria         = Double.parseDouble(request.getParameter("valorDiaria"));
          long dias = (saida.getTime() - entrada.getTime()) / (1000L*60L*60L*24L);
          if (dias <= 0) dias = 1;

          h.setDataEntrada(entrada);
          h.setDataSaida(saida);
          h.setValorDiaria(diaria);
          h.setValorTotal(diaria * dias);
          h.setObservacoes(request.getParameter("observacoes"));

          boolean ok = dao.atualizar(h);
          if (ok)
              out.println("<p style='color:green;'>Atualizada com sucesso!</p>");
          else
              out.println("<p style='color:red;'>Erro ao atualizar.</p>");
      } catch (Exception e) {
          out.println("<p style='color:red;'>Erro: " + e.getMessage() + "</p>");
      }
%>
  <div class="center-btn">
      <a href="../Lista/hospedagem_lista.jsp">Voltar</a>
  </div>
<%
      return;
  }
%>

<form method="post">
  <label>Data de Entrada:</label>
  <input type="date" name="dataEntrada" value="<%= h.getDataEntrada() %>" required>

  <label>Data de Saída:</label>
  <input type="date" name="dataSaida" value="<%= h.getDataSaida() %>" required>

  <label>Valor da Diária:</label>
  <input type="number" name="valorDiaria" step="0.01" value="<%= h.getValorDiaria() %>" required>

  <label>Observações:</label>
  <textarea name="observacoes" rows="3"><%= h.getObservacoes() %></textarea>

  <div class="center-btn">
      <input type="submit" value="Salvar Alterações">
  </div>
</form>

<div class="center-btn">
    <a href="../Lista/hospedagem_lista.jsp">Cancelar</a>
</div>

</body>
</html>
