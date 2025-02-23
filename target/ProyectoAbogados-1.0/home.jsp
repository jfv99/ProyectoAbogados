<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Valbuena Abogados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse show" id="sidebarMenu">
                <div class="position-sticky">
                    <!-- Logotipo -->
                    <div class="text-center my-4">
                        <img src="logo.png" alt="Logo Valbuena Abogados" class="img-fluid" style="max-width: 150px;">
                    </div>

                    <!-- Menú lateral basado en el rol del usuario -->
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link active" href="home.jsp">
                                <i class="fas fa-home"></i> Home
                            </a>
                        </li>

                        <!-- Opciones del Administrador -->
                        <c:if test="${usuario.rol == 'administrador'}">
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
                                <a class="nav-link" href="verProgresoCasos.jsp">
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
                        </c:if>

                        <!-- Opciones del Abogado -->
                        <c:if test="${usuario.rol == 'abogado'}">
                            <li class="nav-item">
                                <a class="nav-link" href="verProgresoCasos.jsp">
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
                        </c:if>

                        <!-- Opciones del Usuario General -->
                        <c:if test="${usuario.rol == 'usuario'}">
                            <li class="nav-item">
                                <a class="nav-link" href="verHistorialCasos?action=listar">
                                    <i class="fas fa-history"></i> Ver Historial de Casos
                                </a>
                            </li>
                        </c:if>
                    </ul>

                    <!-- Botón de cerrar sesión -->
                    <div class="mt-3">
                        <a href="logout" class="btn btn-danger w-100"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
                    </div>
                </div>
            </div>

            <!-- Contenido principal -->
            <div class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">Bienvenido, ${usuario.nombre}</h1>
                </div>

                <!-- Tarjetas de acceso rápido a funcionalidades según el rol -->
                <div class="row">
                    <!-- Opciones del Administrador -->
                    <c:if test="${usuario.rol == 'administrador'}">
                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title"><i class="fas fa-users-cog"></i> Gestionar Usuarios</h5>
                                    <p class="card-text">Crea, asigna y actualiza usuarios y sus roles.</p>
                                    <a href="gestionarUsuarios?action=listar" class="btn btn-primary">Ir</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title"><i class="fas fa-briefcase"></i> Gestionar Casos</h5>
                                    <p class="card-text">Administra todos los casos legales y asigna abogados.</p>
                                    <a href="gestionarCasos?action=listar" class="btn btn-primary">Ir</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title"><i class="fas fa-file-alt"></i> Gestionar Documentos</h5>
                                    <p class="card-text">Administra y sube documentos relevantes.</p>
                                    <a href="gestionarDocumentos?action=listar" class="btn btn-primary">Ir</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title"><i class="fas fa-tasks"></i> Ver Progreso de Casos</h5>
                                    <p class="card-text">Consulta el progreso de los casos.</p>
                                    <a href="verProgresoCasos.jsp" class="btn btn-primary">Ir</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title"><i class="fas fa-comments"></i> Gestionar Observaciones</h5>
                                    <p class="card-text">Añade y gestiona observaciones en los casos.</p>
                                    <a href="gestionarObservaciones?action=listar" class="btn btn-primary">Ir</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title"><i class="fas fa-bell"></i> Gestionar Alertas</h5>
                                    <p class="card-text">Crea alertas y notificaciones sobre fechas clave.</p>
                                    <a href="gestionarAlertas?action=listar" class="btn btn-primary">Ir</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title"><i class="fas fa-history"></i> Ver Historial de Casos</h5>
                                    <p class="card-text">Consulta el historial de casos.</p>
                                    <a href="verHistorialCasos?action=listar" class="btn btn-primary">Ir</a>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <!-- Opciones del Abogado -->
                    <c:if test="${usuario.rol == 'abogado'}">
                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title"><i class="fas fa-tasks"></i> Ver Progreso de Casos</h5>
                                    <p class="card-text">Consulta el progreso de los casos.</p>
                                    <a href="verProgresoCasos.jsp" class="btn btn-primary">Ir</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title"><i class="fas fa-comments"></i> Gestionar Observaciones</h5>
                                    <p class="card-text">Añade y gestiona observaciones en los casos.</p>
                                    <a href="gestionarObservaciones?action=listar" class="btn btn-primary">Ir</a>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title"><i class="fas fa-bell"></i> Gestionar Alertas</h5>
                                    <p class="card-text">Crea alertas y notificaciones sobre fechas clave.</p>
                                    <a href="gestionarAlertas?action=listar" class="btn btn-primary">Ir</a>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <!-- Opciones del Usuario General -->
                    <c:if test="${usuario.rol == 'usuario_general'}">
                        <div class="col-md-4">
                            <div class="card mb-4 shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title"><i class="fas fa-history"></i> Ver Historial de Casos</h5>
                                    <p class="card-text">Consulta el historial de casos.</p>
                                    <a href="verHistorialCasos?action=listar" class="btn btn-primary">Ir</a>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>

                <!-- Footer -->
                <footer class="footer mt-auto py-3 bg-light">
                    <div class="container">
                        <span class="text-muted">&copy; 2024 Valbuena Abogados. Todos los derechos reservados. Versión 1.0</span>
                    </div>
                </footer>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
