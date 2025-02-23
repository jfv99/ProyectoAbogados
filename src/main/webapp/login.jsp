<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Valbuena Abogados</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome para los iconos -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Estilos personalizados -->
    <style>
        /* Centrar el formulario vertical y horizontalmente */
        body, html {
            height: 100%;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .login-card {
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .login-icon {
            font-size: 2rem;
            color: #007bff;
        }

        /* Ajustes para el logotipo en la parte superior */
        .login-logo img {
            display: block;
            margin: 0 auto;
            width: 150px;
            margin-bottom: 20px;
        }

        /* Estilos para el footer */
        footer {
            background-color: #343a40;
            color: white;
            padding: 10px 0;
            position: fixed;
            bottom: 0;
            width: 100%;
            text-align: center;
        }

        footer p {
            margin: 0;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="container login-container">
        <div class="col-md-4">
            <div class="card login-card">
                <!-- Logo de la empresa en la parte superior del formulario -->
                <div class="login-logo">
                    <img src="logo.png" alt="Logo Valbuena Abogados">
                </div>

                <div class="text-center">
                    <!-- Icono de usuario para el login -->
                    <i class="fas fa-user-circle login-icon"></i>
                    <h5 class="card-title mt-2">Iniciar Sesión</h5>
                </div>
                <form action="login" method="post">
                    <!-- Campo de correo electrónico con icono -->
                    <div class="mb-3 input-group">
                        <span class="input-group-text">
                            <i class="fas fa-envelope"></i>
                        </span>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Correo Electrónico" required>
                    </div>
                    
                    <!-- Campo de contraseña con icono -->
                    <div class="mb-3 input-group">
                        <span class="input-group-text">
                            <i class="fas fa-lock"></i>
                        </span>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" required>
                    </div>
                    
                    <!-- Botón de login -->
                    <button type="submit" class="btn btn-primary w-100">Ingresar</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer con estilo -->
    <footer>
        <p>&copy; <script>document.write(new Date().getFullYear());</script> Valbuena Abogados - Versión 1.0. Todos los derechos reservados.</p>
    </footer>

    <!-- Bootstrap JS y FontAwesome -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
