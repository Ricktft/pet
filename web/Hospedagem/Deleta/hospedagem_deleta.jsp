<%-- 
    Document   : hospedagem_deleta
    Created on : 30 de out. de 2025, 15:01:49
    Author     : Henrique
--%>
<%@page import="modelo.DAO.HospedagemDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Excluir Hospedagem</title>
  <style>
    body {
        background: #FFF5E9;
        font-family: Arial, sans-serif;
        padding: 20px;
        color: #6B3F2A;
    }

    h2 {
        text-align: center;
        color: #6B3F2A;
        margin-bottom: 20px;
    }

    .card {
        background: #ffffff;
        width: 420px;
        margin: 0 auto;
        padding: 20px;
        border-radius: 10px;
        border: 1px solid #E0D2C3;
        box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    }

    label {
        font-weight: bold;
        color: #6B3F2A;
    }

    input[type="number"] {
        width: 95%;
        padding: 10px;
        font-size: 14px;
        margin-top: 5px;
        margin-bottom: 15px;
        border: 1px solid #C9B29E;
        border-radius: 6px;
    }

    input[type="submit"] {
        background: #F2A344;
        color: white;
        padding: 10px 16px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 15px;
        margin-right: 5px;
    }

    input[type="submit"]:hover {
        background: #E17828;
    }

    input[type="reset"] {
        background: #CFCFCF;
        color: #6B3F2A;
        padding: 10px 16px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 15px;
    }

    input[type="reset"]:hover {
        background: #bdbdbd;
    }

    a {
        display: block;
        text-align: center;
        margin-top: 20px;
        color: #6B3F2A;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        color: #E17828;
    }
</style>
</head>
<body>
<h2>Excluir Hospedagem</h2>

<%
  String idStr = request.getParameter("id");
  if (idStr == null || idStr.isEmpty()) {
      out.println("<p>ID não informado.</p>");
      return;
  }

  int id = Integer.parseInt(idStr);
  HospedagemDAO dao = new HospedagemDAO();

  try {
      boolean ok = dao.excluir(id);
      if (ok)
          out.println("<p style='color:green;'>Hospedagem excluída com sucesso!</p>");
      else
          out.println("<p style='color:red;'>Hospedagem não encontrada.</p>");
  } catch (Exception e) {
      out.println("<p style='color:red;'>Erro: " + e.getMessage() + "</p>");
  }
%>
<a href="../Lista/hospedagem_lista.jsp">Voltar à lista</a>
</body>
</html>

