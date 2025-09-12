package service;

import model.Cliente;

public class ClienteService {
	
	public boolean validarCliente(Cliente cliente) {
        return cliente.getNome() != null && !cliente.getNome().isEmpty()
            && cliente.getEmail() != null && cliente.getEmail().contains("@")
            && cliente.getCpf() != null && cliente.getCpf().length() == 11;
    }

}
