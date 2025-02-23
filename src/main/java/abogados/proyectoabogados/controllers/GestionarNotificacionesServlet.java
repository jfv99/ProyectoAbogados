package abogados.proyectoabogados.controllers;

import abogados.proyectoabogados.models.Notificacion;
import abogados.proyectoabogados.services.NotificacionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/gestionarAlertas")
public class GestionarNotificacionesServlet extends HttpServlet {

    private NotificacionService notificacionService = new NotificacionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "listar":
                    listarNotificaciones(request, response);
                    break;
                case "crear": // Aquí añadimos la lógica para crear
                    mostrarFormularioCreacion(request, response); // Método para mostrar el formulario de creación
                    break;
                case "editar":
                    mostrarFormularioEdicion(request, response);
                    break;
                case "eliminar":
                    eliminarNotificacion(request, response);
                    break;
                default:
                    listarNotificaciones(request, response);
            }
        } else {
            listarNotificaciones(request, response);
        }
    }

    private void listarNotificaciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Notificacion> notificaciones = notificacionService.obtenerTodasLasNotificaciones();
            request.setAttribute("notificaciones", notificaciones);
            request.getRequestDispatcher("gestionarNotificaciones.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace(); // Esto te ayudará a ver el error completo en la consola
            request.setAttribute("errorMessage", "Ha ocurrido un error al listar las notificaciones: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    // Método para mostrar el formulario de creación
    private void mostrarFormularioCreacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("crearNotificacion.jsp").forward(request, response);
    }

    private void mostrarFormularioEdicion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idNotificacion = Integer.parseInt(request.getParameter("id"));
        Notificacion notificacion = notificacionService.obtenerNotificacion(idNotificacion);
        request.setAttribute("notificacion", notificacion);
        request.getRequestDispatcher("editarNotificacion.jsp").forward(request, response);
    }

    private void eliminarNotificacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idNotificacion = Integer.parseInt(request.getParameter("id"));
        notificacionService.eliminarNotificacion(idNotificacion);
        response.sendRedirect("gestionarAlertas?action=listar");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("crear".equals(action)) {
            crearNotificacion(request, response);
        } else if ("editar".equals(action)) {
            actualizarNotificacion(request, response);
        }
    }

    private void crearNotificacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Notificacion notificacion = new Notificacion();
        notificacion.setMensaje(request.getParameter("mensaje"));
        notificacion.setIdUsuario(Integer.parseInt(request.getParameter("id_usuario")));
        notificacionService.crearNotificacion(notificacion);
        response.sendRedirect("gestionarAlertas?action=listar");
    }

    private void actualizarNotificacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idNotificacion = Integer.parseInt(request.getParameter("id_notificacion"));
        Notificacion notificacion = notificacionService.obtenerNotificacion(idNotificacion);
        notificacion.setMensaje(request.getParameter("mensaje"));
        notificacion.setIdUsuario(Integer.parseInt(request.getParameter("id_usuario")));
        notificacionService.actualizarNotificacion(notificacion);
        response.sendRedirect("gestionarAlertas?action=listar");
    }
}
