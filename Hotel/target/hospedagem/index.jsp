<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Reservas - Sistema de Agendamento</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-gradient-to-br from-blue-50 to-indigo-100 min-h-screen">
    <div id="page1" class="page active">
        <div class="container mx-auto px-4 py-8">
            <header class="text-center mb-8">
                <h1 class="text-4xl font-bold text-gray-800 mb-2">🏨 Hotel Reservas</h1>
                <p class="text-gray-600">Selecione seu quarto ideal</p>
            </header>

            <div class="max-w-6xl mx-auto">
                <div class="bg-white rounded-lg shadow-lg p-6 mb-8">
                    <h2 class="text-2xl font-semibold text-gray-800 mb-4">Informações de Contato</h2>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Email</label>
                            <input type="email" id="email"
                                class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-2">Telefone</label>
                            <input type="tel" id="phone"
                                class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                        </div>
                    </div>
                </div>
                <form action="confirmacao" method="post">
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <!-- Quarto 1 -->
                    <div class="room-card bg-white rounded-lg shadow-lg overflow-hidden">
                        <div class="h-48 bg-gradient-to-r from-blue-400 to-blue-600 flex items-center justify-center">
                            <span class="text-6xl">🛏️</span>
                        </div>
                        <div class="p-6">
                            <h3 class="text-xl font-semibold text-gray-800 mb-2">Quarto Standard</h3>
                            <p class="text-gray-600 mb-4">Quarto confortável com cama de casal, ar-condicionado e Wi-Fi
                                gratuito.</p>
                            <div class="flex items-center justify-between mb-4">
                                <span class="text-2xl font-bold text-blue-600">R$ 150/noite</span>
                                <span class="text-sm text-gray-500">👥 2 pessoas</span>
                            </div>
                            <div class="flex items-center mb-4">
                                <input type="checkbox" id="room1" class="room-checkbox mr-2" data-room="Standard"
                                    data-price="150">
                                <label for="room1" class="text-sm text-gray-700">Selecionar este quarto</label>
                            </div>
                        </div>
                    </div>

                    <!-- Quarto 2 -->
                    <div class="room-card bg-white rounded-lg shadow-lg overflow-hidden">
                        <div
                            class="h-48 bg-gradient-to-r from-purple-400 to-purple-600 flex items-center justify-center">
                            <span class="text-6xl">🛏️</span>
                        </div>
                        <div class="p-6">
                            <h3 class="text-xl font-semibold text-gray-800 mb-2">Quarto Deluxe</h3>
                            <p class="text-gray-600 mb-4">Quarto espaçoso com vista para o mar, frigobar e varanda
                                privativa.</p>
                            <div class="flex items-center justify-between mb-4">
                                <span class="text-2xl font-bold text-purple-600">R$ 250/noite</span>
                                <span class="text-sm text-gray-500">👥 3 pessoas</span>
                            </div>
                            <div class="flex items-center mb-4">
                                <input type="checkbox" id="room2" class="room-checkbox mr-2" data-room="Deluxe"
                                    data-price="250">
                                <label for="room2" class="text-sm text-gray-700">Selecionar este quarto</label>
                            </div>
                        </div>
                    </div>

                    <!-- Suíte 3 -->
                    <div class="room-card bg-white rounded-lg shadow-lg overflow-hidden">
                        <div class="h-48 bg-gradient-to-r from-yellow-400 to-yellow-600 flex items-center justify-center">
                            <span class="text-6xl">🏰</span>
                        </div>
                        <div class="p-6">
                            <h3 class="text-xl font-semibold text-gray-800 mb-2">Suíte Premium</h3>
                            <p class="text-gray-600 mb-4">Suíte luxuosa com jacuzzi, sala de estar e serviço de quarto
                                24h.</p>
                            <div class="flex items-center justify-between mb-4">
                                <span class="text-2xl font-bold text-yellow-600">R$ 450/noite</span>
                                <span class="text-sm text-gray-500">👥 4 pessoas</span>
                            </div>
                            <div class="flex items-center mb-4">
                                <input type="checkbox" id="room3" class="room-checkbox mr-2" data-room="Premium"
                                    data-price="450">
                                <label for="room3" class="text-sm text-gray-700">Selecionar este quarto</label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="text-center mt-8">
                    <button id="continueBtn"
                        class="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 px-8 rounded-lg transition duration-300 disabled:bg-gray-400 disabled:cursor-not-allowed"
                        type="submit">
                        Confirmar Reserva ✓
                    </button>
                </div>
                </form>
            </div>
        </div>
    </div>

    <script src="js/script.js"></script>
</body>
</html>