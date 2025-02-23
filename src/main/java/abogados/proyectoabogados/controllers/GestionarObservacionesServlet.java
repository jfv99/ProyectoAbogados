package abogados.proyectoabogados.controllers;

import abogados.proyectoabogados.models.Observacion;
import abogados.proyectoabogados.services.ObservacionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/gestionarObservaciones")
public class GestionarObservacionesServlet extends HttpServlet {

    private ObservacionService observacionService = new ObservacionService(); // Instancia manual del servicio

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "listar":
                    listarObservaciones(request, response);
                    break;
                case "editar":
                    mostrarFormularioEdicion(request, response);
                    break;
                case "eliminar":
                    eliminarObservacion(request, response);
                    break;
                default:
                    listarObservaciones(request, response);
            }
        } else {
            listarObservaciones(request, response);
        }
    }

    private void listarObservaciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
            String idCasoParam = request.getParameter("id_caso");

            List<Observacion> observaciones;

            if (idCasoParam != null && !idCasoParam.isEmpty()) {
                try {
                    int idCaso = Integer.parseInt(idCasoParam);
                    observaciones = observacionService.obtenerObservacionesPorCaso(idCaso);
                } catch (NumberFormatException e) {
                    request.setAttribute("errorMessage", "ID de caso no válido.");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                    return;
                }
            } else {
                observaciones = observacionService.obtenerTodasLasObservaciones(); // Lista todas las observaciones si no hay id_caso
            }

            if (observaciones == null || observaciones.isEmpty()) {
                request.setAttribute("errorMessage", "No se encontraron observaciones.");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            } else {
                request.setAttribute("observaciones", observaciones);
                request.getRequestDispatcher("verObservaciones.jsp").forward(request, response);
            }
        
    }

    private void mostrarFormularioEdicion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idObservacion = Integer.parseInt(request.getParameter("id"));
        Observacion observacion = observacionService.obtenerObservacion(idObservacion);
        request.setAttribute("observacion", observacion);
        request.getRequestDispatcher("editarObservacion.jsp").forward(request, response);
    }

    private void eliminarObservacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idObservacion = Integer.parseInt(request.getParameter("id"));
        observacionService.eliminarObservacion(idObservacion);
        response.sendRedirect("gestionarObservaciones?action=listar");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("crear".equals(action)) {
            crearObservacion(request, response);
        } else if ("editar".equals(action)) {
            actualizarObservacion(request, response);
        }
    }

    private void crearObservacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Observacion observacion = new Observacion();
        observacion.setIdCaso(Integer.parseInt(request.getParameter("id_caso")));
        observacion.setComentario(request.getParameter("comentario"));
        observacion.setAutor(request.getParameter("autor"));
        observacionService.crearObservacion(observacion);
        response.sendRedirect("gestionarObservaciones?action=listar");
    }

    private void actualizarObservacion(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idObservacion = Integer.parseInt(request.getParameter("id_observacion"));
        Observacion observacion = observacionService.obtenerObservacion(idObservacion);
        observacion.setComentario(request.getParameter("comentario"));
        observacion.setAutor(request.getParameter("autor"));
        observacionService.actualizarObservacion(observacion);
        response.sendRedirect("gestionarObservaciones?action=listar");
    }
}
