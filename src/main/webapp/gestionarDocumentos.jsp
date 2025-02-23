<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestionar Documentos - Valbuena Abogados</title>
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
                    </ul>
                </div>

                <!-- Botón de cerrar sesión -->
                <div class="mt-3">
                    <a href="logout" class="btn btn-danger w-100">
                        <i class="fas fa-sign-out-alt"></i> Cerrar Sesión
                    </a>
                </div>
            </div>

            <!-- Contenido principal para gestionar documentos -->
            <div class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <h1 class="mt-5">Gestionar Documentos</h1>
                <a href="gestionarDocumentos?action=crear" class="btn btn-success mb-3">Crear Documento</a>
                <a href="home.jsp" class="btn btn-secondary mb-3">Regresar al Home</a>

                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre del Documento</th>
                            <th>Tipo</th>
                            <th>ID Caso</th>
                            <th>Versión</th>
                            <th>Ruta del Archivo</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="documento" items="${documentos}">
                            <tr>
                                <td>${documento.idDocumento}</td>
                                <td>${documento.nombreDocumento}</td>
                                <td>${documento.tipoDocumento}</td>
                                <td>${documento.idCaso}</td>
                                <td>${documento.version}</td>
                                <td>${documento.rutaArchivo}</td>
                                <td>
                                    <a href="gestionarDocumentos?action=editar&id=${documento.idDocumento}" class="btn btn-warning">Editar</a>
                                    <a href="gestionarDocumentos?action=eliminar&id=${documento.idDocumento}" class="btn btn-danger">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
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
