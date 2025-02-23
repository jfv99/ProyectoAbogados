package abogados.proyectoabogados.controllers;

import abogados.proyectoabogados.models.Documento;
import abogados.proyectoabogados.services.DocumentoService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/gestionarDocumentos")
public class DocumentoServlet extends HttpServlet {

    private DocumentoService documentoService = new DocumentoService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("listar".equals(action) || action == null) {
            // Listar todos los documentos
            List<Documento> documentos = documentoService.obtenerTodosLosDocumentos();
            request.setAttribute("documentos", documentos);
            request.getRequestDispatcher("gestionarDocumentos.jsp").forward(request, response);
        } else if ("crear".equals(action)) {
            // Redirigir al formulario para crear un documento
            request.getRequestDispatcher("crearDocumento.jsp").forward(request, response);
        } else if ("editar".equals(action)) {
            // Editar documento
            int idDocumento = Integer.parseInt(request.getParameter("id"));
            Documento documento = documentoService.obtenerDocumentoPorId(idDocumento);
            request.setAttribute("documento", documento);
            request.getRequestDispatcher("editarDocumento.jsp").forward(request, response);
        } else if ("eliminar".equals(action)) {
            // Eliminar documento
            int idDocumento = Integer.parseInt(request.getParameter("id"));
            documentoService.eliminarDocumento(idDocumento);
            response.sendRedirect("gestionarDocumentos?action=listar");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("crear".equals(action)) {
            // Proceso de creación de un nuevo documento
            String nombreDocumento = request.getParameter("nombre_documento");
            String tipoDocumento = request.getParameter("tipo_documento");
            int idCaso = Integer.parseInt(request.getParameter("id_caso"));
            String version = request.getParameter("version");
            String rutaArchivo = request.getParameter("ruta_archivo");

            Documento nuevoDocumento = new Documento();
            nuevoDocumento.setNombreDocumento(nombreDocumento);
            nuevoDocumento.setTipoDocumento(tipoDocumento);
            nuevoDocumento.setIdCaso(idCaso);
            nuevoDocumento.setVersion(version);
            nuevoDocumento.setRutaArchivo(rutaArchivo);

            documentoService.crearNuevoDocumento(nuevoDocumento);
            response.sendRedirect("gestionarDocumentos?action=listar");
        } else if ("editar".equals(action)) {
            // Proceso para editar un documento existente
            int idDocumento = Integer.parseInt(request.getParameter("id_documento"));
            String nombreDocumento = request.getParameter("nombre_documento");
            String tipoDocumento = request.getParameter("tipo_documento");
            int idCaso = Integer.parseInt(request.getParameter("id_caso"));
            String version = request.getParameter("version");
            String rutaArchivo = request.getParameter("ruta_archivo");

            Documento documento = documentoService.obtenerDocumentoPorId(idDocumento);
            documento.setNombreDocumento(nombreDocumento);
            documento.setTipoDocumento(tipoDocumento);
            documento.setIdCaso(idCaso);
            documento.setVersion(version);
            documento.setRutaArchivo(rutaArchivo);

            documentoService.actualizarDocumento(documento);
            response.sendRedirect("gestionarDocumentos?action=listar");
        }
    }
}
