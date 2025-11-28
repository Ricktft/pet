<%@page import="modelo.DAO.AnimalDAO"%>
<%@page import="modelo.DAO.MedicamentoDAO"%>
<%@page import="modelo.Animal"%>
<%@page import="modelo.Medicamento"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Alterar Medicamento</title>
    <style>
    body {
        background-color: #FFF5E9;
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 20px;
        color: #6B3F2A;
        text-align: center;
    }

    h2 {
        color: #6B3F2A;
        margin-bottom: 20px;
    }

    .container {
        background: #fff;
        border: 2px solid #6B3F2A;
        border-radius: 10px;
        max-width: 450px;
        margin: 0 auto;
        padding: 25px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
        text-align: left;
    }

    label {
        font-weight: bold;
        display: block;
        margin-top: 10px;
        margin-bottom: 4px;
    }

    input[type="text"],
    input[type="number"],
    select,
    textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #6B3F2A;
        border-radius: 6px;
        margin-bottom: 12px;
        background: #fffdf8;
    }

    textarea {
        resize: vertical;
    }

    input[type="submit"],
    a.button {
        display: inline-block;
        width: 100%;
        background-color: #F2A344;
        color: #fff;
        padding: 12px;
        text-decoration: none;
        border-radius: 6px;
        font-weight: bold;
        border: none;
        font-size: 16px;
        cursor: pointer;
        margin-top: 10px;
        text-align: center;
    }

    input[type="submit"]:hover,
    a.button:hover {
        background-color: #d8872f;
    }

    a.link {
        display: inline-block;
        margin-top: 15px;
        color: #6B3F2A;
        font-weight: bold;
        text-decoration: none;
    }

    a.link:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>

<h2>Alterar Medicamento</h2>

<div class="container">

<%
    MedicamentoDAO medDAO = new MedicamentoDAO();
    AnimalDAO animalDAO = new AnimalDAO();

    String metodo = request.getMethod();

    if ("POST".equalsIgnoreCase(metodo)) {
        Medicamento m = new Medicamento();
        m.setId_remedio(Integer.parseInt(request.getParameter("id_remedio")));
        m.setNome_remedio(request.getParameter("nome_remedio"));
        m.setIntervalo_tempo(Integer.parseInt(request.getParameter("intervalo_tempo")));
        m.setDose(Integer.parseInt(request.getParameter("dose")));
        m.setUnidade(request.getParameter("unidade"));
        m.setFk_id_animal(Integer.parseInt(request.getParameter("fk_id_animal")));

        String msg;
        try {
            medDAO.atualizar(m);
            msg = "✅ Medicamento atualizado com sucesso!";
        } catch (Exception e) {
            msg = "❌ Erro: " + e.getMessage();
        }
%>
        <h3><%= msg %></h3>
        <a class="button" href="../Lista/medicamento_lista.jsp">Voltar à lista</a>
<%
        return;
    }

    String idStr = request.getParameter("id");
    if (idStr == null || idStr.isEmpty()) {
%>
    <h3>ID não informado!</h3>
    <a class="button" href="../Lista/medicamento_lista.jsp">Voltar</a>
<%
        return;
    }

    int id = Integer.parseInt(idStr);
    Medicamento m = medDAO.buscarPorId(id);
    if (m == null) {
%>
    <h3>Medicamento não encontrado!</h3>
    <a class="button" href="../Lista/medicamento_lista.jsp">Voltar</a>
<%
        return;
    }
    List<Animal> animais = animalDAO.listar();
%>

<form method="post">
    <input type="hidden" name="id_remedio" value="<%= m.getId_remedio() %>">

    <label>Nome:</label>
    <input type="text" name="nome_remedio" value="<%= m.getNome_remedio() %>" required>

    <label>Intervalo (h):</label>
    <input type="number" name="intervalo_tempo" value="<%= m.getIntervalo_tempo() %>" required>

    <label>Dose:</label>
    <input type="number" name="dose" value="<%= m.getDose() %>" required>

    <label>Unidade:</label>
    <select name="unidade" required>
        <option value="gota" <%= "gota".equals(m.getUnidade()) ? "selected" : "" %>>Gota</option>
        <option value="capsula" <%= "capsula".equals(m.getUnidade()) ? "selected" : "" %>>Cápsula</option>
        <option value="ml" <%= "ml".equals(m.getUnidade()) ? "selected" : "" %>>ML</option>
    </select>

    <label>Animal:</label>
    <select name="fk_id_animal" required>
        <%
            for (Animal a : animais) {
                String selected = (a.getIdAnimal() == m.getFk_id_animal()) ? "selected" : "";
        %>
            <option value="<%= a.getIdAnimal() %>" <%= selected %>><%= a.getNome() %></option>
        <%
            }
        %>
    </select>

    <input type="submit" value="Salvar Alterações">
</form>
</div>

<a class="link" href="../Lista/medicamento_lista.jsp">Voltar à lista</a>
</body>
</html>
