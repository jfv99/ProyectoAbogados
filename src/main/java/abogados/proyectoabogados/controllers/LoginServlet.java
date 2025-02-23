package abogados.proyectoabogados.controllers;

import abogados.proyectoabogados.models.Usuario;
import abogados.proyectoabogados.services.UsuarioService;
import abogados.proyectoabogados.utils.PasswordUtil; // Asegúrate de que este archivo esté importado

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UsuarioService usuarioService = new UsuarioService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            // Cifrar la contraseña ingresada por el usuario antes de la autenticación
            String hashedPassword = PasswordUtil.hashPassword(password);

            // Autenticar al usuario con el correo electrónico y la contraseña cifrada
            Usuario usuario = usuarioService.autenticarUsuario(email, hashedPassword);

            if (usuario != null) {
                // Si la autenticación es correcta, guarda el usuario en la sesión y redirige al dashboard (home.jsp)
                request.getSession().setAttribute("usuario", usuario);
                response.sendRedirect("home.jsp");  // Redirige al dashboard
            } else {
                // Si la autenticación falla, redirige a la página de login con un mensaje de error
                response.sendRedirect("login.jsp?error=true");
            }

        } catch (NoSuchAlgorithmException e) {
            // Si ocurre un error en el proceso de cifrado, redirigir a la página de login con error
            response.sendRedirect("login.jsp?error=true");
        }
    }
}
