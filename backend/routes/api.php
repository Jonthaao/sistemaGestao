<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
*/

// Rotas públicas (sem autenticação)
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// Rota de health check
Route::get('/health', function () {
    return response()->json([
        'status' => 'ok',
        'message' => 'API está funcionando!',
        'timestamp' => now()->toDateTimeString()
    ]);
});

// Rotas protegidas (requerem autenticação)
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/me', [AuthController::class, 'me']);
    
    // Adicione aqui suas outras rotas protegidas
    // Exemplo:
    // Route::get('/users', [UserController::class, 'index']);
});