package SalvarImagem;

import Con_DB.Conn_DB;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.Animal;
import modelo.DAO.AnimalDAO;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;

@WebServlet(urlPatterns = {"/SalvarImagemPet"})
@MultipartConfig(maxFileSize = 16177215) //15.4MB

public class SalvarImagemPet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idAnimal = Integer.parseInt(request.getParameter("idAnimal"));

        try (Connection con = Conn_DB.conectar()) {

            // ⚠️ CORRIGIDO: era "dono", tem que ser "animal"
            PreparedStatement stmt = con.prepareStatement(
                "SELECT imagem_pet FROM animal WHERE idAnimal = ?"
            );

            stmt.setInt(1, idAnimal);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                // ⚠️ CORRIGIDO: era "imagem_animal", tem que ser "imagem_pet"
                byte[] imgBytes = rs.getBytes("imagem_pet");

                if (imgBytes != null) {

                    response.setContentType("image/jpeg");
                    response.setContentLength(imgBytes.length);

                    OutputStream out = response.getOutputStream();
                    out.write(imgBytes);
                    out.flush();
                    return;
                }
            }

            response.sendError(HttpServletResponse.SC_NOT_FOUND);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Animal a = new Animal();
            a.setNome(request.getParameter("nome"));
            a.setEspecie(request.getParameter("especie"));
            a.setRaca(request.getParameter("raca"));
            a.setIdade(Integer.parseInt(request.getParameter("idade")));
            a.setPeso(Double.parseDouble(request.getParameter("peso")));
            a.setObservacoes(request.getParameter("observacoes"));
            a.setIdDono(Integer.parseInt(request.getParameter("idDono")));

            a.setData_chegada(java.sql.Date.valueOf(request.getParameter("data_chegada")));

            String dataSaidaStr = request.getParameter("data_saida");
            if (dataSaidaStr != null && !dataSaidaStr.isEmpty()) {
                a.setData_saida(java.sql.Date.valueOf(dataSaidaStr));
            } else {
                a.setData_saida(null);
            }

            // Processar imagem
            Part filePart = request.getPart("imagem_pet");
            if (filePart != null && filePart.getSize() > 0) {
                InputStream inputStream = filePart.getInputStream();
                a.setImagem_pet(inputStream.readAllBytes());
            }

            AnimalDAO dao = new AnimalDAO();
            dao.inserir(a);

            // ⚠️ REDIRECIONAMENTO CORRIGIDO
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset='UTF-8'>");
            out.println("<title>Sucesso</title>");
            out.println("<style>");
            out.println("body { font-family: Arial; background: #FFF5E9; display: flex; justify-content: center; align-items: center; height: 100vh; }");
            out.println(".container { background: white; padding: 40px; border-radius: 14px; box-shadow: 0 4px 12px rgba(0,0,0,0.15); text-align: center; }");
            out.println("h2 { color: #6B3F2A; }");
            out.println("a { color: #F2A344; font-weight: bold; text-decoration: none; margin: 10px; display: inline-block; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='container'>");
            out.println("<h2>✅ Animal cadastrado com sucesso!</h2>");
            out.println("<a href='Animal/Cadastra/animal_cadastra.jsp'>Cadastrar outro</a>");
            out.println("<a href='Animal/Lista/animal_lista.jsp'>Ver lista</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<meta charset='UTF-8'>");
            out.println("<title>Erro</title>");
            out.println("<style>");
            out.println("body { font-family: Arial; background: #FFF5E9; display: flex; justify-content: center; align-items: center; height: 100vh; }");
            out.println(".container { background: white; padding: 40px; border-radius: 14px; box-shadow: 0 4px 12px rgba(0,0,0,0.15); text-align: center; }");
            out.println("h2 { color: #6B3F2A; }");
            out.println("a { color: #F2A344; font-weight: bold; text-decoration: none; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='container'>");
            out.println("<h2>❌ Erro ao cadastrar animal</h2>");
            out.println("<p>" + e.getMessage() + "</p>");
            out.println("<a href='Animal/Cadastra/animal_cadastra.jsp'>Voltar</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para salvar animal com imagem";
    }
}