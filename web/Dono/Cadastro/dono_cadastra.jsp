<%-- 
    Document   : dono_cadastra
    Created on : 23 de out. de 2025, 00:10:51
    Author     : Henrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Dono"%>
<%@page import="modelo.DAO.DonoDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cadastro de Dono</title>
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
            Dono d = new Dono();
            d.setNome(request.getParameter("nome"));
            d.setCpf(request.getParameter("cpf"));
            d.setTelefone(request.getParameter("telefone"));
            d.setEmail(request.getParameter("email"));

            String msg;
            try {
                DonoDAO dao = new DonoDAO();
                boolean ok = dao.inserir(d);
                msg = ok ? " Dono cadastrado com sucesso!" : " Falha ao cadastrar dono.";
            } catch (Exception e) {
                msg = "Erro: " + e.getMessage();
            }
        %>
        <h3><%= msg %></h3>
        <div class="voltar">
            <a href="index.html">Voltar ao cadastro</a><br>
            <a href="../Lista/dono_lista.jsp">Ver lista</a>
        </div>
    </body>
</html>

