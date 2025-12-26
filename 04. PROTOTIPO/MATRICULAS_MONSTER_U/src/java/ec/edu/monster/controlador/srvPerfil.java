package ec.edu.monster.controlador;

import ec.edu.monster.modelo.*;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "srvPerfil", urlPatterns = {"/srvPerfil"})
public class srvPerfil extends HttpServlet {

    private UsuarioDAO usuarioDAO;
    private PerfilDAO perfilDAO;
    private UsuarioPerfilDAO usuarioPerfilDAO;

    @Override
    public void init() throws ServletException {
        usuarioDAO = new UsuarioDAO();
        perfilDAO = new PerfilDAO();
        usuarioPerfilDAO = new UsuarioPerfilDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect("identificar.jsp");
            return;
        }

        String accion = request.getParameter("accion");
        if (accion == null) {
            accion = "listar";
        }

        try {
            switch (accion) {
                case "listar":
                    listarUsuariosSinPerfil(request, response);
                    break;
                case "verAsignar":
                    mostrarFormularioAsignar(request, response);
                    break;
                case "asignarPerfil":
                    asignarPerfilAUsuario(request, response);
                    break;
                default:
                    listarUsuariosSinPerfil(request, response);
                    break;
            }
        } catch (Exception e) {
            System.out.println("❌ Error en srvPerfil: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("mensaje", "Error al procesar la solicitud");
            request.setAttribute("tipoMensaje", "danger");
            request.getRequestDispatcher("gestionPerfiles.jsp").forward(request, response);
        }
    }

    /**
     * Listar usuarios categorizados por perfil
     * Usa la misma lógica que el gestor de usuarios
     */
    private void listarUsuariosSinPerfil(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener todos los usuarios (ya vienen con tipoUsuario desde XEACU_USR_ACADE)
        List<Usuario> todosUsuarios = usuarioDAO.listarTodos();
        
        // Obtener todos los perfiles disponibles
        List<Perfil> todosPerfiles = perfilDAO.listarTodos();
        
        // Categorizar usuarios por su tipo académico
        List<Usuario> usuariosSinPerfil = new java.util.ArrayList<>();
        List<Usuario> estudiantesList = new java.util.ArrayList<>();
        List<Usuario> docentesList = new java.util.ArrayList<>();
        List<Usuario> secretariosList = new java.util.ArrayList<>();
        List<Usuario> administradoresList = new java.util.ArrayList<>();
        
        System.out.println("\n📊 === CATEGORIZANDO USUARIOS POR TIPO ACADÉMICO ===");
        
        for (Usuario u : todosUsuarios) {
            String tipoUsuario = u.getTipoUsuario(); // Viene de XEACU_USR_ACADE
            
            System.out.println("\n👤 Usuario: " + u.getUsername() + " (ID: " + u.getUsuIdUsuario() + ")");
            System.out.println("   Tipo: " + (tipoUsuario != null ? tipoUsuario : "NULL"));
            
            if (tipoUsuario == null || tipoUsuario.trim().isEmpty()) {
                // Sin tipo académico = sin perfil
                usuariosSinPerfil.add(u);
                System.out.println("   ❌ SIN PERFIL (tipo null o vacío)");
            } else {
                String tipoUpper = tipoUsuario.toUpperCase();
                
                if (tipoUpper.contains("ESTUD")) {
                    estudiantesList.add(u);
                    System.out.println("   ✅ Categorizado como ESTUDIANTE");
                } else if (tipoUpper.contains("DOCENT")) {
                    docentesList.add(u);
                    System.out.println("   ✅ Categorizado como DOCENTE");
                } else if (tipoUpper.contains("SECRET")) {
                    secretariosList.add(u);
                    System.out.println("   ✅ Categorizado como SECRETARIO");
                } else if (tipoUpper.contains("ADMIN")) {
                    administradoresList.add(u);
                    System.out.println("   ✅ Categorizado como ADMINISTRADOR");
                } else {
                    // Tipo desconocido
                    usuariosSinPerfil.add(u);
                    System.out.println("   ⚠️ Tipo desconocido: " + tipoUsuario);
                }
            }
        }

        request.setAttribute("usuariosSinPerfil", usuariosSinPerfil);
        request.setAttribute("estudiantesList", estudiantesList);
        request.setAttribute("docentesList", docentesList);
        request.setAttribute("secretariosList", secretariosList);
        request.setAttribute("administradoresList", administradoresList);
        request.setAttribute("perfilesDisponibles", todosPerfiles);
        
        // Debug
        System.out.println("\n📊 RESUMEN CATEGORIZACIÓN:");
        System.out.println("✅ Sin Perfil: " + usuariosSinPerfil.size());
        System.out.println("✅ Estudiantes: " + estudiantesList.size());
        System.out.println("✅ Docentes: " + docentesList.size());
        System.out.println("✅ Secretarios: " + secretariosList.size());
        System.out.println("✅ Administradores: " + administradoresList.size());
        
        request.getRequestDispatcher("gestionPerfiles.jsp").forward(request, response);
    }

    /**
     * Mostrar formulario para asignar perfil a un usuario
     */
    private void mostrarFormularioAsignar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idUsuarioStr = request.getParameter("idUsuario");
        
        if (idUsuarioStr == null || idUsuarioStr.isEmpty()) {
            response.sendRedirect("srvPerfil?accion=listar&mensaje=ID de usuario no válido&tipo=error");
            return;
        }

        try {
            int idUsuario = Integer.parseInt(idUsuarioStr);
            Usuario usuario = usuarioDAO.obtenerPorId(idUsuario);
            
            if (usuario == null) {
                response.sendRedirect("srvPerfil?accion=listar&mensaje=Usuario no encontrado&tipo=error");
                return;
            }

            // Obtener perfiles disponibles
            List<Perfil> perfiles = perfilDAO.listarTodos();

            request.setAttribute("usuario", usuario);
            request.setAttribute("perfilesDisponibles", perfiles);
            request.setAttribute("accion", "asignar");
            request.getRequestDispatcher("formAsignarPerfil.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("srvPerfil?accion=listar&mensaje=ID de usuario inválido&tipo=error");
        }
    }

    /**
     * Asignar perfil a un usuario - Usa la misma lógica que srvUsuario
     */
    private void asignarPerfilAUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idUsuarioStr = request.getParameter("idUsuario");
        String codigoPerfil = request.getParameter("idPerfil");

        if (idUsuarioStr == null || codigoPerfil == null || codigoPerfil.trim().isEmpty()) {
            response.sendRedirect("srvPerfil?accion=listar&mensaje=Datos incompletos&tipo=error");
            return;
        }

        try {
            int idUsuario = Integer.parseInt(idUsuarioStr);

            System.out.println("\n========================================");
            System.out.println("🔵 ASIGNANDO PERFIL A USUARIO");
            System.out.println("   - idUsuario: " + idUsuario);
            System.out.println("   - codigoPerfil: " + codigoPerfil);
            System.out.println("========================================");

            // Obtener usuario
            Usuario usuario = usuarioDAO.obtenerPorId(idUsuario);
            if (usuario == null) {
                response.sendRedirect("srvPerfil?accion=listar&mensaje=Usuario no encontrado&tipo=error");
                return;
            }

            // Crear lista con un solo perfil
            java.util.List<String> listaPerfiles = new java.util.ArrayList<>();
            listaPerfiles.add(codigoPerfil);

            // Validar: Si es Estudiante, no puede tener otros perfiles
            boolean tieneEstudiante = false;
            boolean tieneOtros = false;
            for (String perfil : listaPerfiles) {
                String perfilUpper = perfil.toUpperCase();
                if (perfilUpper.contains("ESTUD")) {
                    tieneEstudiante = true;
                } else {
                    tieneOtros = true;
                }
            }
            if (tieneEstudiante && tieneOtros) {
                response.sendRedirect("srvPerfil?accion=listar&mensaje=El perfil Estudiante no puede combinarse con otros&tipo=error");
                return;
            }

            // Asignar perfiles (reemplaza los existentes)
            usuarioPerfilDAO.asignarPerfiles(idUsuario, listaPerfiles);
            System.out.println("✅ Perfiles asignados correctamente");

            // Actualizar tipo académico según perfil seleccionado
            UsuarioAcademicoDAO usuarioAcademicoDAO = new UsuarioAcademicoDAO();
            String tipoDetectado = usuarioAcademicoDAO.detectarTipoUsuario(new String[]{codigoPerfil});
            
            if (tipoDetectado != null) {
                String idAcad = usuarioAcademicoDAO.generarIdAcademico(tipoDetectado);
                if (idAcad != null && !idAcad.trim().isEmpty()) {
                    usuarioAcademicoDAO.guardar(idUsuario, tipoDetectado, idAcad);
                    System.out.println("✅ Tipo académico actualizado: " + tipoDetectado + " (ID: " + idAcad + ")");
                }
            }

            System.out.println("✅ Perfil asignado exitosamente al usuario");
            response.sendRedirect("srvPerfil?accion=listar&mensaje=Perfil asignado correctamente&tipo=success");

        } catch (NumberFormatException e) {
            System.out.println("❌ Error: ID de usuario inválido");
            response.sendRedirect("srvPerfil?accion=listar&mensaje=ID de usuario inválido&tipo=error");
        } catch (Exception e) {
            System.out.println("❌ Error en asignarPerfilAUsuario: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("srvPerfil?accion=listar&mensaje=Error al asignar perfil&tipo=error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para gestión de perfiles";
    }
}
