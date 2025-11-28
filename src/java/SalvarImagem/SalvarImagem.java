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
import modelo.Dono;
import modelo.DAO.DonoDAO;
import java.sql.*;
import javax.servlet.annotation.MultipartConfig;

@WebServlet(urlPatterns = {"/SalvarImagem"})
@MultipartConfig(maxFileSize = 16177215) //15.4MB

public class SalvarImagem extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idDono = Integer.parseInt(request.getParameter("idDono"));

        try (Connection con = Conn_DB.conectar()) {

            PreparedStatement stmt = con.prepareStatement(
                "SELECT imagem_dono FROM dono WHERE idDono = ?"
            );

            stmt.setInt(1, idDono);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {

                byte[] imgBytes = rs.getBytes("imagem_dono");

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
            Dono d = new Dono();
            d.setNome(request.getParameter("nome"));
            d.setCpf(request.getParameter("cpf"));
            d.setTelefone(request.getParameter("telefone"));
            d.setEmail(request.getParameter("email"));

            Part filePart = request.getPart("imagem_dono");
            if (filePart != null && filePart.getSize() > 0) {
                InputStream inputStream = filePart.getInputStream();
                d.setImagem_dono(inputStream.readAllBytes());
            }

            DonoDAO dao = new DonoDAO();
            dao.inserir(d);

            // ✅ PÁGINA DE SUCESSO INLINE (sem forward que causa duplicação)
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
            out.println("a:hover { color: #6B3F2A; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='container'>");
            out.println("<h2>✅ Dono cadastrado com sucesso!</h2>");
            out.println("<a href='Dono/Cadastro/dono_cadastra.jsp'>Cadastrar outro</a>");
            out.println("<a href='Dono/Lista/dono_lista.jsp'>Ver lista de donos</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {
            // ✅ PÁGINA DE ERRO INLINE
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
            out.println("p { color: #666; }");
            out.println("a { color: #F2A344; font-weight: bold; text-decoration: none; }");
            out.println("a:hover { color: #6B3F2A; }");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class='container'>");
            out.println("<h2>❌ Erro ao cadastrar dono</h2>");
            out.println("<p>" + e.getMessage() + "</p>");
            out.println("<a href='Dono/Cadastro/dono_cadastra.jsp'>Voltar ao cadastro</a><br><br>");
            out.println("<a href='Dono/Lista/dono_lista.jsp'>Ver lista de donos</a>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para salvar dono com imagem";
    }
}