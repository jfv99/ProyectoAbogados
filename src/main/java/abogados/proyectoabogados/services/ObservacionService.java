package abogados.proyectoabogados.services;

import abogados.proyectoabogados.models.Observacion;
import abogados.proyectoabogados.utils.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class ObservacionService {

    public void crearObservacion(Observacion observacion) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(observacion);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<Observacion> obtenerObservacionesPorCaso(int idCaso) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT o FROM Observacion o WHERE o.idCaso = :idCaso", Observacion.class)
                     .setParameter("idCaso", idCaso)
                     .getResultList();
        } finally {
            em.close();
        }
    }

    public Observacion obtenerObservacion(int idObservacion) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(Observacion.class, idObservacion);
        } finally {
            em.close();
        }
    }

    public void actualizarObservacion(Observacion observacion) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(observacion);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void eliminarObservacion(int idObservacion) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            Observacion observacion = em.find(Observacion.class, idObservacion);
            if (observacion != null) {
                em.remove(observacion);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

   public List<Observacion> obtenerTodasLasObservaciones() {
    EntityManager em = JPAUtil.getEntityManager();
    try {
        System.out.println("Obteniendo todas las observaciones de la base de datos...");
        List<Observacion> result = em.createQuery("SELECT o FROM Observacion o", Observacion.class).getResultList();
        System.out.println("Cantidad de observaciones obtenidas: " + result.size());
        return result;
    } catch (Exception e) {
        e.printStackTrace();  // Ver si hay un error específico en la ejecución de la consulta
        return null;
    } finally {
        em.close();
    }
}

}
