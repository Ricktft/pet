<%@page import="modelo.DAO.AnimalDAO"%>
<%@page import="modelo.DAO.DonoDAO"%>
<%@page import="modelo.Animal"%>
<%@page import="modelo.Dono"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Alterar Animal</title>
    
    <style>
        body {
            background-color: #FFF5E9;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            color: #6B3F2A;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #6B3F2A;
        }

        .card {
            background: #ffffff;
            border: 2px solid #6B3F2A;
            max-width: 550px;
            margin: 0 auto;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0,0,0,0.12);
        }

        label {
            font-weight: bold;
            color: #6B3F2A;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #6B3F2A;
            border-radius: 8px;
            font-size: 15px;
            color: #6B3F2A;
            background-color: #FFF9F1;
        }

        textarea {
            resize: vertical;
        }

        button,
        input[type="submit"],
        .btn-cancelar {
            background-color: #F2A344;
            border: none;
            padding: 10px 20px;
            color: #fff;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            margin-right: 10px;
        }

        button:hover,
        input[type="submit"]:hover,
        .btn-cancelar:hover {
            background-color: #d8872f;
        }

        .btn-cancelar {
            background-color: #6B3F2A;
        }

        .btn-cancelar:hover {
            background-color: #4d2d1d;
        }
    </style>
</head>
<body>
    <h2>Alterar Dados do Animal</h2>

    <div class="card">
        <%
            String idStr = request.getParameter("id");
            if (idStr == null || idStr.isEmpty()) {
                out.println("<p style='color:red;'>ID não informado.</p>");
                return;
            }

            int id = Integer.parseInt(idStr);

            AnimalDAO dao = new AnimalDAO();
            DonoDAO donoDAO = new DonoDAO();
            Animal a = dao.buscarPorId(id);
            List<Dono> donos = donoDAO.listar();

            if (a == null) {
                out.println("<p style='color:red;'>Animal não encontrado.</p>");
                return;
            }

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String chegada = (a.getData_chegada() != null) ? sdf.format(a.getData_chegada()) : "";
            String saida = (a.getData_saida() != null) ? sdf.format(a.getData_saida()) : "";
        %>

        <form method="post" action="animal_salva.jsp">
            <input type="hidden" name="idAnimal" value="<%= a.getIdAnimal() %>">

            <label>Nome:</label>
            <input type="text" name="nome" value="<%= a.getNome() %>" required>

            <label>Espécie:</label>
            <input type="text" name="especie" value="<%= a.getEspecie() %>" required>

            <label>Raça:</label>
            <input type="text" name="raca" value="<%= a.getRaca() %>">

            <label>Idade:</label>
            <input type="number" name="idade" value="<%= a.getIdade() %>">

            <label>Peso (kg):</label>
            <input type="number" step="0.01" name="peso" value="<%= a.getPeso() %>">

            <label>Data de Chegada:</label>
            <input type="date" name="data_chegada" value="<%= chegada %>">

            <label>Data de Saída:</label>
            <input type="date" name="data_saida" value="<%= saida %>">

            <label>Observações:</label>
            <textarea name="observacoes" rows="4"><%= a.getObservacoes() != null ? a.getObservacoes() : "" %></textarea>

            <label>Dono:</label>
            <select name="idDono" required>
                <option value="">Selecione o Dono</option>
                <%
                    for (Dono d : donos) {
                        String selected = (d.getIdDono() == a.getIdDono()) ? "selected" : "";
                %>
                    <option value="<%= d.getIdDono() %>" <%= selected %>><%= d.getNome() %></option>
                <%
                    }
                %>
            </select>

            <input type="submit" value="Salvar Alterações">
            <a class="btn-cancelar" href="../Lista/animal_lista.jsp">Cancelar</a>
        </form>
    </div>
</body>
</html>
