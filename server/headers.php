<?php


// 1. Configuração de CORS (Obrigatório para o fetch funcionar do seu frontend)
// Permite qualquer origem (em produção, substitua pelo seu domínio)
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

// Configuração correta para API com UTF-8
// UTF-8 mantenha a escrita viasual de letras com acento, inpedindo transformar em caracters "avulso"
header("Content-Type: application/json; charset=utf-8");