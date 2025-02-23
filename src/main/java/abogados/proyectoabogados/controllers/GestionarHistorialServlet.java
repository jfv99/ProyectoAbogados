package abogados.proyectoabogados.controllers;

import abogados.proyectoabogados.models.Historial;
import abogados.proyectoabogados.services.HistorialService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/verHistorialCasos")
public class GestionarHistorialServlet extends HttpServlet {

    private HistorialService historialService = new HistorialService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "listar":
                    listarHistorial(request, response);
                    break;
                case "editar":
                    mostrarFormularioEdicion(request, response);
                    break;
                case "eliminar":
                    eliminarHistorial(request, response);
                    break;
                case "crear":
                    mostrarFormularioCreacion(request, response); // Redirigir al formulario de creación
                    break;
                default:
                    listarHistorial(request, response);
            }
        } else {
            listarHistorial(request, response);
        }
    }

    private void listarHistorial(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Historial> historial = historialService.obtenerTodosLosHistoriales();
        request.setAttribute("historial", historial);
        request.getRequestDispatcher("gestionarHistorial.jsp").forward(request, response);
    }

    private void mostrarFormularioEdicion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idHistorial = Integer.parseInt(request.getParameter("id"));
        Historial historial = historialService.obtenerHistorial(idHistorial);
        request.setAttribute("historial", historial);
        request.getRequestDispatcher("editarHistorial.jsp").forward(request, response);
    }

    private void mostrarFormularioCreacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirige al formulario de creación
        request.getRequestDispatcher("crearHistorial.jsp").forward(request, response);
    }

    private void eliminarHistorial(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idHistorial = Integer.parseInt(request.getParameter("id"));
        historialService.eliminarHistorial(idHistorial);
        response.sendRedirect("verHistorialCasos?action=listar");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("crear".equals(action)) {
            crearHistorial(request, response);
        } else if ("editar".equals(action)) {
            actualizarHistorial(request, response);
        }
    }

    private void crearHistorial(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Historial historial = new Historial();
        historial.setAccionRealizada(request.getParameter("accion_realizada"));
        historial.setIdUsuario(Integer.parseInt(request.getParameter("id_usuario")));
        historial.setIdCaso(Integer.parseInt(request.getParameter("id_caso")));
        historialService.crearHistorial(historial);
        response.sendRedirect("verHistorialCasos?action=listar");
    }

    private void actualizarHistorial(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idHistorial = Integer.parseInt(request.getParameter("id_historial"));
        Historial historial = historialService.obtenerHistorial(idHistorial);
        historial.setAccionRealizada(request.getParameter("accion_realizada"));
        historial.setIdUsuario(Integer.parseInt(request.getParameter("id_usuario")));
        historial.setIdCaso(Integer.parseInt(request.getParameter("id_caso")));
        historialService.actualizarHistorial(historial);
        response.sendRedirect("verHistorialCasos?action=listar");
    }
}
