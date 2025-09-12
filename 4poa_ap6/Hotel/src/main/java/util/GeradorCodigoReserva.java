package util;

import java.util.UUID;

public class GeradorCodigoReserva {
	
	public static String gerarCodigo() {
        return "HTL-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }

}
