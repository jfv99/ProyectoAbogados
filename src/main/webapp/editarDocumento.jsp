<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Documento - Valbuena Abogados</title>
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
                    </ul>
                </div>

                <!-- Bot�n de cerrar sesi�n -->
                <div class="mt-3">
                    <a href="logout" class="btn btn-danger w-100">
                        <i class="fas fa-sign-out-alt"></i> Cerrar Sesi�n
                    </a>
                </div>
            </div>

            <!-- Contenido principal para editar documento -->
            <div class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <h1 class="mt-5">Editar Documento</h1>

                <!-- Formulario para editar el documento -->
                <form action="gestionarDocumentos" method="post">
                    <input type="hidden" name="action" value="editar">
                    <input type="hidden" name="id_documento" value="${documento.idDocumento}">

                    <div class="mb-3">
                        <label for="nombre_documento" class="form-label">Nombre del Documento</label>
                        <input type="text" id="nombre_documento" name="nombre_documento" class="form-control" value="${documento.nombreDocumento}" required>
                    </div>

                    <div class="mb-3">
                        <label for="tipo_documento" class="form-label">Tipo de Documento</label>
                        <select id="tipo_documento" name="tipo_documento" class="form-control" required>
                            <option value="demanda" <c:if test="${documento.tipoDocumento == 'demanda'}">selected</c:if>>Demanda</option>
                            <option value="escrito" <c:if test="${documento.tipoDocumento == 'escrito'}">selected</c:if>>Escrito</option>
                            <option value="prueba" <c:if test="${documento.tipoDocumento == 'prueba'}">selected</c:if>>Prueba</option>
                            <option value="sentencia" <c:if test="${documento.tipoDocumento == 'sentencia'}">selected</c:if>>Sentencia</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="id_caso" class="form-label">ID Caso</label>
                        <input type="number" id="id_caso" name="id_caso" class="form-control" value="${documento.idCaso}" required>
                    </div>

                    <div class="mb-3">
                        <label for="version" class="form-label">Versi�n del Documento</label>
                        <input type="text" id="version" name="version" class="form-control" value="${documento.version}" required>
                    </div>

                    <div class="mb-3">
                        <label for="ruta_archivo" class="form-label">Ruta del Archivo</label>
                        <input type="text" id="ruta_archivo" name="ruta_archivo" class="form-control" value="${documento.rutaArchivo}" required>
                    </div>

                    <!-- Botones de acci�n -->
                    <div class="d-flex justify-content-start">
                        <button type="submit" class="btn btn-primary me-2">Actualizar Documento</button>
                        <a href="gestionarDocumentos?action=listar" class="btn btn-secondary">Regresar a la lista</a>
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
