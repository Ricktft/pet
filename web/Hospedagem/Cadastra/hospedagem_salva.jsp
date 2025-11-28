<%-- 
    Document   : hospedagem_salva
    Created on : 30 de out. de 2025, 14:14:12
    Author     : Henrique
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Salvar Hospedagem</title>
     <style>
        body {
            font-family: Arial, sans-serif;
            background: #FFF5E9; /* bege */
            padding: 20px;
            color: #6B3F2A; /* marrom */
        }

        h3 {
            text-align: center;
            color: #6B3F2A;
            margin-bottom: 25px;
        }

        a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 16px;
            background: #F2A344; /* laranja */
            color: #FFF;
            text-decoration: none;
            border-radius: 6px;
            transition: .2s;
        }

        a:hover {
            background: #d98a2f;
        }

        .msg-box {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            border: 2px solid #F2A344;
            text-align: center;
            font-size: 18px;
            box-shadow: 0 0 10px #00000020;
        }
    </style>
</head>
<body>

<div class="msg-box">
<%
    String idDonoStr = request.getParameter("idDono");
    String idAnimalStr = request.getParameter("idAnimal");
    String dataEntradaStr = request.getParameter("dataEntrada");
    String dataSaidaStr = request.getParameter("dataSaida");
    String valorDiariaStr = request.getParameter("valorDiaria");
    String valorTotalStr = request.getParameter("valorTotal");
    String observacoes = request.getParameter("observacoes");

    int idDono = Integer.parseInt(idDonoStr);
    int idAnimal = Integer.parseInt(idAnimalStr);
    double valorDiaria = valorDiariaStr.isEmpty() ? 0 : Double.parseDouble(valorDiariaStr);
    double valorTotal = valorTotalStr.isEmpty() ? 0 : Double.parseDouble(valorTotalStr);

    String msg = "";
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/pet", "root", "");

        String sql = "INSERT INTO hospedagem (idDono, idAnimal, dataEntrada, dataSaida, observacoes, valorDiaria, valorTotal) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setInt(1, idDono);
        ps.setInt(2, idAnimal);
        ps.setString(3, dataEntradaStr);
        ps.setString(4, dataSaidaStr.isEmpty() ? null : dataSaidaStr);
        ps.setString(5, observacoes);
        ps.setDouble(6, valorDiaria);
        ps.setDouble(7, valorTotal);

        ps.executeUpdate();
        ps.close();
        conn.close();

        msg = "✅ Hospedagem cadastrada com sucesso!";
    } catch (Exception e) {
        msg = "❌ Erro ao cadastrar hospedagem: " + e.getMessage();
    }
%>

<h3><%= msg %></h3>

<a href="hospedagem_cadastra.jsp">Voltar ao cadastro</a><br><br>
<a href="../Lista/hospedagem_lista.jsp">Ver lista de hospedagens</a>
</div>

</body>
</html>
