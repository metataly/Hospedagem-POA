package model;

import java.time.LocalDate;

public class Reserva {
	
	private LocalDate checkIn;
    private LocalDate checkOut;
    private int hospedes;
    private String quarto;
    private String servicosAdicionais;
    private double total;
    private String codigo;
	
	public Reserva() {
	}

	public Reserva(LocalDate checkIn, LocalDate checkOut, int hospedes, String quarto, String servicosAdicionais,
			double total, String codigo) {
		super();
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.hospedes = hospedes;
		this.quarto = quarto;
		this.servicosAdicionais = servicosAdicionais;
		this.total = total;
		this.codigo = codigo;
	}

	public LocalDate getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(LocalDate checkIn) {
		this.checkIn = checkIn;
	}

	public LocalDate getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(LocalDate checkOut) {
		this.checkOut = checkOut;
	}

	public int getHospedes() {
		return hospedes;
	}

	public void setHospedes(int hospedes) {
		this.hospedes = hospedes;
	}

	public String getQuarto() {
		return quarto;
	}

	public void setQuarto(String quarto) {
		this.quarto = quarto;
	}

	public String getServicosAdicionais() {
		return servicosAdicionais;
	}

	public void setServicosAdicionais(String servicosAdicionais) {
		this.servicosAdicionais = servicosAdicionais;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}	

}
