package abogados.proyectoabogados.models;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "usuarios")  // Asegúrate de que el nombre de la tabla coincida con el de tu base de datos
public class Usuario implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  // Para que MySQL maneje el incremento automático del id
    @Column(name = "id_usuario")
    private int id;

    @Column(name = "nombre_usuario")
    private String nombre;

    @Column(name = "correo")
    private String correo;

    @Column(name = "contraseña")
    private String contraseña;

    @Column(name = "rol")
    private String rol;

    @Column(name = "estado")
    private boolean activo;

    // Getters y Setters para cada campo

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public boolean isActivo() {
        return activo;
    }

    public void setActivo(boolean activo) {
        this.activo = activo;
    }
}
