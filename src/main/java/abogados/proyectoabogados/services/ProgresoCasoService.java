package abogados.proyectoabogados.services;

import abogados.proyectoabogados.models.ProgresoCaso;
import abogados.proyectoabogados.utils.JPAUtil;
import javax.persistence.EntityManager;
import java.util.List;

public class ProgresoCasoService {
    
    public List<ProgresoCaso> obtenerTodosLosProgresos() {
        EntityManager em = JPAUtil.getEntityManager();
        try {
            return em.createQuery("SELECT p FROM ProgresoCaso p", ProgresoCaso.class).getResultList();
        } finally {
            em.close();
        }
    }
}
