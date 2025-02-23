package abogados.proyectoabogados.services;

import abogados.proyectoabogados.models.Usuario;
import abogados.proyectoabogados.utils.JPAUtil;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

public class UsuarioService {
  public boolean existeCorreo(String correo) {
      EntityManager em = JPAUtil.getEntityManager();  
      String jpql = "SELECT COUNT(u) FROM Usuario u WHERE u.correo = :correo";
        Long count = em.createQuery(jpql, Long.class)
                                  .setParameter("correo", correo)
                                  .getSingleResult();
        return count > 0;
    }
    public Usuario autenticarUsuario(String correo, String password) {
        EntityManager em = JPAUtil.getEntityManager();
        
        try {
            Query query = em.createQuery("SELECT u FROM Usuario u WHERE u.correo = :correo AND u.contraseña = :password");
            query.setParameter("correo", correo);
            query.setParameter("password", password);
            return (Usuario) query.getSingleResult();
        } catch (Exception e) {
            return null; // Retorna null si no encuentra el usuario o si ocurre un error
        } finally {
            em.close();
        }
    }

    // Método para obtener todos los usuarios
    public List<Usuario> obtenerTodosLosUsuarios() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            Query query = em.createQuery("SELECT u FROM Usuario u");
            return query.getResultList(); // Devuelve la lista de usuarios
        } finally {
            em.close();
        }
    }

    // Método para registrar (crear) un nuevo usuario
    public void registrarUsuario(Usuario usuario) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(usuario);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    // Método para actualizar un usuario existente
    public void actualizarUsuario(Usuario usuario) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(usuario);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    // Método para eliminar un usuario por ID
    public void eliminarUsuario(int idUsuario) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            Usuario usuario = em.find(Usuario.class, idUsuario);
            if (usuario != null) {
                em.remove(usuario); // Elimina el usuario si existe
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    // Método para obtener un usuario por ID
    public Usuario obtenerUsuario(int idUsuario) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(Usuario.class, idUsuario);
        } finally {
            em.close();
        }
    }
  
}
