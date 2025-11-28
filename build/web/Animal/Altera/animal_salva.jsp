<%-- 
    Document   : animal_salva
    Created on : 30 de out. de 2025, 02:58:20
    Author     : Henrique
--%>

<%@page import="modelo.Animal"%>
<%@page import="modelo.DAO.AnimalDAO"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Atualizar Animal</title>
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
            color: #6B3F2A;
            margin-bottom: 20px;
        }

        .card {
            background: #fff;
            border: 2px solid #6B3F2A;
            border-radius: 10px;
            max-width: 450px;
            margin: 0 auto;
            padding: 25px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
        }

        p {
            font-size: 18px;
            font-weight: bold;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            background-color: #F2A344;
            color: #fff;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
        }

        a:hover {
            background-color: #d8872f;
        }
    </style>
</head>
<body>
    <h2>Atualização de Animal</h2>

    <div class="card">
        <%
            try {
                int id = Integer.parseInt(request.getParameter("idAnimal"));
                String nome = request.getParameter("nome");
                String especie = request.getParameter("especie");
                String raca = request.getParameter("raca");
                int idade = Integer.parseInt(request.getParameter("idade"));
                double peso = Double.parseDouble(request.getParameter("peso"));
                String dataChegadaStr = request.getParameter("data_chegada");
                String dataSaidaStr = request.getParameter("data_saida");
                String observacoes = request.getParameter("observacoes");
                int idDono = Integer.parseInt(request.getParameter("idDono"));

                Date dataChegada = (dataChegadaStr != null && !dataChegadaStr.isEmpty())
                        ? Date.valueOf(dataChegadaStr)
                        : null;

                Date dataSaida = (dataSaidaStr != null && !dataSaidaStr.isEmpty())
                        ? Date.valueOf(dataSaidaStr)
                        : null;

                Animal a = new Animal();
                a.setIdAnimal(id);
                a.setNome(nome);
                a.setEspecie(especie);
                a.setRaca(raca);
                a.setIdade(idade);
                a.setPeso(peso);
                a.setData_chegada(dataChegada);
                a.setData_saida(dataSaida);
                a.setObservacoes(observacoes);
                a.setIdDono(idDono);

                AnimalDAO dao = new AnimalDAO();
                boolean ok = dao.atualizar(a);

                if (ok) {
                    out.println("<p class='success'>Animal atualizado com sucesso!</p>");
                } else {
                    out.println("<p class='error'>Falha ao atualizar animal.</p>");
                }
            } catch (Exception e) {
                out.println("<p class='error'>Erro: " + e.getMessage() + "</p>");
            }
        %>

        <a href="../Lista/animal_lista.jsp">Voltar à lista</a>
    </div>
</body>
</html>

