package ec.edu.monster.modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioPerfilDAO {

    private Conexion conexion;

    public UsuarioPerfilDAO() {
        this.conexion = new Conexion();
    }

    public boolean asignarPerfil(int idUsuario, int idPerfil) {

        String sql = "INSERT INTO XEUXP_USUPE (XEUSU_ID_USUARIO, XEPER_CODIGO) "
                   + "VALUES (?, ?)";

        Connection cn = null;
        PreparedStatement ps = null;

        try {
            cn = conexion.conectar();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            ps.setString(2, String.valueOf(idPerfil));

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("❌ Error asignarPerfil: " + e.getMessage());
        } finally {
            cerrar(ps, cn);
        }

        return false;
    }
    
    // Método sobrecargado para código de perfil como string
    public boolean asignarPerfilPorCodigo(int idUsuario, String codigoPerfil) {

        String sql = "INSERT INTO XEUXP_USUPE (XEUSU_ID_USUARIO, XEPER_CODIGO) "
                   + "VALUES (?, ?)";

        Connection cn = null;
        PreparedStatement ps = null;

        try {
            cn = conexion.conectar();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idUsuario);
            ps.setString(2, codigoPerfil);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("❌ Error asignarPerfilPorCodigo: " + e.getMessage());
            e.printStackTrace();
        } finally {
            cerrar(ps, cn);
        }

        return false;
    }

    // =========================================
    // ASIGNAR MULTIPLES PERFILES
    // =========================================
    public boolean asignarPerfiles(int idUsuario, List<String> listaPerfiles) {
        System.out.println("\n🔍 INICIO asignarPerfiles:");
        System.out.println("   - idUsuario: " + idUsuario);
        System.out.println("   - listaPerfiles size: " + (listaPerfiles != null ? listaPerfiles.size() : "NULL"));
        
        if (listaPerfiles == null) {
            System.out.println("   ⚠️ Lista de perfiles es NULL");
            return false;
        }

        // 1. Eliminar perfiles existentes
        System.out.println("   - Eliminando perfiles existentes...");
        eliminarPerfilesUsuario(idUsuario);

        // 2. Insertar cada perfil nuevo
        // Los códigos de perfil llegan como STRING (ej: "EST001", "DOC001")
        System.out.println("   - Insertando " + listaPerfiles.size() + " perfiles nuevos...");
        for (String codigoPerfil : listaPerfiles) {
            System.out.println("     → Procesando: '" + codigoPerfil + "'");
            if (codigoPerfil != null && !codigoPerfil.trim().isEmpty()) {
                boolean exito = asignarPerfilPorCodigo(idUsuario, codigoPerfil);
                if (exito) {
                    System.out.println("       ✅ Perfil asignado: Usuario " + idUsuario + " - Perfil " + codigoPerfil);
                } else {
                    System.out.println("       ❌ Error al asignar perfil: " + codigoPerfil);
                }
            } else {
                System.out.println("       ⚠️ Código vacío o nulo");
            }
        }
        System.out.println("🔍 FIN asignarPerfiles\n");
        return true;
    }

    // =========================================
    // OBTENER PERFILES ACTUALES DE UN USUARIO
    // =========================================
    public List<String> obtenerCodigosPerfilesActivos(int idUsuario) {
        List<String> perfiles = new ArrayList<>();
        String sql = "SELECT XEPER_CODIGO FROM XEUXP_USUPE WHERE XEUSU_ID_USUARIO = ? AND XEUXP_FECRET IS NULL";

        System.out.println("🔍 obtenerCodigosPerfilesActivos - idUsuario: " + idUsuario);
        
        try (Connection cn = conexion.conectar();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String codigo = rs.getString("XEPER_CODIGO");
                perfiles.add(codigo);
                System.out.println("  → Perfil encontrado: " + codigo);
            }
            
            System.out.println("  ✅ Total perfiles: " + perfiles.size());

        } catch (SQLException e) {
            System.out.println("❌ Error obtenerCodigosPerfilesActivos: " + e.getMessage());
            e.printStackTrace();
        }

        return perfiles;
    }

    // =========================================
    // ELIMINAR PERFILES EXISTENTES DE UN USUARIO
    // =========================================
    private boolean eliminarPerfilesUsuario(int idUsuario) {
        String sql = "DELETE FROM XEUXP_USUPE WHERE XEUSU_ID_USUARIO = ?";

        try (Connection cn = conexion.conectar();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setInt(1, idUsuario);
            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("❌ Error eliminarPerfilesUsuario: " + e.getMessage());
            return false;
        }
    }

    // =========================================
    // CERRAR RECURSOS
    // =========================================
    private void cerrar(PreparedStatement ps, Connection cn) {
        try {
            if (ps != null) ps.close();
            if (cn != null) conexion.desconectar(cn);
        } catch (SQLException e) {
            System.out.println("❌ Error cerrar recursos UsuarioPerfilDAO");
        }
    }
}
