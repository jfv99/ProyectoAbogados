package abogados.proyectoabogados.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/*")
public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Inicialización, si es necesaria
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        // Obtener la URI solicitada
        String requestURI = req.getRequestURI();

        // Permitir el acceso a recursos estáticos sin autenticación
        if (requestURI.contains("/logo.png") || requestURI.contains("/assets/") || requestURI.contains("/login") || requestURI.endsWith(".css") || requestURI.endsWith(".js") || requestURI.endsWith(".jpg") || requestURI.endsWith(".png")) {
            // Si el recurso es estático o es la página de login, permite el acceso
            chain.doFilter(request, response);
        } else {
            // Verificar si el usuario está autenticado
            if (req.getSession().getAttribute("usuario") == null) {
                // Si no está autenticado, redirigir al login
                res.sendRedirect(req.getContextPath() + "/login.jsp");
            } else {
                // Si está autenticado, continuar con la petición
                chain.doFilter(request, response);
            }
        }
    }

    @Override
    public void destroy() {
        // Limpiar recursos si es necesario
    }
}
