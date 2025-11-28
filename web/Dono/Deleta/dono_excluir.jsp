<%-- 
    Document   : dono_deleta
    Created on : 23 de out. de 2025, 00:15:52
    Author     : Henrique
--%>

<%@page import="modelo.Dono"%>
<%@page import="modelo.DAO.DonoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Excluir Dono</title>
        <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #F7F2EB;
        color: #4A4A4A;
        margin: 0;
        padding: 20px;
    }

    .resultado-container {
        background: #F5E6D3;
        border-left: 5px solid #C9A66B;
        padding: 25px;
        border-radius: 12px;
        max-width: 500px;
    }

    .titulo-mensagem {
        color: #6B4F4F;
        margin-bottom: 20px;
        font-weight: bold;
    }

    .btn-voltar {
        display: inline-block;
        padding: 12px 18px;
        background-color: #C9A66B;
        color: white;
        border-radius: 6px;
        text-decoration: none;
        font-weight: bold;
        transition: 0.3s;
    }

    .btn-voltar:hover {
        background-color: #A37E4B;
    }
</style>
    </head>
    <body>
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            String msg;

            try {
                DonoDAO dao = new DonoDAO();
                dao.excluir(id);
                msg = "️ Dono excluído com sucesso! (Animais e Medicamentos deletados em cascata)";
            } catch (Exception e) {
                msg = "Erro ao excluir: " + e.getMessage();
            }
        %>

    <div class="resultado-container">
        <h2 class="titulo-mensagem"><%= msg %></h2>

        <a href="../Lista/dono_lista.jsp" class="btn-voltar">Voltar à lista</a>
    </div>
 
    </body>
</html>

