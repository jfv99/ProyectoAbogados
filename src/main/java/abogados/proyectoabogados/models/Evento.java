package abogados.proyectoabogados.models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "eventos")
public class Evento implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false, length = 255)
    private String descripcion;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "fecha_evento", nullable = false)
    private Date fechaEvento;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private TipoEvento tipo;

    @ManyToOne
    @JoinColumn(name = "id_caso")
    private Caso caso;

    @ManyToOne
    @JoinColumn(name = "id_abogado")
    private Usuario abogado;

    // Getters y Setters

    public enum TipoEvento {
        AUDIENCIA, REUNION, NOTIFICACION
    }

    // Constructor por defecto
    public Evento() {
    }

    // Constructor parametrizado
    public Evento(String descripcion, Date fechaEvento, TipoEvento tipo, Caso caso, Usuario abogado) {
        this.descripcion = descripcion;
        this.fechaEvento = fechaEvento;
        this.tipo = tipo;
        this.caso = caso;
        this.abogado = abogado;
    }

    // Getters y setters (puedes generarlos automáticamente)

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFechaEvento() {
        return fechaEvento;
    }

    public void setFechaEvento(Date fechaEvento) {
        this.fechaEvento = fechaEvento;
    }

    public TipoEvento getTipo() {
        return tipo;
    }

    public void setTipo(TipoEvento tipo) {
        this.tipo = tipo;
    }

    public Caso getCaso() {
        return caso;
    }

    public void setCaso(Caso caso) {
        this.caso = caso;
    }

    public Usuario getAbogado() {
        return abogado;
    }

    public void setAbogado(Usuario abogado) {
        this.abogado = abogado;
    }
}
