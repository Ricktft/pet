<%-- 
    Document   : dono_cons_id
    Created on : 23 de out. de 2025
    Author     : Henrique
--%>

<%@page import="modelo.Dono"%>
<%@page import="modelo.DAO.DonoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de Donos</title>
         <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #FFF5E9; /* bege */
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .container {
        background: #ffffff;
        width: 420px;
        padding: 30px;
        border-radius: 14px;
        box-shadow: 0px 4px 10px rgba(0,0,0,0.15);
        text-align: center;
    }

    /* Logo centralizada */
    .logo img {
        width: 110px;
        margin-bottom: 15px;
        border-radius: 10px;
    }

    h2 {
        color: #6B3F2A; /* marrom */
        margin-bottom: 20px;
        font-weight: bold;
    }

    h3 {
        color: #c0392b;
        font-weight: bold;
    }

    label {
        font-weight: bold;
        color: #6B3F2A;
        display: block;
        text-align: left;
        margin-top: 10px;
    }

    input[type="text"],
    input[type="email"],
    input[type="number"] {
        width: 100%;
        padding: 10px;
        margin-top: 6px;
        background: #fff;
        border: 1px solid #d8c1aa;
        border-radius: 6px;
        outline: none;
        transition: 0.3s;
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="number"]:focus {
        border-color: #F2A344; /* laranja */
        box-shadow: 0 0 5px rgba(242, 163, 68, 0.4);
    }

    input[readonly] {
        background: #f0e5d8;
        font-weight: bold;
    }

    input[type="submit"],
    input[type="reset"] {
        width: 100%;
        padding: 12px;
        margin-top: 15px;
        border: none;
        border-radius: 6px;
        color: white;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
    }

    /* Botão salvar */
    input[type="submit"] {
        background: #F2A344; /* laranja */
    }
    input[type="submit"]:hover {
        background: #d9872e;
    }

    /* Botão reset */
    input[type="reset"] {
        background: #6B3F2A; /* marrom */
    }
    input[type="reset"]:hover {
        background: #4f2d1e;
    }
</style>

    </head>
    <body>
       <div class="container">

    <div class="logo">
        <img src="../imagens/site.jpg" alt="Logo">
    </div>

    <h2>Donos - Consulta ID - Alterar</h2>

    <%
        Dono d = new Dono();
        DonoDAO dao = new DonoDAO();

        String ident = request.getParameter("id");

        if (ident == null || ident.isEmpty()) {
            out.println("<h3>ID não informado.</h3>");
            return;
        }

        d.setIdDono(Integer.parseInt(ident));
        d = dao.buscarPorId(d.getIdDono());

        if (d == null) {
            out.println("<h3>Dono não localizado!</h3>");
        } else {
    %>

        <form method="post" action="dono_altera_salva.jsp">

            <label>ID:</label>
            <input type="number" name="idDono" value="<%=d.getIdDono()%>" readonly>

            <label>Nome:</label>
            <input type="text" name="nome" value="<%=d.getNome()%>" required>

            <label>CPF:</label>
            <input type="text" name="cpf" value="<%=d.getCpf()%>" required>

            <label>Telefone:</label>
            <input type="text" name="telefone" value="<%=d.getTelefone()%>">

            <label>Email:</label>
            <input type="email" name="email" value="<%=d.getEmail()%>" required>

            <input type="submit" value="Salvar Alteração">
            <input type="reset" value="Limpar">
        </form>

    <%
        }
    %>

</div>

    </body>
</html>
