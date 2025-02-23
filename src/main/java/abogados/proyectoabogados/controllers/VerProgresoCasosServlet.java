package abogados.proyectoabogados.controllers;

import abogados.proyectoabogados.models.ProgresoCaso;
import abogados.proyectoabogados.services.ProgresoCasoService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/verProgresoCasos")
public class VerProgresoCasosServlet extends HttpServlet {
    
    private final ProgresoCasoService progresoCasoService = new ProgresoCasoService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener todos los progresos
        List<ProgresoCaso> progresos = progresoCasoService.obtenerTodosLosProgresos();
        request.setAttribute("progresos", progresos);
        // Enviar los datos a JSP
        request.getRequestDispatcher("verProgresoCasos.jsp").forward(request, response);
    }
}
