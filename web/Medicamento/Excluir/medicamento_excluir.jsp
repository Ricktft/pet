<%@page import="modelo.DAO.MedicamentoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Excluir Medicamento</title>
    <style>
        body {
            background-color: #FFF5E9;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #6B3F2A;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .card {
            background: #fff;
            border: 2px solid #6B3F2A;
            border-radius: 12px;
            padding: 25px 30px;
            width: 400px;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
            text-align: center;
        }

        h3 {
            font-size: 20px;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }

        a {
            display: inline-block;
            margin-top: 15px;
            background-color: #F2A344;
            color: #fff;
            text-decoration: none;
            padding: 10px 18px;
            border-radius: 6px;
            font-weight: bold;
        }

        a:hover {
            background-color: #d8872f;
        }
    </style>
</head>
<body>
<%
    MedicamentoDAO dao = new MedicamentoDAO();
    String idStr = request.getParameter("id");

    if (idStr == null || idStr.isEmpty()) {
%>
    <h3>ID não informado!</h3>
    <a href="../Lista/medicamento_lista.jsp">Voltar</a>
<%
        return;
    }

    int id = Integer.parseInt(idStr);
    String msg;
    try {
        boolean ok = dao.excluir(id);
        msg = ok ? "✅ Medicamento excluído com sucesso!" : "❌ Medicamento não encontrado.";
    } catch (Exception e) {
        msg = "Erro: " + e.getMessage();
    }
%>
    <div class="card">
        <h3><%= msg %></h3>
        <a href="../Lista/medicamento_lista.jsp">Voltar à lista</a>
    </div>
</body>
</html>
