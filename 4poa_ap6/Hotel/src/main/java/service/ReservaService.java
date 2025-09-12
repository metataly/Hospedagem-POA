package service;

import java.time.temporal.ChronoUnit;

import model.Reserva;

public class ReservaService {
	
	public double calcularTotal(Reserva reserva) {
        long noites = ChronoUnit.DAYS.between(reserva.getCheckIn(), reserva.getCheckOut());
        if (noites <= 0) noites = 1;

        double precoBase = 0;
        switch (reserva.getQuarto()) {
            case "Standard": precoBase = 150; break;
            case "Deluxe": precoBase = 250; break;
            case "Premium": precoBase = 450; break;
        }

        double total = precoBase * noites;

        if (reserva.getServicosAdicionais() != null) {
            if (reserva.getServicosAdicionais().contains("breakfast")) total += 25 * noites;
            if (reserva.getServicosAdicionais().contains("parking")) total += 15 * noites;
            if (reserva.getServicosAdicionais().contains("spa")) total += 50 * noites;
        }

        return total;
    }

}
