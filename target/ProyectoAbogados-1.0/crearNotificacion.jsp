<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Notificaci�n - Valbuena Abogados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar con las opciones de men� -->
            <div class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse show" id="sidebarMenu">
                <div class="position-sticky">
                    <!-- Logotipo -->
                    <div class="text-center my-4">
                        <img src="logo.png" alt="Logo Valbuena Abogados" class="img-fluid" style="max-width: 150px;">
                    </div>

                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="home.jsp">
                                <i class="fas fa-home"></i> Home
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gestionarUsuarios?action=listar">
                                <i class="fas fa-users-cog"></i> Gestionar Usuarios
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gestionarCasos?action=listar">
                                <i class="fas fa-briefcase"></i> Gestionar Casos
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gestionarDocumentos?action=listar">
                                <i class="fas fa-file-alt"></i> Gestionar Documentos
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gestionarObservaciones?action=listar">
                                <i class="fas fa-comments"></i> Gestionar Observaciones
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="gestionarAlertas?action=listar">
                                <i class="fas fa-bell"></i> Gestionar Alertas y Notificaciones
                            </a>
                        </li>
                    </ul>

                    <!-- Bot�n de cerrar sesi�n -->
                    <div class="mt-3">
                        <a href="logout" class="btn btn-danger w-100">
                            <i class="fas fa-sign-out-alt"></i> Cerrar Sesi�n
                        </a>
                    </div>
                </div>
            </div>

            <!-- Contenido principal -->
            <div class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <h1 class="mt-5">Crear Notificaci�n</h1>
                <form action="gestionarAlertas" method="post">
                    <input type="hidden" name="action" value="crear">

                    <div class="mb-3">
                        <label for="mensaje" class="form-label">Mensaje</label>
                        <textarea id="mensaje" name="mensaje" class="form-control" rows="3" required></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="id_usuario" class="form-label">ID Usuario</label>
                        <input type="number" id="id_usuario" name="id_usuario" class="form-control" required>
                    </div>

                    <!-- Botones alineados correctamente -->
                    <div class="d-flex justify-content-end mt-4">
                        <a href="gestionarAlertas?action=listar" class="btn btn-secondary me-2">Regresar a la lista</a>
                        <button type="submit" class="btn btn-primary">Crear Notificaci�n</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="mt-5 bg-light text-center text-lg-start">
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
            � 2024 Valbuena Abogados - Todos los derechos reservados. Versi�n 1.0
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
