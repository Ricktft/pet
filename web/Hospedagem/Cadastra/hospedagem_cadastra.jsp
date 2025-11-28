<%@page import="modelo.DAO.HospedagemDAO"%>
<%@page import="modelo.Hospedagem"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Hospedagem</title>
    <style>
        body {
            background: #FFF5E9;
            font-family: Arial, sans-serif;
            margin: 40px;
            color: #6B3F2A;
        }

        h2 {
            color: #6B3F2A;
            margin-bottom: 20px;
        }

        form {
            background: white;
            padding: 20px;
            border-radius: 10px;
            max-width: 450px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
        }

        label {
            font-weight: bold;
            color: #6B3F2A;
        }

        input, select, textarea {
            width: 100%;
            padding: 8px;
            margin-top: 4px;
            margin-bottom: 16px;
            border: 1px solid #d6c2b3;
            border-radius: 6px;
            background: #fff;
            color: #6B3F2A;
        }

        textarea {
            resize: none;
        }

        input[type="submit"], 
        input[type="reset"] {
            background: #F2A344;
            border: none;
            color: white;
            font-weight: bold;
            cursor: pointer;
            padding: 10px 16px;
            border-radius: 6px;
            width: auto;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background: #d98529;
        }

        a {
            color: #6B3F2A;
            font-weight: bold;
            text-decoration: none;
        }

        a:hover {
            color: #F2A344;
        }

        p {
            color: #6B3F2A;
        }
    </style>
</head>
<body>
    <h2>Cadastro de Hospedagem</h2>

<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            Hospedagem h = new Hospedagem();

            int idDono    = Integer.parseInt(request.getParameter("idDono"));
            int idAnimal  = Integer.parseInt(request.getParameter("idAnimal"));
            java.sql.Date dataEntrada = java.sql.Date.valueOf(request.getParameter("dataEntrada"));
            java.sql.Date dataSaida   = java.sql.Date.valueOf(request.getParameter("dataSaida"));
            double valorDiaria        = Double.parseDouble(request.getParameter("valorDiaria"));
            String observacoes        = request.getParameter("observacoes");

            long diffMillis = dataSaida.getTime() - dataEntrada.getTime();
            long dias = diffMillis / (1000L * 60L * 60L * 24L);
            if (dias <= 0) dias = 1;

            double valorTotal = valorDiaria * dias;

            h.setIdDono(idDono);
            h.setIdAnimal(idAnimal);
            h.setDataEntrada(dataEntrada);
            h.setDataSaida(dataSaida);
            h.setValorDiaria(valorDiaria);
            h.setValorTotal(valorTotal);
            h.setObservacoes(observacoes);

            HospedagemDAO dao = new HospedagemDAO();
            boolean ok = dao.inserir(h);

            if (ok) {
                out.println("<p style='color:green;'>Hospedagem cadastrada com sucesso! (" 
                        + dias + " dias, total R$ " 
                        + String.format("%.2f", valorTotal) + ")</p>");
            } else {
                out.println("<p style='color:red;'>Erro ao cadastrar hospedagem.</p>");
            }

        } catch (Exception e) {
            out.println("<p style='color:red;'>Erro: " + e.getMessage() + "</p>");
        }
%>
        <a href="hospedagem_cadastra.jsp">Voltar ao cadastro</a><br><br>
        <a href="../Lista/hospedagem_lista.jsp">Ver lista de hospedagens</a>

<%
        return;
    }

    List<String[]> donos = new ArrayList<>();
    List<String[]> animais = new ArrayList<>();

    try (Connection c = Con_DB.Conn_DB.conectar()) {

        PreparedStatement ps1 = c.prepareStatement(
            "SELECT idDono, nome FROM dono ORDER BY nome"
        );
        ResultSet rs1 = ps1.executeQuery();
        while (rs1.next()) {
            donos.add(new String[] {
                rs1.getString("idDono"),
                rs1.getString("nome")
            });
        }
        rs1.close();
        ps1.close();

        PreparedStatement ps2 = c.prepareStatement(
            "SELECT idAnimal, nome FROM animal ORDER BY nome"
        );
        ResultSet rs2 = ps2.executeQuery();
        while (rs2.next()) {
            animais.add(new String[] {
                rs2.getString("idAnimal"),
                rs2.getString("nome")
            });
        }
        rs2.close();
        ps2.close();

    } catch (Exception e) {
        out.println("<p style='color:red;'>Erro ao carregar Donos/Animais: " + e.getMessage() + "</p>");
    }
%>

    <form method="post">
        <label>Dono:</label>
        <select name="idDono" required>
            <option value="">Selecione o Dono</option>
            <% for (String[] d : donos) { %>
                <option value="<%= d[0] %>"><%= d[1] %></option>
            <% } %>
        </select>

        <label>Animal:</label>
        <select name="idAnimal" required>
            <option value="">Selecione o Animal</option>
            <% for (String[] a : animais) { %>
                <option value="<%= a[0] %>"><%= a[1] %></option>
            <% } %>
        </select>

        <label>Data de Entrada:</label>
        <input type="date" name="dataEntrada" required>

        <label>Data de Saída:</label>
        <input type="date" name="dataSaida" required>

        <label>Valor da Diária (R$):</label>
        <input type="number" name="valorDiaria" step="0.01" required>

        <label>Observações:</label>
        <textarea name="observacoes" rows="3"></textarea>

        <input type="submit" value="Cadastrar">
        <input type="reset" value="Limpar">
    </form>

    <br>
    <a href="../Lista/hospedagem_lista.jsp">Ver lista de hospedagens</a>

</body>
</html>
