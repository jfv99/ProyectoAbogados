<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestionar Usuarios - Valbuena Abogados</title>
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

                <!-- Bot�n de cerrar sesi�n -->
                <div class="mt-3">
                    <a href="logout" class="btn btn-danger w-100"><i class="fas fa-sign-out-alt"></i> Cerrar Sesi�n</a>
                </div>
            </div>

            <!-- Contenido principal de gesti�n de usuarios -->
            <div class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
                <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                    <h1 class="h2">${usuario != null ? 'Editar Usuario' : 'Crear Usuario'}</h1>
                </div>

                <!-- Mensaje de error o �xito opcional -->
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger">${errorMessage}</div>
                </c:if>
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success">${successMessage}</div>
                </c:if>

                <!-- Formulario para crear o editar usuario -->
                <form action="gestionarUsuarios" method="post">
                    <!-- Oculto para enviar el ID en caso de editar -->
                    <c:if test="${usuario != null}">
                        <input type="hidden" name="id_usuario" value="${usuario.id}" />
                        <input type="hidden" name="action" value="editar" />
                    </c:if>
                    <c:if test="${usuario == null}">
                        <input type="hidden" name="action" value="crear" />
                    </c:if>

                    <!-- Campos del formulario -->
                    <div class="mb-3">
                        <label for="nombre_usuario" class="form-label">Nombre</label>
                        <input type="text" class="form-control" id="nombre_usuario" name="nombre_usuario" 
                               value="${usuario != null ? usuario.nombre : ''}" required>
                    </div>

                    <div class="mb-3">
                        <label for="correo" class="form-label">Correo Electr�nico</label>
                        <input type="email" class="form-control" id="correo" name="correo" 
                               value="${usuario != null ? usuario.correo : ''}" required>
                    </div>

                    <div class="mb-3">
                        <label for="contrase�a" class="form-label">Contrase�a</label>
                        <input type="password" class="form-control" id="contrase�a" name="contrase�a"
                               placeholder="${usuario != null ? 'Dejar vac�o para no cambiar' : 'Ingrese la contrase�a'}">
                    </div>

                    <div class="mb-3">
                        <label for="rol" class="form-label">Rol</label>
                        <select class="form-select" id="rol" name="rol" required>
                            <option value="administrador" ${usuario != null && usuario.rol == 'administrador' ? 'selected' : ''}>Administrador</option>
                            <option value="abogado" ${usuario != null && usuario.rol == 'abogado' ? 'selected' : ''}>Abogado</option>
                            <option value="usuario" ${usuario != null && usuario.rol == 'usuario' ? 'selected' : ''}>Usuario General</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="estado" class="form-label">Estado</label>
                        <select class="form-select" id="estado" name="estado" required>
                            <option value="true" ${usuario != null && usuario.activo ? 'selected' : ''}>Activo</option>
                            <option value="false" ${usuario != null && !usuario.activo ? 'selected' : ''}>Inactivo</option>
                        </select>
                    </div>

                    <!-- Botones de acci�n -->
                    <button type="submit" class="btn btn-primary">${usuario != null ? 'Actualizar' : 'Crear'}</button>
                    <a href="gestionarUsuarios?action=listar" class="btn btn-secondary">Regresar a la lista</a>
                    <a href="home.jsp" class="btn btn-secondary">Regresar al Inicio</a>
                    <!-- Bot�n para abrir el JSP de creaci�n de usuario -->
                    <a href="crearUsuario.jsp" class="btn btn-success ms-2">Crear Nuevo Usuario</a>
                </form>

                <!-- Tabla de usuarios (solo se muestra cuando se listan) -->
                <c:if test="${action == null || action == 'listar'}">
                    <h2 class="mt-5">Lista de Usuarios</h2>
                    <div class="table-responsive">
                        <table class="table table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nombre</th>
                                    <th>Correo</th>
                                    <th>Rol</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="usuario" items="${usuarios}">
                                    <tr>
                                        <td>${usuario.id}</td>
                                        <td>${usuario.nombre}</td>
                                        <td>${usuario.correo}</td>
                                        <td>${usuario.rol}</td>
                                        <td>${usuario.activo ? 'Activo' : 'Inactivo'}</td>
                                        <td>
                                            <a href="gestionarUsuarios?action=editar&id=${usuario.id}" class="btn btn-warning">Editar</a>
                                            <a href="gestionarUsuarios?action=eliminar&id=${usuario.id}" class="btn btn-danger">Eliminar</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:if>
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
