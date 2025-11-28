<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Salvar Animal</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #FFF5E9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: #FFFFFF;
            width: 450px;
            padding: 30px;
            border-radius: 14px;
            box-shadow: 0px 4px 12px rgba(0,0,0,0.15);
            text-align: center;
            border: 2px solid #E8DFD6;
        }

        h2 {
            color: #6B3F2A;
            margin-bottom: 20px;
            font-weight: bold;
        }

        h3 {
            font-weight: bold;
            color: #6B3F2A;
            margin-bottom: 15px;
        }

        a {
            display: inline-block;
            margin-top: 12px;
            color: #6B3F2A;
            font-weight: bold;
            text-decoration: none;
            transition: 0.2s;
        }

        a:hover {
            color: #F2A344;
        }

        label {
            font-weight: bold;
            color: #6B3F2A;
            display: block;
            text-align: left;
            margin-top: 10px;
        }

        input[type="number"],
        input[type="text"],
        input[type="date"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            background: #FFF5E9;
            border: 1px solid #D8C9BD;
            border-radius: 6px;
            color: #6B3F2A;
        }

        input[readonly] {
            background: #E8DFD6;
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
            font-weight: bold;
            cursor: pointer;
            transition: 0.2s;
        }

        input[type="submit"] {
            background: #F2A344;
        }

        input[type="reset"] {
            background: #6B3F2A;
        }

        input[type="submit"]:hover {
            background: #D98827;
        }

        input[type="reset"]:hover {
            background: #4F2E1F;
        }
    </style>
    </head>
    <body>
        <h2>Cadastro de Animal</h2>
        <%
            String nome = request.getParameter("nome");
            String especie = request.getParameter("especie");
            String raca = request.getParameter("raca");
            String idadeStr = request.getParameter("idade");
            String pesoStr = request.getParameter("peso");
            String dataChegadaStr = request.getParameter("data_chegada");
            String dataSaidaStr = request.getParameter("data_saida");
            String observacoes = request.getParameter("observacoes");
            String idDonoStr = request.getParameter("idDono");

            int idade = 0;
            double peso = 0.0;
            int idDono = 0;

            if (idadeStr != null && !idadeStr.isEmpty()) {
                idade = Integer.parseInt(idadeStr);
            }
            if (pesoStr != null && !pesoStr.isEmpty()) {
                peso = Double.parseDouble(pesoStr);
            }
            if (idDonoStr != null && !idDonoStr.isEmpty()) {
                idDono = Integer.parseInt(idDonoStr);
            }

            String msg = "";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/pet", "root", "");

                // ⚠️ Novo SQL com os campos de data
                String sql = "INSERT INTO animal (nome, especie, raca, idade, peso, data_chegada, data_saida, observacoes, idDono) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(sql);

                ps.setString(1, nome);
                ps.setString(2, especie);
                ps.setString(3, raca);
                ps.setInt(4, idade);
                ps.setDouble(5, peso);

                // ⚡ converte as datas para java.sql.Date
                if (dataChegadaStr != null && !dataChegadaStr.isEmpty()) {
                    ps.setDate(6, java.sql.Date.valueOf(dataChegadaStr));
                } else {
                    ps.setNull(6, java.sql.Types.DATE);
                }

                if (dataSaidaStr != null && !dataSaidaStr.isEmpty()) {
                    ps.setDate(7, java.sql.Date.valueOf(dataSaidaStr));
                } else {
                    ps.setNull(7, java.sql.Types.DATE);
                }

                ps.setString(8, observacoes);
                ps.setInt(9, idDono);

                ps.executeUpdate();

                ps.close();
                conn.close();

                msg = "✅ Animal cadastrado com sucesso!";
            } catch (Exception e) {
                msg = "❌ Erro ao cadastrar animal: " + e.getMessage();
            }
        %>

    <div class="container">
        <h2>Cadastro de Animal</h2>

        <h3><%= msg %></h3>

        <a href="animal_cadastra.jsp">Voltar ao cadastro</a><br>
        <a href="../Lista/animal_lista.jsp">Ver lista de animais</a>
    </div>
    </body>
</html>
