package ec.edu.monster.controlador;

import ec.edu.monster.modelo.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@WebServlet(name = "srvPermisos", urlPatterns = {"/srvPermisos"})
public class srvPermisos extends HttpServlet {

    private PerfilDAO perfilDAO;
    private PermisoDAO permisoDAO;

    @Override
    public void init() throws ServletException {
        perfilDAO = new PerfilDAO();
        permisoDAO = new PermisoDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getSession().getAttribute("usuario") == null) {
            response.sendRedirect("identificar.jsp");
            return;
        }

        String accion = request.getParameter("accion");

        if (accion == null || accion.isEmpty()) {
            listarPermisosPerfil(request, response);
        } else if ("listar".equals(accion)) {
            listarPermisosPerfil(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getSession().getAttribute("usuario") == null) {
            response.sendRedirect("identificar.jsp");
            return;
        }

        String accion = request.getParameter("accion");

        if ("guardarPermisos".equals(accion)) {
            guardarPermisos(request, response);
        }
    }

    /**
     * Listar permisos por perfil
     */
    private void listarPermisosPerfil(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Obtener todos los perfiles
            List<Perfil> perfiles = perfilDAO.listarTodos();

            // Obtener perfil seleccionado (por defecto el primero)
            String perfilSeleccionado = request.getParameter("codigoPerfil");
            if (perfilSeleccionado == null || perfilSeleccionado.isEmpty()) {
                perfilSeleccionado = perfiles.isEmpty() ? "" : perfiles.get(0).getCodigo();
            }

            // Obtener permisos por módulo del perfil seleccionado
            Map<String, List<Permiso>> permisosPorModulo = permisoDAO.obtenerPermisoPorModuloDelPerfil(perfilSeleccionado);

            request.setAttribute("perfiles", perfiles);
            request.setAttribute("perfilSeleccionado", perfilSeleccionado);
            request.setAttribute("permisosPorModulo", permisosPorModulo);

            System.out.println("\n📋 Listando permisos del perfil: " + perfilSeleccionado);
            System.out.println("   Módulos encontrados: " + permisosPorModulo.size());

            request.getRequestDispatcher("permisosPerfil.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("❌ Error en listarPermisosPerfil: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("index.jsp?error=1");
        }
    }

    /**
     * Guardar permisos para un perfil
     */
    private void guardarPermisos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String codigoPerfil = request.getParameter("codigoPerfil");

            if (codigoPerfil == null || codigoPerfil.isEmpty()) {
                response.sendRedirect("srvPermisos?accion=listar&mensaje=Perfil no válido&tipo=error");
                return;
            }

            // Obtener todos los permisos seleccionados
            Map<String, String[]> parametros = request.getParameterMap();
            List<String> permisosSeleccionados = new ArrayList<>();

            for (String param : parametros.keySet()) {
                if (param.startsWith("permiso_")) {
                    String codigoPermiso = param.substring(8); // Remover "permiso_"
                    permisosSeleccionados.add(codigoPermiso);
                }
            }

            System.out.println("\n🔐 Guardando permisos para perfil: " + codigoPerfil);
            System.out.println("   Total de permisos a asignar: " + permisosSeleccionados.size());

            // Guardar permisos
            boolean exito = permisoDAO.asignarPermisosAlPerfil(codigoPerfil, permisosSeleccionados);

            if (exito) {
                response.sendRedirect("srvPermisos?accion=listar&codigoPerfil=" + codigoPerfil + 
                                      "&mensaje=Permisos actualizados correctamente&tipo=success");
            } else {
                response.sendRedirect("srvPermisos?accion=listar&codigoPerfil=" + codigoPerfil + 
                                      "&mensaje=Error al actualizar permisos&tipo=error");
            }

        } catch (Exception e) {
            System.out.println("❌ Error en guardarPermisos: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("srvPermisos?accion=listar&mensaje=Error interno&tipo=error");
        }
    }
}
