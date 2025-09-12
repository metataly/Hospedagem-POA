<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String codigo = (String) request.getAttribute("codigoReserva");
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reserva Concluída</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-blue-50 to-indigo-100 min-h-screen flex items-center justify-center">
    <div class="bg-white rounded-lg p-8 shadow-lg max-w-md text-center">
        <div class="text-6xl mb-4">✅</div>
        <h2 class="text-2xl font-bold text-gray-800 mb-4">Reserva Confirmada!</h2>
        <p class="text-gray-600 mb-6">Sua reserva foi processada com sucesso. Você receberá um email em breve.</p>
        <div class="bg-gray-100 rounded-lg p-4 mb-6">
            <p class="text-sm text-gray-700"><strong>Código da Reserva:</strong></p>
            <p class="text-lg font-mono font-bold text-blue-600"><%= codigo %></p>
        </div>
        <a href="index.jsp"
            class="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-6 rounded-lg transition duration-300">
            Voltar à página inicial
        </a>
    </div>
</body>
</html>
