<%@page import="modelo.DAO.DonoDAO"%>
<%@page import="modelo.Dono"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Animal</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #FFF5E9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .container {
            background: #FFFFFF;
            width: 480px;
            padding: 30px;
            margin-top: 40px;
            border-radius: 14px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.15);
            border: 2px solid #E8DFD6;
        }

        h2, h3 {
            text-align: center;
            color: #6B3F2A;
            font-weight: bold;
        }

        h3 {
            margin-bottom: 20px;
        }

        label, input, textarea, select {
            width: 100%;
            display: block;
        }

        label {
            margin-top: 12px;
            font-weight: bold;
            color: #6B3F2A;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        input[type="file"],
        textarea,
        select {
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 12px;
            background: #FFF5E9;
            border: 1px solid #D8C9BD;
            border-radius: 6px;
            color: #6B3F2A;
        }

        textarea {
            resize: vertical;
        }

        button,
        input[type="reset"] {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.2s;
            color: white;
        }

        button {
            background: #F2A344;
        }
        button:hover {
            background: #D98827;
        }

        input[type="reset"] {
            background: #6B3F2A;
        }
        input[type="reset"]:hover {
            background: #4F2E1F;
        }

        a {
            display: block;
            text-align: center;
            margin-top: 15px;
            color: #6B3F2A;
            font-weight: bold;
            text-decoration: none;
        }

        a:hover {
            color: #F2A344;
        }
    </style>
</head>
<body>
<div class="container">

<h2>Cadastro de Animal</h2>
<form method="post" action="${pageContext.request.contextPath}/SalvarImagemPet" enctype="multipart/form-data">

        <label>Nome</label>
        <input type="text" name="nome" required>

        <label>Espécie</label>
        <input type="text" name="especie" required>

        <label>Raça</label>
        <input type="text" name="raca">

        <label>Idade</label>
        <input type="number" name="idade">

        <label>Peso (kg)</label>
        <input type="number" name="peso" step="0.01">

        <label>Selecione uma imagem</label>
        <input type="file" name="imagem_pet" accept=".jpeg,.png,.jpg">

        <label>Data de Chegada</label>
        <input type="date" name="data_chegada" required>

        <label>Data de Saída</label>
        <input type="date" name="data_saida">

        <label>Observações</label>
        <textarea name="observacoes" rows="4"></textarea>

        <label>Dono</label>
        <select name="idDono" required>
            <option value="">Selecione o Dono</option>
            <%
                DonoDAO donoDAO = new DonoDAO();
                List<Dono> donos = donoDAO.listar();
                for (Dono d : donos) {
            %>
                <option value="<%= d.getIdDono() %>"><%= d.getNome() %></option>
            <% } %>
        </select>

        <button type="submit">Cadastrar animal</button>
        <input type="reset" value="Limpar">
</form>

</div>
</body>
</html>