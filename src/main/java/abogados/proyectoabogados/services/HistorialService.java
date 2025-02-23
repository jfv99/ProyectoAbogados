package abogados.proyectoabogados.services;

import abogados.proyectoabogados.models.Historial;
import abogados.proyectoabogados.utils.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class HistorialService {

    public List<Historial> obtenerHistorialPorCaso(int idCaso) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT h FROM Historial h WHERE h.idCaso = :idCaso", Historial.class)
                     .setParameter("idCaso", idCaso)
                     .getResultList();
        } finally {
            em.close();
        }
    }

    public Historial obtenerHistorial(int idHistorial) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(Historial.class, idHistorial);
        } finally {
            em.close();
        }
    }

    public void crearHistorial(Historial historial) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(historial);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void actualizarHistorial(Historial historial) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(historial);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void eliminarHistorial(int idHistorial) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            Historial historial = em.find(Historial.class, idHistorial);
            if (historial != null) {
                em.remove(historial);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<Historial> obtenerTodosLosHistoriales() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT h FROM Historial h", Historial.class).getResultList();
        } finally {
            em.close();
        }
    }
}
