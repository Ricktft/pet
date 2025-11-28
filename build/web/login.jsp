<%-- 
    Document   : login
    Created on : 25 de nov. de 2025, 23:19:53
    Author     : KABUM
--%>
<%@ page import="modelo.Cadastro" %>
<%@ page import="modelo.DAO.CadastroDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: #FFF5E9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }


        h3 {
            text-align: center;
            margin-bottom: 20px;
            color: #6B3F2A;
            font-weight: bold;
        }


        .voltar {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .voltar a {
            color: #F2A344;
            text-decoration: none;
            font-weight: bold;
        }

        .voltar a:hover {
            text-decoration: underline;
            color: #6B3F2A;
        }
         .logo {
            display: flex;
            justify-content: center;
            margin-bottom: 15px;
        }

        .logo img {
            width: 110px;
        }
    </style>
    </head>
    <body>
            <%
        if(request.getMethod().equalsIgnoreCase("POST")) {
            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");
            
            CadastroDAO dao = new CadastroDAO();
            Cadastro cad = dao.validarLogin(nome, senha);
            
            if(cad != null) {
                session.setAttribute("Logado", cad);
                response.sendRedirect("Home/index.html");
            } else {
    %>
    
        <div class="voltar">
            <h3>Nome ou Senha incorretos</h3>
            <a href="index.html">Tentar novamente</a>
        </div>
    
    <%
            }
        } else {
            response.sendRedirect("index.html");
        }
    %>
    </body>
</html>
