<%-- 
    Document   : dono_altera_salva
    Created on : 23 de out. de 2025
    Author     : Henrique
--%>

<%@page import="modelo.Dono"%>
<%@page import="modelo.DAO.DonoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Alterar Dono</title>
        
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F7F2EB;
            color: #4A4A4A;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #6B4F4F;
            margin-bottom: 15px;
        }

        h3 {
            background-color: #F5E6D3;
            padding: 12px;
            border-left: 5px solid #C9A66B;
            border-radius: 6px;
        }

        a {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            background-color: #C9A66B;
            color: white;
            padding: 10px 18px;
            border-radius: 6px;
            transition: 0.3s;
        }

        a:hover {
            background-color: #A37E4B;
        }
    </style>
    </head>
    <body>
        <h2>Donos - Alterar</h2>
        <%
            Dono d = new Dono();
            DonoDAO dao = new DonoDAO();

            d.setIdDono(Integer.parseInt(request.getParameter("idDono")));
            d.setNome(request.getParameter("nome"));
            d.setCpf(request.getParameter("cpf"));
            d.setTelefone(request.getParameter("telefone"));
            d.setEmail(request.getParameter("email"));

            try {
                dao.atualizar(d);
                out.println("<h3> Dono atualizado com sucesso!</h3>");
            } catch (Exception e) {
                out.println("<h3> Erro ao atualizar: " + e.getMessage() + "</h3>");
            }
        %>

        <a href="../Lista/dono_lista.jsp">Voltar à lista</a>
    </body>
</html>
