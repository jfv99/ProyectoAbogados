package abogados.proyectoabogados.controllers;

import abogados.proyectoabogados.models.Usuario;
import abogados.proyectoabogados.services.UsuarioService;
import abogados.proyectoabogados.utils.PasswordUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

@WebServlet("/gestionarUsuarios")
public class GestionarUsuariosServlet extends HttpServlet {
    private UsuarioService usuarioService = new UsuarioService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("listar".equals(action) || action == null) {
            // Obtener todos los usuarios
            List<Usuario> usuarios = usuarioService.obtenerTodosLosUsuarios();
            request.setAttribute("usuarios", usuarios);
        } else if ("editar".equals(action)) {
            // Obtener el usuario para editar
            int idUsuario = Integer.parseInt(request.getParameter("id"));
            Usuario usuario = usuarioService.obtenerUsuario(idUsuario);
            request.setAttribute("usuario", usuario);
        } else if ("eliminar".equals(action)) {
            // Eliminar un usuario
            int idUsuario = Integer.parseInt(request.getParameter("id"));
            usuarioService.eliminarUsuario(idUsuario);
        }

        // Redirigir siempre a gestionarUsuarios.jsp
        request.getRequestDispatcher("gestionarUsuarios.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("crear".equals(action)) {
            // Proceso para crear un usuario
            String nombre = request.getParameter("nombre_usuario");
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contraseña");
            String rol = request.getParameter("rol");
            boolean estado = Boolean.parseBoolean(request.getParameter("estado"));

            Usuario nuevoUsuario = new Usuario();
            nuevoUsuario.setNombre(nombre);
            nuevoUsuario.setCorreo(correo);

            try {
                // Encriptar la contraseña
                String hashedPassword = PasswordUtil.hashPassword(contrasena);
                nuevoUsuario.setContraseña(hashedPassword);
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
                response.sendRedirect("gestionarUsuarios?action=crear&error=hash");
                return;
            }

            nuevoUsuario.setRol(rol);
            nuevoUsuario.setActivo(estado);

            // Guardar el nuevo usuario
            if (usuarioService.existeCorreo(correo)) {
                request.setAttribute("errorMessage", "El correo ya está registrado.");
                request.getRequestDispatcher("crearUsuario.jsp").forward(request, response);
                return;
            }
            usuarioService.registrarUsuario(nuevoUsuario);
            response.sendRedirect("gestionarUsuarios?action=listar");

        } else if ("editar".equals(action)) {
            // Proceso para editar un usuario existente
            int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));
            String nombre = request.getParameter("nombre_usuario");
            String correo = request.getParameter("correo");
            String contraseña = request.getParameter("contraseña");
            String rol = request.getParameter("rol");
            boolean estado = Boolean.parseBoolean(request.getParameter("estado"));

            Usuario usuario = usuarioService.obtenerUsuario(idUsuario);
            usuario.setNombre(nombre);
            usuario.setCorreo(correo);
            usuario.setRol(rol);
            usuario.setActivo(estado);

            // Solo encriptar la contraseña si se ha proporcionado una nueva
            if (contraseña != null && !contraseña.isEmpty()) {
                try {
                    String hashedPassword = PasswordUtil.hashPassword(contraseña);
                    usuario.setContraseña(hashedPassword);
                } catch (NoSuchAlgorithmException e) {
                    response.sendRedirect("gestionarUsuarios?action=editar&id=" + idUsuario + "&error=hash");
                    return;
                }
            }

            if (usuarioService.existeCorreo(correo)) {
                request.setAttribute("errorMessage", "El correo ya está registrado.");
                request.getRequestDispatcher("crearUsuario.jsp").forward(request, response);
                return;
            }
            // Guardar los cambios del usuario
            usuarioService.actualizarUsuario(usuario);
            response.sendRedirect("gestionarUsuarios?action=listar");
        }
    }
}
