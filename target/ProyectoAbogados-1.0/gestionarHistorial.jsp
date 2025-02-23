<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestionar Historial - Valbuena Abogados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar con las opciones de menú -->
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

                    <!-- Botón de cerrar sesión -->
                    <div class="mt-3">
                        <a href="logout" class="btn btn-danger w-100">
                            <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                        </a>
                    </div>
                </div>
            </div>

            <!-- Contenido principal -->
            <div class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <h1 class="mt-5">Gestionar Historial</h1>

                <!-- Mensajes de error o éxito -->
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success">${successMessage}</div>
                </c:if>
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger">${errorMessage}</div>
                </c:if>

                <!-- Botón para crear un nuevo historial -->
                <a href="verHistorialCasos?action=crear" class="btn btn-success mb-3">Crear Nuevo Historial</a>

                <!-- Tabla de historiales -->
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID Historial</th>
                            <th>Acción Realizada</th>
                            <th>Fecha Acción</th>
                            <th>ID Usuario</th>
                            <th>ID Caso</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="historial" items="${historial}">
                            <tr>
                                <td>${historial.idHistorial}</td>
                                <td>${historial.accionRealizada}</td>
                                <td>${historial.fechaAccion}</td>
                                <td>${historial.idUsuario}</td>
                                <td>${historial.idCaso}</td>
                                <td>
                                    <a href="verHistorialCasos?action=editar&id=${historial.idHistorial}" class="btn btn-warning">Editar</a>
                                    <a href="verHistorialCasos?action=eliminar&id=${historial.idHistorial}" class="btn btn-danger">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <a href="home.jsp" class="btn btn-secondary">Regresar al Home</a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="mt-5 bg-light text-center text-lg-start">
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
            © 2024 Valbuena Abogados - Todos los derechos reservados. Versión 1.0
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
