package abogados.proyectoabogados.controllers;

import abogados.proyectoabogados.models.Caso;
import abogados.proyectoabogados.services.CasoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/gestionarCasos")
public class CasoServlet extends HttpServlet {

    private CasoService casoService = new CasoService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("listar".equals(action) || action == null) {
            // Listar todos los casos
            List<Caso> casos = casoService.obtenerTodosLosCasos();
            request.setAttribute("casos", casos);
            request.getRequestDispatcher("gestionarCasos.jsp").forward(request, response);
        } else if ("crear".equals(action)) {
            // Redirigir al formulario para crear un caso
            request.getRequestDispatcher("crearCaso.jsp").forward(request, response);
        } else if ("editar".equals(action)) {
            // Editar caso
            try {
                int idCaso = Integer.parseInt(request.getParameter("id"));
                Caso caso = casoService.obtenerCasoPorId(idCaso);
                request.setAttribute("caso", caso);
                request.getRequestDispatcher("editarCaso.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                response.sendRedirect("gestionarCasos?action=listar");
            }
        } else if ("eliminar".equals(action)) {
            // Eliminar caso
            try {
                int idCaso = Integer.parseInt(request.getParameter("id"));
                casoService.eliminarCaso(idCaso);
                response.sendRedirect("gestionarCasos?action=listar");
            } catch (NumberFormatException e) {
                response.sendRedirect("gestionarCasos?action=listar");
            }
        }
    }

@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");

    if ("crear".equals(action)) {
        try {
            // Captura de datos del formulario
            String tipoCaso = request.getParameter("tipo_caso");
            String descripcion = request.getParameter("descripcion");
            int idCliente = Integer.parseInt(request.getParameter("id_cliente"));
            int idAbogado = Integer.parseInt(request.getParameter("id_abogado"));
            String estadoCaso = request.getParameter("estado_caso");
            String estado = request.getParameter("estado");
            String tipo = request.getParameter("tipo");
            int idUsuario = Integer.parseInt(request.getParameter("id_usuario"));

            // Creación del nuevo caso
            Caso nuevoCaso = new Caso();
            nuevoCaso.setTipoCaso(tipoCaso);
            nuevoCaso.setDescripcion(descripcion);
            nuevoCaso.setIdCliente(idCliente);
            nuevoCaso.setIdAbogado(idAbogado);
            nuevoCaso.setEstadoCaso(estadoCaso);
            nuevoCaso.setEstado(estado);
            nuevoCaso.setTipo(tipo);
            nuevoCaso.setIdUsuario(idUsuario);

            // Persistir el nuevo caso
            casoService.crearNuevoCaso(nuevoCaso);
            response.sendRedirect("gestionarCasos?action=listar");

        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("error", "Datos numéricos inválidos.");
            request.getRequestDispatcher("crearCaso.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Hubo un error al crear el caso. Intenta de nuevo.");
            request.getRequestDispatcher("crearCaso.jsp").forward(request, response);
        }
    }
}

}
