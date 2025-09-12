<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Reserva, java.time.temporal.ChronoUnit" %>
<%
    // Obter a reserva da sessão
    Reserva reserva = (Reserva) session.getAttribute("reserva");
    long noites = 0;
    double total = 0;
    String quarto = "";
    int hospedes = 0;
    String checkIn = "";
    String checkOut = "";
    String servicosAdicionais = "";

    if (reserva != null) {
        noites = ChronoUnit.DAYS.between(reserva.getCheckIn(), reserva.getCheckOut());
        total = reserva.getTotal();
        quarto = reserva.getQuarto();
        hospedes = reserva.getHospedes();
        checkIn = reserva.getCheckIn().toString();
        checkOut = reserva.getCheckOut().toString();
        servicosAdicionais = reserva.getServicosAdicionais() != null ? reserva.getServicosAdicionais() : "";
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmação de Reserva - Hotel Reservas</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-gradient-to-br from-blue-50 to-indigo-100 min-h-screen">
    <!-- Página 2: Confirmação e Dados -->
    <div id="page2" class="page active">
        <div class="container mx-auto px-4 py-8">
            <header class="text-center mb-8">
                <h1 class="text-4xl font-bold text-gray-800 mb-2">🏨 Finalizar Reserva</h1>
                <p class="text-gray-600">Complete seus dados para confirmar</p>
            </header>

            <div class="max-w-4xl mx-auto">
                <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                    <!-- Resumo da Reserva -->
                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <h2 class="text-2xl font-semibold text-gray-800 mb-4">📋 Resumo da Reserva</h2>
                        <div id="reservationSummary" class="space-y-4">
                            <!-- Conteúdo preenchido com dados da sessão -->
                            <div class="flex justify-between">
                                <span class="text-gray-600">Check-in:</span>
                                <span class="font-medium"><%= checkIn %></span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-gray-600">Check-out:</span>
                                <span class="font-medium"><%= checkOut %></span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-gray-600">Noites:</span>
                                <span class="font-medium"><%= noites %></span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-gray-600">Quarto:</span>
                                <span class="font-medium"><%= quarto %></span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-gray-600">Hóspedes:</span>
                                <span class="font-medium"><%= hospedes %></span>
                            </div>
                            <% if (servicosAdicionais != null && !servicosAdicionais.isEmpty()) { %>
                            <div class="flex justify-between">
                                <span class="text-gray-600">Serviços Adicionais:</span>
                                <span class="font-medium"><%= servicosAdicionais %></span>
                            </div>
                            <% } %>
                        </div>
                        <div class="border-t pt-4 mt-4">
                            <div class="flex justify-between items-center text-xl font-bold text-gray-800">
                                <span>Total:</span>
                                <span id="totalPrice">R$ <%= total %></span>
                            </div>
                        </div>
                    </div>

                    <!-- Formulário de Dados -->
                    <div class="bg-white rounded-lg shadow-lg p-6">
                        <h2 class="text-2xl font-semibold text-gray-800 mb-4">👤 Dados do Hóspede</h2>
                        <!-- FORMULÁRIO MODIFICADO: action e method adicionados -->
                        <form id="reservationForm" action="confirmarReserva" method="POST" class="space-y-4">
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Nome Completo</label>
                                <!-- name="fullName" adicionado -->
                                <input type="text" id="fullName" name="fullName" required
                                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Email</label>
                                <!-- name="email" adicionado -->
                                <input type="email" id="email" name="email" required
                                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Telefone</label>
                                <!-- name="phone" adicionado -->
                                <input type="tel" id="phone" name="phone" required
                                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">CPF</label>
                                <!-- name="cpf" adicionado -->
                                <input type="text" id="cpf" name="cpf" required
                                    class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                            </div>

                            <div class="space-y-3">
                                <h3 class="text-lg font-medium text-gray-800">Serviços Adicionais</h3>
                                <div class="flex items-center">
                                    <!-- name="servicos" e value adicionados -->
                                    <input type="checkbox" id="breakfast" name="servicos" value="Café da manhã" class="mr-2">
                                    <label for="breakfast" class="text-sm text-gray-700">Café da manhã (+R$
                                        25/dia)</label>
                                </div>
                                <div class="flex items-center">
                                    <!-- name="servicos" e value adicionados -->
                                    <input type="checkbox" id="parking" name="servicos" value="Estacionamento" class="mr-2">
                                    <label for="parking" class="text-sm text-gray-700">Estacionamento (+R$
                                        15/dia)</label>
                                </div>
                                <div class="flex items-center">
                                    <!-- name="servicos" e value adicionados -->
                                    <input type="checkbox" id="spa" name="servicos" value="SPA" class="mr-2">
                                    <label for="spa" class="text-sm text-gray-700">Acesso ao SPA (+R$ 50/dia)</label>
                                </div>
                            </div>

                            <div class="flex space-x-4 pt-4">
                                <button type="button" id="backBtn"
                                    class="flex-1 bg-gray-500 hover:bg-gray-600 text-white font-semibold py-3 px-6 rounded-lg transition duration-300">
                                    ← Voltar
                                </button>
                                <!-- type="submit" adicionado -->
                                <button type="submit"
                                    class="flex-1 bg-green-600 hover:bg-green-700 text-white font-semibold py-3 px-6 rounded-lg transition duration-300">
                                    Confirmar Reserva ✓
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal de Confirmação -->
    <div id="confirmationModal"
        class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 hidden">
        <div class="bg-white rounded-lg p-8 max-w-md mx-4">
            <div class="text-center">
                <div class="text-6xl mb-4">✅</div>
                <h2 class="text-2xl font-bold text-gray-800 mb-4">Reserva Confirmada!</h2>
                <p class="text-gray-600 mb-6">Sua reserva foi processada com sucesso. Você receberá um email de
                    confirmação em breve.</p>
                <div class="bg-gray-100 rounded-lg p-4 mb-6">
                    <p class="text-sm text-gray-700"><strong>Código da Reserva:</strong></p>
                    <p class="text-lg font-mono font-bold text-blue-600" id="reservationCode">
                        <%= request.getParameter("code") != null ? request.getParameter("code") : "" %>
                    </p>
                </div>
                <button id="closeModal"
                    class="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-6 rounded-lg transition duration-300">
                    Fechar
                </button>
            </div>
        </div>
    </div>

    <script>
 		// Script para controlar a exibição do modal
    	document.addEventListener('DOMContentLoaded', function() {
        // Verifica se há um código de reserva na URL (após confirmação)
        const urlParams = new URLSearchParams(window.location.search);
        const reservationCode = urlParams.get('code');
        
        if (reservationCode) {
            // Exibe o modal com o código da reserva
            document.getElementById('confirmationModal').classList.remove('hidden');
        }
        
        // Fecha o modal quando o botão é clicado
        document.getElementById('closeModal').addEventListener('click', function() {
            document.getElementById('confirmationModal').classList.add('hidden');
        });
        
        // Voltar para a página anterior
        document.getElementById('backBtn').addEventListener('click', function() {
            window.history.back();
        });
    });
    </script>
</body>
</html>