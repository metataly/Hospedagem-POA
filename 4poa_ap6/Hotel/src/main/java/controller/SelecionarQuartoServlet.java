package controller;

import java.io.IOException;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Reserva;
import service.ReservaService;

@WebServlet("/selecionarQuarto")
public class SelecionarQuartoServlet extends HttpServlet {
	
	private final ReservaService reservaService = new ReservaService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        LocalDate checkIn = LocalDate.parse(request.getParameter("checkin"));
        LocalDate checkOut = LocalDate.parse(request.getParameter("checkout"));
        int hospedes = Integer.parseInt(request.getParameter("guests"));
        String quarto = request.getParameter("quarto");

        Reserva reserva = new Reserva();
        reserva.setCheckIn(checkIn);
        reserva.setCheckOut(checkOut);
        reserva.setHospedes(hospedes);
        reserva.setQuarto(quarto);

        double total = reservaService.calcularTotal(reserva);
        reserva.setTotal(total);

        HttpSession session = request.getSession();
        session.setAttribute("reserva", reserva);

        response.sendRedirect("confirmacao.jsp");
    }

}
