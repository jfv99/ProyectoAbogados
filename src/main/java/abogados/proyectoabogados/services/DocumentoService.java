package abogados.proyectoabogados.services;

import abogados.proyectoabogados.models.Documento;
import abogados.proyectoabogados.utils.JPAUtil;

import javax.persistence.EntityManager;
import java.util.List;

public class DocumentoService {

    public List<Documento> obtenerTodosLosDocumentos() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT d FROM Documento d", Documento.class).getResultList();
        } finally {
            em.close();
        }
    }

    public Documento obtenerDocumentoPorId(int idDocumento) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.find(Documento.class, idDocumento);
        } finally {
            em.close();
        }
    }

    public void crearNuevoDocumento(Documento nuevoDocumento) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            
            // Aquí se inserta el documento
            em.persist(nuevoDocumento);
            
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();  // Rollback en caso de error
            }
            e.printStackTrace();  // Esto es útil para ver el detalle del error
        } finally {
            em.close();
        }
    }

    public void actualizarDocumento(Documento documento) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(documento);
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }

    public void eliminarDocumento(int idDocumento) {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            Documento documento = em.find(Documento.class, idDocumento);
            if (documento != null) {
                em.getTransaction().begin();
                em.remove(documento);
                em.getTransaction().commit();
            }
        } finally {
            em.close();
        }
    }
}
