package ec.edu.monster.modelo;

public class Permiso {
    
    private int id;
    private String codigo;        // ej: "usuarios.crear"
    private String descripcion;   // ej: "Crear nuevos usuarios"
    private String modulo;        // ej: "USUARIOS"
    private boolean asignado;     // true si está asignado al perfil actual

    public Permiso() {}

    public Permiso(int id, String codigo, String descripcion, String modulo) {
        this.id = id;
        this.codigo = codigo;
        this.descripcion = descripcion;
        this.modulo = modulo;
        this.asignado = false;
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getModulo() {
        return modulo;
    }

    public void setModulo(String modulo) {
        this.modulo = modulo;
    }

    public boolean isAsignado() {
        return asignado;
    }

    public void setAsignado(boolean asignado) {
        this.asignado = asignado;
    }

    @Override
    public String toString() {
        return "Permiso{" +
                "id=" + id +
                ", codigo='" + codigo + '\'' +
                ", descripcion='" + descripcion + '\'' +
                ", modulo='" + modulo + '\'' +
                ", asignado=" + asignado +
                '}';
    }
}
