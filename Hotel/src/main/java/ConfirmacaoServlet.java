
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/confirmacao")

public class ConfirmacaoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Receber dados do formulário
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String[] rooms = request.getParameterValues("room");

        // Guardar no request para o JSP
        request.setAttribute("email", email);
        request.setAttribute("phone", phone);
        request.setAttribute("rooms", rooms);

        // Encaminhar para o JSP
        request.getRequestDispatcher("/confirmacao.jsp").forward(request, response);
    }
}