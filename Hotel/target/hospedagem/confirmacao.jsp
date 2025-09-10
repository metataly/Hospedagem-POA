<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	    <div id="page2" class="page active">
			<div id="confirmationModal"
				class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
				<div class="bg-white rounded-lg p-8 max-w-md mx-4">
					<div class="text-center">
						<div class="text-6xl mb-4">✅</div>
						<h2 class="text-2xl font-bold text-gray-800 mb-4">Reserva Processada!</h2>
						<p class="text-gray-600 mb-6">Sua reserva foi processada com sucesso. Você receberá um email de
							confirmação e pagamento em breve.</p>
						<div class="bg-gray-100 rounded-lg p-4 mb-6">
							<p class="text-sm text-gray-700"><strong>Código da Reserva: KT8391</strong></p>
							<p class="text-lg font-mono font-bold text-blue-600"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
	</html>