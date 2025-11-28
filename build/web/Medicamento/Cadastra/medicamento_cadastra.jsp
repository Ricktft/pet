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
        <title>Cadastro de Medicamento</title>
         <style>
        body {
            background-color: #FFF5E9;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            color: #6B3F2A;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: #ffffff;
            width: 450px;
            padding: 25px;
            border-radius: 12px;
            border: 2px solid #6B3F2A;
            box-shadow: 0 0 12px rgba(0,0,0,0.15);
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
            color: #6B3F2A;
        }

        h3 {
            font-weight: bold;
            margin-bottom: 18px;
        }

        label, select, input {
            font-size: 16px;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 15px;
            border: 2px solid #6B3F2A;
            border-radius: 6px;
            background: #fff;
            color: #6B3F2A;
        }

        input[type="submit"],
        input[type="reset"] {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            border: none;
            border-radius: 6px;
            font-size: 18px;
            font-weight: bold;
            background-color: #F2A344;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #d8872f;
        }

        a {
            display: inline-block;
            margin-top: 18px;
            font-weight: bold;
            color: #6B3F2A;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
    </head>
    
<body>

<div class="container">

<%
    String metodo = request.getMethod();
    MedicamentoDAO medDAO = new MedicamentoDAO();
    AnimalDAO animalDAO = new AnimalDAO();

    if ("POST".equalsIgnoreCase(metodo)) {
        Medicamento m = new Medicamento();
        m.setNome_remedio(request.getParameter("nome_remedio"));
        m.setIntervalo_tempo(Integer.parseInt(request.getParameter("intervalo_tempo")));
        m.setDose(Integer.parseInt(request.getParameter("dose")));
        m.setUnidade(request.getParameter("unidade"));
        m.setFk_id_animal(Integer.parseInt(request.getParameter("fk_id_animal")));

        String msg;
        try {
            medDAO.inserir(m);
            msg = "Medicamento cadastrado com sucesso!";
        } catch (Exception e) {
            msg = "Erro ao cadastrar: " + e.getMessage();
        }
%>
        <h3><%= msg %></h3>
        <a href="medicamento_cadastra.jsp">Voltar</a><br>
        <a href="../Lista/medicamento_lista.jsp">Ver lista de medicamentos</a>
<%
        return;
    }
%>

    <h2>Cadastro de Medicamento</h2>

    <form method="post">
        Nome do Remédio:
        <input type="text" name="nome_remedio" required>

        Intervalo de Tempo (horas):
        <input type="number" name="intervalo_tempo" required>

        Dose:
        <input type="number" name="dose" required>

        Unidade:
        <select name="unidade" required>
            <option value="">Selecione</option>
            <option value="gota">Gota</option>
            <option value="capsula">Cápsula</option>
            <option value="ml">ML</option>
        </select>

        <label>Animal:</label>
        <select name="fk_id_animal" required>
            <option value="">Selecione o Animal</option>
            <%
                List<Animal> animais = animalDAO.listar();
                for (Animal a : animais) {
            %>
                <option value="<%= a.getIdAnimal() %>"><%= a.getNome() %></option>
            <%
                }
            %>
        </select>

        <input type="submit" value="Cadastrar Medicamento">
        <input type="reset" value="Limpar">
    </form>

</div>
</body>
</html>
