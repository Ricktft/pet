<%-- 
    Document   : animal_deleta
    Created on : 23 de out. de 2025, 02:38:26
    Author     : Henrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Excluir Animal</title>
        <style>

body {
    font-family: Arial, sans-serif;
    background-color: #FFF5E9;
    margin: 0;
    padding: 20px;
    color: #6B3F2A;
}

.resultado-container {
    max-width: 640px;
    margin: 40px auto;
    background: #F5E6D3;
    padding: 26px;
    border-radius: 12px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    text-align: center;
}

.logo img {
    width: 120px;
    margin-bottom: 12px;
    border-radius: 8px;
}

.mensagem-box {
    margin: 12px 0 18px 0;
}

/* mensagens */
.msg-sucesso {
    color: #1f7a2e;            /* verde para sucesso (visível sobre o card) */
    background: rgba(31,122,46,0.06);
    padding: 12px;
    border-radius: 8px;
    display: inline-block;
}

.msg-erro {
    color: #9b2b2b;            /* vermelho suave */
    background: rgba(155,43,43,0.06);
    padding: 12px;
    border-radius: 8px;
    display: inline-block;
}

/* botão voltar */
.btn-voltar {
    display: inline-block;
    margin-top: 10px;
    padding: 12px 20px;
    background-color: #F2A344;   /* laranja */
    color: #fff;
    text-decoration: none;
    border-radius: 8px;
    font-weight: bold;
    transition: background-color .18s ease, transform .12s ease;
    box-shadow: 0 3px 8px rgba(0,0,0,0.08);
}

.btn-voltar:hover {
    background-color: #d9872e;   /* laranja hover */
    transform: translateY(-2px);
}

/* responsividade pequena */
@media (max-width: 480px) {
    .resultado-container { padding: 18px; margin: 20px; }
    .logo img { width: 100px; }
    .btn-voltar { width: 100%; box-sizing: border-box; }
}
</style>

    </head>
<body>

<div class="resultado-container">
    <div class="logo">
        <img src="../imagens/site.jpg" alt="Logo">
    </div>

    <div class="mensagem-box">
        <%
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.isEmpty()) {
                out.println("<h3 class='msg-erro'>Nenhum animal selecionado para exclusão.</h3>");
                out.println("<a class='btn-voltar' href='../Lista/animal_lista.jsp'>Voltar à lista</a>");
                return;
            }

            int idAnimal = Integer.parseInt(idParam);
            String url = "jdbc:mysql://localhost:3306/pet";
            String user = "root";
            String pass = "";

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                java.sql.Connection conn = java.sql.DriverManager.getConnection(url, user, pass);

                String sql = "DELETE FROM animal WHERE idAnimal = ?";
                java.sql.PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, idAnimal);
                int rows = ps.executeUpdate();

                ps.close();
                conn.close();

                if (rows > 0) {
                    out.println("<h3 class='msg-sucesso'>🐾 Animal excluído com sucesso!</h3>");
                } else {
                    out.println("<h3 class='msg-erro'>Nenhum animal encontrado com esse ID.</h3>");
                }

            } catch (Exception e) {
                out.println("<h3 class='msg-erro'>Erro ao excluir: " + e.getMessage() + "</h3>");
            }
        %>
    </div>

    <a class="btn-voltar" href="../Lista/animal_lista.jsp">Voltar à lista</a>
</div>

</body>

</html>

