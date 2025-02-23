<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Progreso de Caso - Valbuena Abogados</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.css">

    <!-- DataTables JS -->
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.js"></script>

    <script>
        $(document).ready(function() {
            $('#tablaProgreso').DataTable();  // Inicializa DataTable
        });
    </script>
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
                    </ul>
                </div>

                <!-- Botón de cerrar sesión -->
                <div class="mt-3">
                    <a href="logout" class="btn btn-danger w-100">
                        <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                    </a>
                </div>
            </div>

            <!-- Contenido principal -->
            <div class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <h1 class="mt-5">Progreso del Caso</h1>

                <!-- Tabla con DataTables -->
                <table id="tablaProgreso" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID Progreso</th>
                            <th>Estado</th>
                            <th>Fecha de Actualización</th>
                            <th>Observaciones</th>
                            <th>Responsable</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="progreso" items="${progresos}">
                            <tr>
                                <td>${progreso.idProgreso}</td>
                                <td>${progreso.estado}</td>
                                <td>${progreso.fechaActualizacion}</td>
                                <td>${progreso.observaciones}</td>
                                <td>${progreso.responsable}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <a href="gestionarCasos?action=listar" class="btn btn-secondary mt-3">Regresar a la Lista de Casos</a>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="mt-5 bg-light text-center text-lg-start">
        <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
            © 2024 Valbuena Abogados - Todos los derechos reservados. Versión 1.0
        </div>
    </footer>

    <!-- Scripts de Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
