<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("identificar.jsp");
        return;
    }
    
    java.util.List<String> permisosUsuario = (java.util.List<String>) session.getAttribute("permisosUsuario");
    
    // Administración - Personal
    boolean pUsuariosCrear = permisosUsuario != null && (permisosUsuario.contains("personal.administracion.usuarios.crear") || permisosUsuario.contains("personal.gestion.usuarios.crear"));
    boolean pUsuariosListar = permisosUsuario != null && (permisosUsuario.contains("personal.administracion.usuarios.listar") || permisosUsuario.contains("personal.gestion.usuarios.listar"));
    boolean pUsuariosEditar = permisosUsuario != null && (permisosUsuario.contains("personal.administracion.usuarios.editar") || permisosUsuario.contains("personal.gestion.usuarios.editar"));
    boolean pUsuariosEliminar = permisosUsuario != null && (permisosUsuario.contains("personal.administracion.usuarios.eliminar") || permisosUsuario.contains("personal.gestion.usuarios.eliminar"));
    boolean pUsuariosVerDetalle = permisosUsuario != null && (permisosUsuario.contains("personal.administracion.usuarios.ver_detalle") || permisosUsuario.contains("personal.gestion.usuarios.ver_detalle"));
    
    boolean pEstudiantesCrear = permisosUsuario != null && (permisosUsuario.contains("personal.administracion.estudiantes.crear") || permisosUsuario.contains("personal.gestion.estudiantes.crear"));
    boolean pEstudiantesListar = permisosUsuario != null && (permisosUsuario.contains("personal.administracion.estudiantes.listar") || permisosUsuario.contains("personal.gestion.estudiantes.listar"));
    boolean pEstudiantesEditar = permisosUsuario != null && (permisosUsuario.contains("personal.administracion.estudiantes.editar") || permisosUsuario.contains("personal.gestion.estudiantes.editar"));
    
    boolean pDocentesCrear = permisosUsuario != null && (permisosUsuario.contains("personal.administracion.docentes.crear") || permisosUsuario.contains("personal.gestion.docentes.crear"));
    boolean pDocentesListar = permisosUsuario != null && (permisosUsuario.contains("personal.administracion.docentes.listar") || permisosUsuario.contains("personal.gestion.docentes.listar"));
    boolean pDocentesEditar = permisosUsuario != null && (permisosUsuario.contains("personal.administracion.docentes.editar") || permisosUsuario.contains("personal.gestion.docentes.editar"));
    
    // Administración - Seguridad
    boolean pPerfilesCrear = permisosUsuario != null && (permisosUsuario.contains("seguridad.administracion.perfiles.crear") || permisosUsuario.contains("seguridad.gestion.perfiles.crear"));
    boolean pPerfilesEditar = permisosUsuario != null && (permisosUsuario.contains("seguridad.administracion.perfiles.editar") || permisosUsuario.contains("seguridad.gestion.perfiles.editar"));
    boolean pPerfilesAsignar = permisosUsuario != null && (permisosUsuario.contains("seguridad.administracion.perfiles.asignar") || permisosUsuario.contains("seguridad.gestion.perfiles.asignar"));
    
    // Administración - Académico
    boolean pMatriculasCrear = permisosUsuario != null && (permisosUsuario.contains("academico.administracion.matriculas.crear") || permisosUsuario.contains("academico.gestion.matriculas.crear"));
    boolean pMatriculasListar = permisosUsuario != null && (permisosUsuario.contains("academico.administracion.matriculas.listar") || permisosUsuario.contains("academico.gestion.matriculas.listar"));
    boolean pMatriculasEditar = permisosUsuario != null && (permisosUsuario.contains("academico.administracion.matriculas.editar") || permisosUsuario.contains("academico.gestion.matriculas.editar"));
    boolean pMatriculasVer = permisosUsuario != null && (permisosUsuario.contains("academico.administracion.matriculas.ver") || permisosUsuario.contains("academico.gestion.matriculas.ver"));
    boolean pMatriculasProcesar = permisosUsuario != null && (permisosUsuario.contains("academico.administracion.matriculas.procesar") || permisosUsuario.contains("academico.gestion.matriculas.procesar"));
    
    boolean pCalificacionesCrear = permisosUsuario != null && (permisosUsuario.contains("academico.administracion.calificaciones.crear") || permisosUsuario.contains("academico.gestion.calificaciones.crear"));
    boolean pCalificacionesListar = permisosUsuario != null && (permisosUsuario.contains("academico.administracion.calificaciones.listar") || permisosUsuario.contains("academico.gestion.calificaciones.listar"));
    boolean pCalificacionesEditar = permisosUsuario != null && (permisosUsuario.contains("academico.administracion.calificaciones.editar") || permisosUsuario.contains("academico.gestion.calificaciones.editar"));
    boolean pCalificacionesVer = permisosUsuario != null && (permisosUsuario.contains("academico.administracion.calificaciones.ver") || permisosUsuario.contains("academico.gestion.calificaciones.ver"));

    // Procesos académicos
    boolean procMatriculasInscribir = permisosUsuario != null && permisosUsuario.contains("academico.procesos.matriculas.inscribir");
    boolean procMatriculasProcesar = permisosUsuario != null && permisosUsuario.contains("academico.procesos.matriculas.procesar");
    boolean procCalificacionesIngresar = permisosUsuario != null && permisosUsuario.contains("academico.procesos.calificaciones.ingresar");
    boolean procHorariosGestionar = permisosUsuario != null && permisosUsuario.contains("academico.procesos.horarios.gestionar");

    // Reportes
    boolean rPersonalGenerar = permisosUsuario != null && (permisosUsuario.contains("personal.reportes.personal.generar") || permisosUsuario.contains("personal.reportes.usuarios.generar"));
    boolean rMatriculasGenerar = permisosUsuario != null && permisosUsuario.contains("academico.reportes.matriculas.generar");
    boolean rCalificacionesGenerar = permisosUsuario != null && permisosUsuario.contains("academico.reportes.calificaciones.generar");
    boolean rFinancierosGenerar = permisosUsuario != null && permisosUsuario.contains("finanzas.reportes.ingresos.generar");
    
    // Administración - Finanzas
    boolean pPagosRegistrar = permisosUsuario != null && (permisosUsuario.contains("finanzas.administracion.pagos.registrar") || permisosUsuario.contains("finanzas.gestion.pagos.registrar"));
    boolean pPagosListar = permisosUsuario != null && (permisosUsuario.contains("finanzas.administracion.pagos.listar") || permisosUsuario.contains("finanzas.gestion.pagos.listar"));
    boolean pPagosEditar = permisosUsuario != null && (permisosUsuario.contains("finanzas.administracion.pagos.editar") || permisosUsuario.contains("finanzas.gestion.pagos.editar"));
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Dashboard Estudiante | Monster U</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { padding-top: 0; background: #f4f6f9; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; }
    html, body { height: 100%; }
    .wrapper { display: flex; min-height: 100vh; }
    
    /* Sidebar */
    .main-sidebar {
      width: 250px;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      padding-top: 20px;
      box-shadow: 2px 0 10px rgba(0,0,0,.1);
      position: fixed;
      height: 100vh;
      left: 0;
      top: 0;
      z-index: 500;
      overflow-y: auto;
    }
    
    .main-sidebar .sidebar-header {
      color: white;
      padding: 15px 20px;
      font-weight: 700;
      font-size: 18px;
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 20px;
      border-bottom: 2px solid rgba(255,255,255,.2);
    }
    
    .main-sidebar .sidebar-menu {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    
    .main-sidebar .sidebar-menu > li {
      margin: 0;
    }
    
    .main-sidebar .sidebar-menu > li > a {
      color: rgba(255,255,255,.9);
      padding: 14px 20px;
      display: block;
      transition: all .3s ease;
      border-left: 4px solid transparent;
      font-size: 14px;
      font-weight: 500;
    }
    
    .main-sidebar .sidebar-menu > li > a:hover {
      background: rgba(255,255,255,.1);
      border-left-color: #ffeb3b;
      color: white;
      text-decoration: none;
    }
    
    .main-sidebar .sidebar-menu > li.active > a {
      background: rgba(255,255,255,.15);
      border-left-color: #ffeb3b;
      color: white;
    }
    
    .main-sidebar .sidebar-menu > li > a > i {
      margin-right: 12px;
      width: 18px;
    }
    
    /* Main content area */
    .content-container {
      flex: 1;
      margin-left: 250px;
      display: flex;
      flex-direction: column;
    }
    
    /* Header */
    .main-header { 
      background: white; 
      border-bottom: 2px solid #e0e0e0; 
      margin-bottom: 0; 
      box-shadow: 0 2px 8px rgba(0,0,0,.05);
      padding: 0 30px;
      position: relative;
      z-index: 100;
    }
    
    /* Navbar */
    .main-navbar { 
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      padding: 0;
      display: flex;
      align-items: center;
      justify-content: space-between;
      box-shadow: 0 3px 12px rgba(102,126,234,.2);
    }
    
    .main-navbar ul.navbar-nav { 
      margin: 0; 
      padding: 0; 
      display: flex;
      list-style: none;
      flex: 1;
    }
    
    .main-navbar .nav-item { 
      padding: 0;
      position: relative;
    }
    
    .main-navbar .nav-link { 
      color: white; 
      padding: 15px 22px; 
      display: block; 
      transition: all .3s ease;
      font-weight: 500;
      font-size: 14px;
      border-bottom: 3px solid transparent;
    }
    
    .main-navbar .nav-link:hover, 
    .main-navbar .nav-item.open > .nav-link {
      background: rgba(255,255,255,.12);
      border-bottom-color: #ffeb3b;
      text-decoration: none;
    }
    
    .main-navbar .nav-link .caret {
      display: none;
    }
    
    /* Dropdown */
    .main-navbar .dropdown-menu { 
      background: #764ba2;
      border: none; 
      border-radius: 4px; 
      padding: 8px 0; 
      min-width: 230px;
      margin-top: 0;
      box-shadow: 0 5px 20px rgba(0,0,0,.2);
      display: none;
      position: absolute;
      top: 100%;
      left: 0;
      z-index: 1000;
    }

    .main-navbar .dropdown-menu-right {
      right: 0 !important;
      left: auto !important;
    }
    
    .main-navbar .nav-item.open > .dropdown-menu {
      display: block;
    }
    
    .main-navbar .dropdown-menu li {
      list-style: none;
    }
    
    .main-navbar .dropdown-menu a { 
      color: white; 
      padding: 12px 22px; 
      display: block; 
      transition: all .2s ease;
      font-size: 13px;
      border-left: 3px solid transparent;
    }
    
    .main-navbar .dropdown-menu a:hover { 
      background: rgba(255,235,59,.15);
      border-left-color: #ffeb3b;
      text-decoration: none;
    }
    
    .main-navbar .dropdown-menu i {
      margin-right: 10px;
      width: 16px;
    }

    /* Estilos para dropdown dinámico */
    .main-navbar .nav-item.dropdown > .nav-link {
      cursor: pointer;
    }

    .main-navbar .nav-item.dropdown:hover > .dropdown-menu,
    .main-navbar .nav-item.dropdown.open > .dropdown-menu {
      display: block !important;
    }
    
    /* Navbar Right */
    .navbar-right {
      flex: 0 !important;
      margin-left: auto;
    }
    
    
    /* Content */
    .content-wrapper { 
      flex: 1; 
      background: #f4f6f9;
      padding: 30px;
      overflow-y: auto;
    }
    
    .content-header {
      margin-bottom: 30px;
      background: white;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,.05);
    }
    
    .navbar-brand-logo { 
      color: white; 
      font-weight: 700; 
      font-size: 20px; 
      padding: 12px 0;
      display: block;
      text-decoration: none;
    }
    
    .navbar-brand-logo:hover {
      color: #ffeb3b;
      text-decoration: none;
    }
    
    /* Responsive */
    @media (max-width: 768px) {
      .main-sidebar {
        width: 0;
        padding-top: 0;
      }
      .content-container {
        margin-left: 0;
      }
    }
  </style>
  <style>
    .page-title { display:flex; align-items:center; gap:10px; }
    .page-title i { color:#00c0ef; }
    .info-box { border-radius:10px; box-shadow:0 4px 10px rgba(0,0,0,.06); }
    .info-box:hover { transform:translateY(-2px); box-shadow:0 6px 14px rgba(0,0,0,.1); transition:.2s; }
    .welcome-banner { background: linear-gradient(135deg, #00c0ef 0%, #0097bc 100%); color: white; padding: 30px; border-radius: 10px; margin-bottom: 30px; }
    .welcome-banner h2 { margin: 0; font-weight: 700; }
    .welcome-banner p { margin: 8px 0 0 0; font-size: 14px; opacity: 0.95; }
    .quick-actions { display: flex; flex-wrap: wrap; gap: 15px; margin-bottom: 30px; }
    .quick-actions .btn { flex: 1; min-width: 200px; border-radius: 8px; font-weight: 600; padding: 12px; transition: .2s; }
    .quick-actions .btn:hover { transform: translateY(-2px); box-shadow: 0 4px 12px rgba(0,0,0,.15); }
    .card-simple { border-radius: 10px; border: none; box-shadow: 0 2px 8px rgba(0,0,0,.08); margin-bottom: 20px; }
    .card-simple .card-header { background: linear-gradient(135deg, #00c0ef 0%, #0097bc 100%); color: white; border-radius: 10px 10px 0 0; padding: 15px; font-weight: 600; }
    .card-simple .card-body { padding: 20px; }
    .stat-item { padding: 15px; background: #f9fbff; border-radius: 8px; border-left: 4px solid #00c0ef; margin-bottom: 10px; }
    .stat-item strong { display: block; font-size: 18px; color: #00c0ef; }
    .stat-item small { color: #6b6b6b; }
  </style>
</head>
<body style="padding-top: 0;">
<div class="wrapper">

  <!-- Sidebar -->
  <aside class="main-sidebar">
    <div class="sidebar-header">
      <i class="fa fa-graduation-cap"></i> Menú
    </div>
    <ul class="sidebar-menu">
      <li class="active"><a href="dashboardEstudiante.jsp"><i class="fa fa-dashboard"></i> <span>Inicio</span></a></li>
      <li><a href="misMaterias.jsp"><i class="fa fa-book"></i> <span>Mis Materias</span></a></li>
      <li><a href="matricula.jsp"><i class="fa fa-clipboard"></i> <span>Matrícula</span></a></li>
      <li><a href="inscripcionClases.jsp"><i class="fa fa-pencil-square-o"></i> <span>Inscripción a Clases</span></a></li>
      <li><a href="horarios.jsp"><i class="fa fa-calendar"></i> <span>Horarios</span></a></li>
      <li><a href="reporteAcademico.jsp"><i class="fa fa-file-pdf-o"></i> <span>Reporte Académico</span></a></li>
      <li><a href="historialMatriculas.jsp"><i class="fa fa-history"></i> <span>Historial de Matrículas</span></a></li>
      <li><a href="manualUsuario.jsp"><i class="fa fa-book"></i> <span>Manual de Usuario</span></a></li>
      <li><a href="acercaDe.jsp"><i class="fa fa-info-circle"></i> <span>Acerca de</span></a></li>
      <li><hr style="border-color: rgba(255,255,255,.2); margin: 15px 0;"></li>
      <li><a href="srvUsuario?accion=verPerfil&id=${sessionScope.idUsuario}"><i class="fa fa-user"></i> <span>Mi Perfil</span></a></li>
      <li><a href="cambiarContrasena.jsp"><i class="fa fa-key"></i> <span>Cambiar Contraseña</span></a></li>
      <li><a href="srvUsuario?accion=logout"><i class="fa fa-sign-out"></i> <span>Cerrar Sesión</span></a></li>
    </ul>
  </aside>

  <!-- Content Container -->
  <div class="content-container">

    <!-- Header con Logo -->
    <header class="main-header">
      <a href="dashboardEstudiante.jsp" class="navbar-brand-logo">
        <i class="fa fa-graduation-cap"></i> <b>Monster</b>University
      </a>
    </header>

    <!-- Navbar Horizontal Dinámico -->
    <nav class="main-navbar">
      <ul class="nav navbar-nav">
        <!-- Archivo Dropdown -->
        <li class="nav-item dropdown">
          <a href="#" class="nav-link" style="border-bottom: 3px solid transparent;">
            <i class="fa fa-folder"></i> Archivo
          </a>
          <ul class="dropdown-menu">
            <li><a href="srvUsuario?accion=verPerfil&id=${sessionScope.idUsuario}"><i class="fa fa-user" style="margin-right: 10px; width: 16px;"></i> Mi Perfil</a></li>
            <li><a href="cambiarContrasena.jsp"><i class="fa fa-key" style="margin-right: 10px; width: 16px;"></i> Cambiar Contraseña</a></li>
          </ul>
        </li>
        
        <!-- Administración Dropdown -->
        <li class="nav-item dropdown">
          <a href="#" class="nav-link" style="border-bottom: 3px solid transparent;">
            <i class="fa fa-cogs"></i> Administración
          </a>
          <ul class="dropdown-menu">
            <!-- Usuarios -->
            <% if (pUsuariosCrear || pUsuariosListar || pUsuariosEditar || pUsuariosVerDetalle) { %>
            <% if (pUsuariosCrear) { %>
            <li><a href="srvUsuario?accion=nuevo"><i class="fa fa-user-plus" style="margin-right: 10px; width: 16px;"></i> Crear Usuario</a></li>
            <% } %>
            <% if (pUsuariosListar) { %>
            <li><a href="srvUsuario?accion=listar"><i class="fa fa-list" style="margin-right: 10px; width: 16px;"></i> Listar Usuarios</a></li>
            <% } %>
            <% } %>
            
            <!-- Estudiantes -->
            <% if (pEstudiantesCrear || pEstudiantesListar || pEstudiantesEditar) { %>
            <% if ((pUsuariosCrear || pUsuariosListar) && (pEstudiantesCrear || pEstudiantesListar)) { %>
            <li style="border-top: 1px solid rgba(255,255,255,.1); margin: 5px 0;"></li>
            <% } %>
            <% if (pEstudiantesCrear) { %>
            <li><a href="/estudiantes/crear"><i class="fa fa-graduation-cap" style="margin-right: 10px; width: 16px;"></i> Crear Estudiante</a></li>
            <% } %>
            <% if (pEstudiantesListar) { %>
            <li><a href="/estudiantes/listar"><i class="fa fa-users" style="margin-right: 10px; width: 16px;"></i> Listar Estudiantes</a></li>
            <% } %>
            <% } %>
            
            <!-- Docentes -->
            <% if (pDocentesCrear || pDocentesListar || pDocentesEditar) { %>
            <% if ((pUsuariosCrear || pUsuariosListar || pEstudiantesCrear || pEstudiantesListar) && (pDocentesCrear || pDocentesListar)) { %>
            <li style="border-top: 1px solid rgba(255,255,255,.1); margin: 5px 0;"></li>
            <% } %>
            <% if (pDocentesCrear) { %>
            <li><a href="/docentes/crear"><i class="fa fa-user-md" style="margin-right: 10px; width: 16px;"></i> Crear Docente</a></li>
            <% } %>
            <% if (pDocentesListar) { %>
            <li><a href="/docentes/listar"><i class="fa fa-users" style="margin-right: 10px; width: 16px;"></i> Listar Docentes</a></li>
            <% } %>
            <% } %>
            
            <!-- Matrículas -->
            <% if (pMatriculasCrear || pMatriculasListar || pMatriculasEditar || pMatriculasVer || pMatriculasProcesar) { %>
            <% if ((pUsuariosCrear || pUsuariosListar || pEstudiantesCrear || pEstudiantesListar || pDocentesCrear || pDocentesListar) && (pMatriculasCrear || pMatriculasListar || pMatriculasVer || pMatriculasProcesar)) { %>
            <li style="border-top: 1px solid rgba(255,255,255,.1); margin: 5px 0;"></li>
            <% } %>
            <% if (pMatriculasCrear) { %>
            <li><a href="matricula.jsp"><i class="fa fa-plus-circle" style="margin-right: 10px; width: 16px;"></i> Crear Matrícula</a></li>
            <% } %>
            <% if (pMatriculasListar) { %>
            <li><a href="srvMatricula?accion=listar"><i class="fa fa-list-alt" style="margin-right: 10px; width: 16px;"></i> Listar Matrículas</a></li>
            <% } %>
            <% if (pMatriculasVer) { %>
            <li><a href="misMaterias.jsp"><i class="fa fa-book" style="margin-right: 10px; width: 16px;"></i> Ver Mis Matrículas</a></li>
            <% } %>
            <% if (pMatriculasProcesar) { %>
            <li><a href="srvMatricula?accion=procesar"><i class="fa fa-check-square-o" style="margin-right: 10px; width: 16px;"></i> Procesar Matrículas</a></li>
            <% } %>
            <% } %>
            
            <!-- Calificaciones -->
            <% if (pCalificacionesCrear || pCalificacionesListar || pCalificacionesEditar || pCalificacionesVer) { %>
            <% if ((pMatriculasCrear || pMatriculasListar || pMatriculasVer) && (pCalificacionesCrear || pCalificacionesListar || pCalificacionesVer)) { %>
            <li style="border-top: 1px solid rgba(255,255,255,.1); margin: 5px 0;"></li>
            <% } %>
            <% if (pCalificacionesVer) { %>
            <li><a href="reporteAcademico.jsp"><i class="fa fa-star" style="margin-right: 10px; width: 16px;"></i> Ver Calificaciones</a></li>
            <% } %>
            <% if (pCalificacionesListar) { %>
            <li><a href="/calificaciones/listar"><i class="fa fa-list-ol" style="margin-right: 10px; width: 16px;"></i> Listar Calificaciones</a></li>
            <% } %>
            <% } %>
            
            <!-- Perfiles -->
            <% if (pPerfilesCrear || pPerfilesAsignar) { %>
            <li style="border-top: 1px solid rgba(255,255,255,.1); margin: 5px 0;"></li>
            <% if (pPerfilesCrear) { %>
            <li><a href="gestionPerfiles.jsp"><i class="fa fa-shield" style="margin-right: 10px; width: 16px;"></i> Crear Perfil</a></li>
            <% } %>
            <% if (pPerfilesAsignar) { %>
            <li><a href="permisosPerfil.jsp"><i class="fa fa-lock" style="margin-right: 10px; width: 16px;"></i> Asignar Opciones</a></li>
            <% } %>
            <% } %>
            
            <!-- Sin permisos -->
            <% if (!pUsuariosCrear && !pUsuariosListar && !pEstudiantesCrear && !pEstudiantesListar && 
                   !pDocentesCrear && !pDocentesListar && !pMatriculasCrear && !pMatriculasListar && 
                   !pMatriculasVer && !pMatriculasProcesar && !pCalificacionesVer && !pCalificacionesListar && !pPerfilesCrear && !pPerfilesAsignar) { %>
            <li><a href="#" disabled style="color: #999; cursor: not-allowed;"><i class="fa fa-lock" style="margin-right: 10px; width: 16px;"></i> Sin permisos de administración</a></li>
            <% } %>
          </ul>
        </li>
        
        <!-- Procesos Dropdown -->
        <li class="nav-item dropdown">
          <a href="#" class="nav-link" style="border-bottom: 3px solid transparent;">
            <i class="fa fa-tasks"></i> Procesos
          </a>
          <ul class="dropdown-menu">
            <% if (procMatriculasInscribir || pMatriculasCrear) { %>
            <li><a href="matricula.jsp"><i class="fa fa-book" style="margin-right: 10px; width: 16px;"></i> Inscripción de Matrículas</a></li>
            <% } %>
            <% if (procMatriculasProcesar) { %>
            <li><a href="/home/procesar-matriculas"><i class="fa fa-check" style="margin-right: 10px; width: 16px;"></i> Procesar Matrículas</a></li>
            <% } %>
            <% if (procCalificacionesIngresar || pCalificacionesCrear) { %>
            <li><a href="/home/calificaciones"><i class="fa fa-pencil-square-o" style="margin-right: 10px; width: 16px;"></i> Ingreso de Calificaciones</a></li>
            <% } %>
            <% if (procHorariosGestionar) { %>
            <li><a href="horarios.jsp"><i class="fa fa-calendar" style="margin-right: 10px; width: 16px;"></i> Gestión de Horarios</a></li>
            <% } %>
            <% if (!procMatriculasInscribir && !procMatriculasProcesar && !procCalificacionesIngresar && !procHorariosGestionar && !pMatriculasCrear && !pCalificacionesCrear) { %>
            <li><a href="#" disabled style="color: #999; cursor: not-allowed;"><i class="fa fa-lock" style="margin-right: 10px; width: 16px;"></i> Sin permisos de procesos</a></li>
            <% } %>
          </ul>
        </li>
        
        <!-- Reportes Dropdown -->
        <li class="nav-item dropdown">
          <a href="#" class="nav-link" style="border-bottom: 3px solid transparent;">
            <i class="fa fa-bar-chart"></i> Reportes
          </a>
          <ul class="dropdown-menu" style="min-width: 280px;">
            <% if (rPersonalGenerar) { %>
            <li><a href="srvUsuario?accion=exportarCsv"><i class="fa fa-file-excel-o" style="margin-right: 10px; width: 16px;"></i> Descargar Personal (CSV)</a></li>
            <li><a href="srvUsuario?accion=exportarPdf"><i class="fa fa-file-pdf-o" style="margin-right: 10px; width: 16px;"></i> Descargar Personal (PDF)</a></li>
            <% } %>
            <% if (rMatriculasGenerar) { %>
            <% if (rPersonalGenerar) { %>
            <li style="border-top: 1px solid rgba(255,255,255,.1); margin: 5px 0;"></li>
            <% } %>
            <li><a href="historialMatriculas.jsp"><i class="fa fa-book" style="margin-right: 10px; width: 16px;"></i> Reportes de Matrículas</a></li>
            <% } %>
            <% if (rCalificacionesGenerar) { %>
            <% if (rMatriculasGenerar || rPersonalGenerar) { %>
            <li style="border-top: 1px solid rgba(255,255,255,.1); margin: 5px 0;"></li>
            <% } %>
            <li><a href="reporteAcademico.jsp"><i class="fa fa-graduation-cap" style="margin-right: 10px; width: 16px;"></i> Reportes de Calificaciones</a></li>
            <% } %>
            <% if (rFinancierosGenerar) { %>
            <% if (rMatriculasGenerar || rPersonalGenerar || rCalificacionesGenerar) { %>
            <li style="border-top: 1px solid rgba(255,255,255,.1); margin: 5px 0;"></li>
            <% } %>
            <li><a href="/home/reportes-financieros"><i class="fa fa-dollar" style="margin-right: 10px; width: 16px;"></i> Reportes Financieros</a></li>
            <% } %>
            <% if (!rPersonalGenerar && !rMatriculasGenerar && !rCalificacionesGenerar && !rFinancierosGenerar) { %>
            <li><a href="#" disabled style="color: #999; cursor: not-allowed;"><i class="fa fa-lock" style="margin-right: 10px; width: 16px;"></i> Sin permisos de reportes</a></li>
            <% } %>
          </ul>
        </li>
      </ul>
      
      <!-- Menú de Usuario a la Derecha -->
      <ul class="nav navbar-nav navbar-right">
        <li class="nav-item dropdown" id="navUsuario">
          <a href="#" class="nav-link dropdown-toggle" onclick="return false;">
            <i class="fa fa-user-circle"></i> ${sessionScope.nombreCompleto}
          </a>
          <ul class="dropdown-menu dropdown-menu-right">
            <li><a href="srvUsuario?accion=verPerfil&id=${sessionScope.idUsuario}"><i class="fa fa-user"></i> Mi Perfil</a></li>
            <li><a href="cambiarContrasena.jsp"><i class="fa fa-key"></i> Cambiar Contraseña</a></li>
            <li style="border-top: 1px solid rgba(255,255,255,.1); margin: 8px 0;"></li>
            <li><a href="srvUsuario?accion=logout"><i class="fa fa-sign-out"></i> Cerrar Sesión</a></li>
          </ul>
        </li>
      </ul>
    </nav>

  <!-- Content -->
  <div class="content-wrapper">
    <section class="content-header">
      <h1 class="page-title">
        <i class="fa fa-graduation-cap" style="color: #0084d6;"></i>
        <span style="font-size: 28px; color: #333; font-weight: 700;">Dashboard Estudiante</span>
        <small style="margin-left:15px; color:#999; font-weight: 500; font-size: 14px;">Bienvenido a tu espacio académico</small>
      </h1>
    </section>

    <section class="content">
      
      <!-- DEBUG: Mostrar permisos del usuario (TEMPORAL - ELIMINAR DESPUÉS) -->
      <div class="row" style="margin-bottom: 20px;">
        <div class="col-md-12">
          <div class="alert alert-info">
            <h4><i class="fa fa-info-circle"></i> DEBUG - Permisos del Usuario (ID: ${sessionScope.idUsuario})</h4>
            <p><strong>Total de permisos:</strong> <%= permisosUsuario != null ? permisosUsuario.size() : 0 %></p>
            <% if (permisosUsuario != null && !permisosUsuario.isEmpty()) { %>
            <ul style="max-height: 300px; overflow-y: auto; background: #f9f9f9; padding: 15px; border-radius: 5px;">
              <% for (String permiso : permisosUsuario) { %>
              <li><code><%= permiso %></code></li>
              <% } %>
            </ul>
            <% } else { %>
            <p class="text-danger"><strong>⚠️ El usuario NO tiene permisos asignados. Verifica que tenga un perfil asignado.</strong></p>
            <% } %>
          </div>
        </div>
      </div>

      <!-- Mensaje de Bienvenida -->
      <div class="welcome-banner">
        <h2 style="font-size: 28px;">¡Hola, ${sessionScope.nombreCompleto}!</h2>
        <p style="font-size: 16px; margin-top: 12px;">Bienvenido a Monster University. Accede a tu información académica, calificaciones y horarios desde el menú superior.</p>
      </div>

      <!-- Acciones Rápidas -->
      <div class="row" style="margin-bottom: 30px;">
        <div class="col-md-6 col-sm-12 mb-3">
          <a href="matricula.jsp" class="btn btn-primary btn-block" style="padding: 15px; font-size: 16px; border-radius: 8px;">
            <i class="fa fa-graduation-cap"></i> Mis Matrículas
          </a>
        </div>
        <div class="col-md-6 col-sm-12 mb-3">
          <a href="misMaterias.jsp" class="btn btn-info btn-block" style="padding: 15px; font-size: 16px; border-radius: 8px;">
            <i class="fa fa-book"></i> Mis Materias
          </a>
        </div>
        <div class="col-md-6 col-sm-12 mb-3">
          <a href="horarios.jsp" class="btn btn-warning btn-block" style="padding: 15px; font-size: 16px; border-radius: 8px;">
            <i class="fa fa-calendar"></i> Mi Horario
          </a>
        </div>
        <div class="col-md-6 col-sm-12 mb-3">
          <a href="reporteAcademico.jsp" class="btn btn-success btn-block" style="padding: 15px; font-size: 16px; border-radius: 8px;">
            <i class="fa fa-file-pdf-o"></i> Reportes
          </a>
        </div>
      </div>

      <!-- Fila de estadísticas -->
      <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box" style="border-radius: 8px; border: none; box-shadow: 0 3px 12px rgba(0,0,0,.08);">
            <span class="info-box-icon" style="background: #0084d6; border-radius: 8px 0 0 8px;"><i class="fa fa-book"></i></span>
            <div class="info-box-content">
              <span class="info-box-text" style="color: #666; font-size: 13px;">Cursos Inscritos</span>
              <span class="info-box-number" style="color: #0084d6; font-size: 28px; font-weight: 700;">5</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box" style="border-radius: 8px; border: none; box-shadow: 0 3px 12px rgba(0,0,0,.08);">
            <span class="info-box-icon" style="background: #28a745; border-radius: 8px 0 0 8px;"><i class="fa fa-check-circle"></i></span>
            <div class="info-box-content">
              <span class="info-box-text" style="color: #666; font-size: 13px;">Cursos Completados</span>
              <span class="info-box-number" style="color: #28a745; font-size: 28px; font-weight: 700;">12</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box" style="border-radius: 8px; border: none; box-shadow: 0 3px 12px rgba(0,0,0,.08);">
            <span class="info-box-icon" style="background: #ffc107; border-radius: 8px 0 0 8px;"><i class="fa fa-star"></i></span>
            <div class="info-box-content">
              <span class="info-box-text" style="color: #666; font-size: 13px;">Promedio General</span>
              <span class="info-box-number" style="color: #ffc107; font-size: 28px; font-weight: 700;">8.5</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box" style="border-radius: 8px; border: none; box-shadow: 0 3px 12px rgba(0,0,0,.08);">
            <span class="info-box-icon" style="background: #17a2b8; border-radius: 8px 0 0 8px;"><i class="fa fa-clock-o"></i></span>
            <div class="info-box-content">
              <span class="info-box-text" style="color: #666; font-size: 13px;">Semestre Actual</span>
              <span class="info-box-number" style="color: #17a2b8; font-size: 28px; font-weight: 700;">3</span>
            </div>
          </div>
        </div>
      </div>

      <!-- Información Académica -->
      <div class="row">
        <div class="col-md-6">
          <div class="card-simple">
            <div class="card-header">
              <i class="fa fa-graduation-cap"></i> Información Académica
            </div>
            <div class="card-body">
              <div class="stat-item">
                <strong>ID Estudiante</strong>
                <small>${sessionScope.idUsuario}</small>
              </div>
              <div class="stat-item">
                <strong>Carrera</strong>
                <small>Ingeniería en Sistemas</small>
              </div>
              <div class="stat-item">
                <strong>Ciclo/Semestre</strong>
                <small>3er Semestre</small>
              </div>
              <div class="stat-item">
                <strong>Estado</strong>
                <small><span class="label label-success">Activo</span></small>
              </div>
            </div>
          </div>
        </div>

        <div class="col-md-6">
          <div class="card-simple">
            <div class="card-header">
              <i class="fa fa-user"></i> Información Personal
            </div>
            <div class="card-body">
              <div class="stat-item">
                <strong>Nombre</strong>
                <small>${sessionScope.nombreCompleto}</small>
              </div>
              <div class="stat-item">
                <strong>Email</strong>
                <small>${sessionScope.email}</small>
              </div>
              <div class="stat-item">
                <strong>Correo Institucional</strong>
                <small>estudiante@monsteru.edu.ec</small>
              </div>
              <div class="stat-item">
                <strong>Estado de Cuenta</strong>
                <small><span class="label label-success">Verificado</span></small>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Últimas Notificaciones -->
      <div class="row">
        <div class="col-md-12">
          <div class="card-simple">
            <div class="card-header">
              <i class="fa fa-bell"></i> Notificaciones Recientes
            </div>
            <div class="card-body">
              <div style="padding: 15px; background: #f0f7ff; border-left: 4px solid #00c0ef; border-radius: 4px; margin-bottom: 10px;">
                <strong>Calificación publicada</strong>
                <p style="margin: 8px 0 0 0; color: #6b6b6b;">La calificación del Examen de Matemáticas ha sido publicada. Puedes consultarla en tu portal.</p>
                <small style="color: #999;">Hace 2 días</small>
              </div>
              <div style="padding: 15px; background: #f0f7ff; border-left: 4px solid #00c0ef; border-radius: 4px; margin-bottom: 10px;">
                <strong>Matrícula confirmada</strong>
                <p style="margin: 8px 0 0 0; color: #6b6b6b;">Tu matrícula para el semestre 2024-2025 ha sido confirmada exitosamente.</p>
                <small style="color: #999;">Hace 1 semana</small>
              </div>
              <div style="padding: 15px; background: #f0f7ff; border-left: 4px solid #00c0ef; border-radius: 4px;">
                <strong>Cambio de horario</strong>
                <p style="margin: 8px 0 0 0; color: #6b6b6b;">El horario de la clase de Programación III ha sido modificado.</p>
                <small style="color: #999;">Hace 2 semanas</small>
              </div>
            </div>
          </div>
        </div>
      </div>

    </section>
  </div>

</div>

<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="dist/js/adminlte.min.js"></script>

<script>
  $(document).ready(function() {
    $('[data-toggle="tooltip"]').tooltip();
    
    // Dropdown behavior
    $('.nav-item.dropdown > .nav-link').click(function(e) {
      e.preventDefault();
      $(this).parent().toggleClass('open');
      $(this).parent().siblings('.dropdown').removeClass('open');
    });
    
    // Close dropdown when clicking elsewhere
    $(document).click(function(e) {
      if (!$(e.target).closest('.nav-item.dropdown').length) {
        $('.nav-item.dropdown').removeClass('open');
      }
    });
    
    // Hover effect for dropdowns (desktop)
    if (window.innerWidth > 768) {
      $('.nav-item.dropdown').hover(
        function() { $(this).addClass('open'); },
        function() { $(this).removeClass('open'); }
      );
    }
  });
</script>

</body>
</html>
