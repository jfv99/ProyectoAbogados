package abogados.proyectoabogados.services;

import abogados.proyectoabogados.models.Notificacion;
import abogados.proyectoabogados.utils.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class NotificacionService {

    public void crearNotificacion(Notificacion notificacion) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(notificacion);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<Notificacion> obtenerTodasLasNotificaciones() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT n FROM Notificacion n", Notificacion.class).getResultList();
        } finally {
            em.close();
        }
    }

    public Notificacion obtenerNotificacion(int idNotificacion) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(Notificacion.class, idNotificacion);
        } finally {
            em.close();
        }
    }

    public void actualizarNotificacion(Notificacion notificacion) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(notificacion);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void eliminarNotificacion(int idNotificacion) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            Notificacion notificacion = em.find(Notificacion.class, idNotificacion);
            if (notificacion != null) {
                em.remove(notificacion);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
