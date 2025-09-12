package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cliente;
import model.Reserva;
import service.ClienteService;
import service.ReservaService;
import util.GeradorCodigoReserva;

@WebServlet("/confirmarReserva")
public class ConfirmarReservaServlet extends HttpServlet {
	
    private final ClienteService clienteService = new ClienteService();
    private final ReservaService reservaService = new ReservaService();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Reserva reserva = (Reserva) session.getAttribute("reserva");

        if (reserva == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String nome = request.getParameter("fullName");
        String email = request.getParameter("email");
        String telefone = request.getParameter("phone");
        String cpf = request.getParameter("cpf");

        String servicos = String.join(",",
                request.getParameterValues("servicos") != null ? request.getParameterValues("servicos") : new String[]{});

        reserva.setServicosAdicionais(servicos);
        reserva.setTotal(reservaService.calcularTotal(reserva));

        Cliente cliente = new Cliente(nome, email, telefone, cpf);

        if (!clienteService.validarCliente(cliente)) {
            request.setAttribute("erro", "Dados inválidos. Verifique os campos.");
            request.getRequestDispatcher("confirmacao.jsp").forward(request, response);
            return;
        }

        // gera e salva o código da reserva
        String codigoReserva = GeradorCodigoReserva.gerarCodigo();
        reserva.setCodigo(codigoReserva);

        // mantém reserva e cliente na sessão
        session.setAttribute("reserva", reserva);
        session.setAttribute("cliente", cliente);

        // volta para a confirmação (lá o modal vai abrir automaticamente)
        response.sendRedirect("confirmacao.jsp?code=" + codigoReserva);
    }

}
