package abogados.proyectoabogados.services;

import abogados.proyectoabogados.models.Caso;
import abogados.proyectoabogados.utils.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class CasoService {

    public List<Caso> obtenerTodosLosCasos() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT c FROM Caso c", Caso.class).getResultList();
        } finally {
            em.close();
        }
    }

    public Caso obtenerCasoPorId(int idCaso) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(Caso.class, idCaso);
        } finally {
            em.close();
        }
    }

    public void crearNuevoCaso(Caso nuevoCaso) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(nuevoCaso);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void actualizarCaso(Caso caso) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(caso);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void eliminarCaso(int idCaso) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            Caso caso = em.find(Caso.class, idCaso);
            if (caso != null) {
                em.getTransaction().begin();
                em.remove(caso);
                em.getTransaction().commit();
            }
        } finally {
            em.close();
        }
    }
}
