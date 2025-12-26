package ec.edu.monster.modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

public class PermisoDAO {

    private Conexion conexion;

    public PermisoDAO() {
        this.conexion = new Conexion();
    }

    /**
     * Obtener todos los permisos disponibles en el sistema
     */
    public List<Permiso> listarTodosPermisos() {
        List<Permiso> permisos = new ArrayList<>();
        String sql = "SELECT XEPEQ_ID, XEPEQ_CODIGO, XEPEQ_DESCRIPCION, XEPEQ_MODULO FROM XEPEQ_PERMISOS WHERE XEPEQ_ACTIVO = 'S' ORDER BY XEPEQ_MODULO, XEPEQ_CODIGO";

        try (Connection cn = conexion.conectar();
             PreparedStatement ps = cn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Permiso permiso = new Permiso();
                permiso.setId(rs.getInt("XEPEQ_ID"));
                permiso.setCodigo(rs.getString("XEPEQ_CODIGO"));
                permiso.setDescripcion(rs.getString("XEPEQ_DESCRIPCION"));
                permiso.setModulo(rs.getString("XEPEQ_MODULO"));
                permisos.add(permiso);
            }

        } catch (SQLException e) {
            System.out.println("❌ Error listarTodosPermisos: " + e.getMessage());
            e.printStackTrace();
        }

        return permisos;
    }

    /**
     * Obtener permisos asignados a un perfil
     */
    public List<String> obtenerPermisosPerPerfil(String codigoPerfil) {
        List<String> permisos = new ArrayList<>();
        String sql = "SELECT XEPEQ_CODIGO FROM XEPXP_PERFILESPERMISOS WHERE XEPER_CODIGO = ?";

        try (Connection cn = conexion.conectar();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setString(1, codigoPerfil);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                permisos.add(rs.getString("XEPEQ_CODIGO"));
            }

        } catch (SQLException e) {
            System.out.println("❌ Error obtenerPermisosPerPerfil: " + e.getMessage());
            e.printStackTrace();
        }

        return permisos;
    }

    /**
     * Obtener permisos por módulo para un perfil
     */
    public Map<String, List<Permiso>> obtenerPermisoPorModuloDelPerfil(String codigoPerfil) {
        Map<String, List<Permiso>> moduloPermisos = new HashMap<>();
        String sql = "SELECT p.XEPEQ_ID, p.XEPEQ_CODIGO, p.XEPEQ_DESCRIPCION, p.XEPEQ_MODULO, " +
                     "CASE WHEN pp.XEPER_CODIGO IS NOT NULL THEN 1 ELSE 0 END AS ASIGNADO " +
                     "FROM XEPEQ_PERMISOS p " +
                     "LEFT JOIN XEPXP_PERFILESPERMISOS pp ON p.XEPEQ_CODIGO = pp.XEPEQ_CODIGO AND pp.XEPER_CODIGO = ? " +
                     "WHERE p.XEPEQ_ACTIVO = 'S' " +
                     "ORDER BY p.XEPEQ_MODULO, p.XEPEQ_CODIGO";

        try (Connection cn = conexion.conectar();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setString(1, codigoPerfil);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String modulo = rs.getString("XEPEQ_MODULO");
                
                Permiso permiso = new Permiso();
                permiso.setId(rs.getInt("XEPEQ_ID"));
                permiso.setCodigo(rs.getString("XEPEQ_CODIGO"));
                permiso.setDescripcion(rs.getString("XEPEQ_DESCRIPCION"));
                permiso.setModulo(modulo);
                permiso.setAsignado(rs.getInt("ASIGNADO") == 1);

                moduloPermisos.computeIfAbsent(modulo, k -> new ArrayList<>()).add(permiso);
            }

        } catch (SQLException e) {
            System.out.println("❌ Error obtenerPermisoPorModuloDelPerfil: " + e.getMessage());
            e.printStackTrace();
        }

        return moduloPermisos;
    }

    /**
     * Asignar permisos a un perfil (reemplaza todos los existentes)
     */
    public boolean asignarPermisosAlPerfil(String codigoPerfil, List<String> codigosPermisos) {
        System.out.println("\n🔐 Asignando permisos al perfil: " + codigoPerfil);

        try (Connection cn = conexion.conectar()) {
            cn.setAutoCommit(false);

            // 1. Eliminar permisos existentes
            String sqlDelete = "DELETE FROM XEPXP_PERFILESPERMISOS WHERE XEPER_CODIGO = ?";
            try (PreparedStatement psDelete = cn.prepareStatement(sqlDelete)) {
                psDelete.setString(1, codigoPerfil);
                psDelete.executeUpdate();
                System.out.println("   ✅ Permisos anteriores eliminados");
            }

            // 2. Insertar nuevos permisos
            String sqlInsert = "INSERT INTO XEPXP_PERFILESPERMISOS (XEPER_CODIGO, XEPEQ_CODIGO) VALUES (?, ?)";
            try (PreparedStatement psInsert = cn.prepareStatement(sqlInsert)) {
                for (String codigoPermiso : codigosPermisos) {
                    psInsert.setString(1, codigoPerfil);
                    psInsert.setString(2, codigoPermiso);
                    psInsert.addBatch();
                    System.out.println("   ✅ Permiso asignado: " + codigoPermiso);
                }
                psInsert.executeBatch();
            }

            cn.commit();
            cn.setAutoCommit(true);
            System.out.println("   ✅ Todos los permisos asignados correctamente\n");
            return true;

        } catch (SQLException e) {
            System.out.println("❌ Error asignarPermisosAlPerfil: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Crear un nuevo permiso
     */
    public boolean crearPermiso(String codigo, String descripcion, String modulo) {
        String sql = "INSERT INTO XEPEQ_PERMISOS (XEPEQ_CODIGO, XEPEQ_DESCRIPCION, XEPEQ_MODULO, XEPEQ_ACTIVO) VALUES (?, ?, ?, 'S')";

        try (Connection cn = conexion.conectar();
             PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setString(1, codigo);
            ps.setString(2, descripcion);
            ps.setString(3, modulo);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            System.out.println("❌ Error crearPermiso: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Obtener permisos agrupados por módulo
     */
    public Map<String, List<Permiso>> obtenerPermisosAgrupados() {
        Map<String, List<Permiso>> resultado = new HashMap<>();
        List<Permiso> permisos = listarTodosPermisos();

        for (Permiso p : permisos) {
            resultado.computeIfAbsent(p.getModulo(), k -> new ArrayList<>()).add(p);
        }

        return resultado;
    }
}
