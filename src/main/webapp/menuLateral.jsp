<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <!-- Agregar más opciones del administrador si es necesario -->
            </c:if>

            <!-- Opciones del Abogado -->
            <c:if test="${usuario.rol == 'abogado'}">
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
            </c:if>

            <!-- Opciones del Usuario General -->
            <c:if test="${usuario.rol == 'usuario_general'}">
                <li class="nav-item">
                    <a class="nav-link" href="verHistorialCasos?action=listar">
                        <i class="fas fa-history"></i> Ver Historial de Casos
                    </a>
                </li>
            </c:if>
        </ul>

        <!-- Botón de cerrar sesión -->
        <div class="mt-3">
            <a href="logout.jsp" class="btn btn-danger w-100"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
        </div>
    </div>
</div>
