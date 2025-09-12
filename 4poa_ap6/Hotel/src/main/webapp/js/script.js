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