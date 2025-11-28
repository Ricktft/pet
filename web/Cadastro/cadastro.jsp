<%-- 
    Document   : cadastro
    Created on : 25 de nov. de 2025, 23:54:48
    Author     : KABUM
--%>
<%@ page import="modelo.Cadastro" %>
<%@ page import="modelo.DAO.CadastroDAO" %>
<%@ page import="seguro.MD5" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URI" %>
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
        <div class="logo">
            <img src="../imagens/site.jpg" alt="Logo">
        </div>
        <%
        if(request.getMethod().equalsIgnoreCase("POST")) {
            Cadastro cad = new Cadastro();
            cad.setNomeCad(request.getParameter("nome"));
            cad.setSenhaCad(request.getParameter("senha"));
;
            
            CadastroDAO dao = new CadastroDAO();
            
            if(dao.cadastrar(cad)) {
    %>
                <div class="voltar">
                    <h3>Usuário cadastrado</h3>
                    <a href="../index.html">Ir para Login</a>
                </div>
    <%
            } else {
    %>
                <div class="voltar">
                    <h3>Erro ao cadastrar</h3>
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
