<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestionar Casos - Valbuena Abogados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Menú lateral -->
            <div class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse show" id="sidebarMenu">
                <div class="position-sticky">
                    <!-- Logotipo -->
                    <div class="text-center my-4">
                        <img src="logo.png" alt="Logo Valbuena Abogados" class="img-fluid" style="max-width: 150px;">
                    </div>

                    <!-- Menú lateral basado en el rol del Administrador -->
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="home.jsp">
                                <i class="fas fa-home"></i> Home
                            </a>
                        </li>

                        <!-- Opciones para el Administrador -->
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
                            <a class="nav-link" href="verProgresoCasos?action=listar">
                                <i class="fas fa-tasks"></i> Ver Progreso de Casos
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

                        <!-- Botón de cerrar sesión -->
                        <li class="nav-item mt-3">
                            <a href="logout" class="btn btn-danger w-100">
                                <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- Contenido principal -->
            <div class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <h1 class="mt-5">Gestionar Casos</h1>
                <a href="gestionarCasos?action=crear" class="btn btn-success mb-3">Crear Caso</a>
                <a href="home.jsp" class="btn btn-secondary mb-3">Regresar al Home</a>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tipo de Caso</th>
                            <th>Descripción</th>
                            <th>Cliente</th>
                            <th>Abogado</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="caso" items="${casos}">
                            <tr>
                                <td>${caso.idCaso}</td>
                                <td>${caso.tipoCaso}</td>
                                <td>${caso.descripcion}</td>
                                <td>${caso.idCliente}</td>
                                <td>${caso.idAbogado}</td>
                                <td>${caso.estadoCaso}</td>
                                <td>
                                    <a href="gestionarCasos?action=editar&id=${caso.idCaso}" class="btn btn-warning">Editar</a>
                                    <a href="gestionarCasos?action=eliminar&id=${caso.idCaso}" class="btn btn-danger">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer mt-auto py-3 bg-light">
        <div class="container text-center">
            <span class="text-muted">
                Valbuena Abogados © <c:out value="${pageContext.request.contextPath}"/> | App Version 1.0 | Todos los derechos reservados &copy; <c:out value="${pageContext['request'].getAttribute('currentYear')}"/>
            </span>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
