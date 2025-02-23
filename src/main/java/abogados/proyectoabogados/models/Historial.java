package abogados.proyectoabogados.models;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "historial")
public class Historial {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int idHistorial;

    @Column(name = "accion_realizada")
    private String accionRealizada;

    @Column(name = "fecha_accion", insertable = false, updatable = false)
    private Timestamp fechaAccion;

    @Column(name = "id_usuario")
    private int idUsuario;

    @Column(name = "id_caso")
    private int idCaso;

    // Getters y Setters
    public int getIdHistorial() {
        return idHistorial;
    }

    public void setIdHistorial(int idHistorial) {
        this.idHistorial = idHistorial;
    }

    public String getAccionRealizada() {
        return accionRealizada;
    }

    public void setAccionRealizada(String accionRealizada) {
        this.accionRealizada = accionRealizada;
    }

    public Timestamp getFechaAccion() {
        return fechaAccion;
    }

    public void setFechaAccion(Timestamp fechaAccion) {
        this.fechaAccion = fechaAccion;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdCaso() {
        return idCaso;
    }

    public void setIdCaso(int idCaso) {
        this.idCaso = idCaso;
    }
}
