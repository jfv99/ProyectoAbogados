package abogados.proyectoabogados.services;

import abogados.proyectoabogados.models.Evento;

import abogados.proyectoabogados.utils.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class EventoService {

    public void crearEvento(Evento evento) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(evento);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public List<Evento> obtenerEventosPorCaso(int idCaso) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT e FROM Evento e WHERE e.caso.id = :idCaso", Evento.class)
                     .setParameter("idCaso", idCaso)
                     .getResultList();
        } finally {
            em.close();
        }
    }

    public Evento obtenerEvento(int idEvento) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(Evento.class, idEvento);
        } finally {
            em.close();
        }
    }

    public void actualizarEvento(Evento evento) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(evento);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void eliminarEvento(int idEvento) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            Evento evento = em.find(Evento.class, idEvento);
            if (evento != null) {
                em.remove(evento);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
