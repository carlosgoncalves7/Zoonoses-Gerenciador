<?php


// 1. Configuração de CORS (Obrigatório para o fetch funcionar do seu frontend)
// Permite qualquer origem (em produção, substitua pelo seu domínio)
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");