<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Historial - Valbuena Abogados</title>
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
                        <li class="nav-item">
                            <a class="nav-link" href="verHistorialCasos?action=listar">
                                <i class="fas fa-history"></i> Ver Historial de Casos
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
                <h1 class="mt-5">Crear Historial</h1>
                <form action="verHistorialCasos" method="post">
                    <input type="hidden" name="action" value="crear">

                    <div class="mb-3">
                        <label for="accion_realizada" class="form-label">Acci�n Realizada</label>
                        <input type="text" id="accion_realizada" name="accion_realizada" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label for="id_usuario" class="form-label">ID Usuario</label>
                        <input type="number" id="id_usuario" name="id_usuario" class="form-control" required>
                    </div>

                    <div class="mb-3">
                        <label for="id_caso" class="form-label">ID Caso</label>
                        <input type="number" id="id_caso" name="id_caso" class="form-control" required>
                    </div>

                    <div class="d-flex justify-content-between">
                        <button type="submit" class="btn btn-primary">Crear Historial</button>
                        <a href="verHistorialCasos?action=listar" class="btn btn-secondary">Regresar a la lista</a>
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
