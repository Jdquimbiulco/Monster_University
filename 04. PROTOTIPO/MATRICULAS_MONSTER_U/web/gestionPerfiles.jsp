<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("identificar.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Gestión de Perfiles | Monster U</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <style>
    /* Polished UI helpers */
    .page-title { display:flex; align-items:center; gap:10px; }
    .page-title i { color:#3c8dbc; }
    .info-box { border-radius:10px; box-shadow:0 4px 10px rgba(0,0,0,.06); }
    .info-box:hover { transform:translateY(-1px); box-shadow:0 6px 14px rgba(0,0,0,.08); transition:.2s; }
    .table-hover>tbody>tr:hover { background:#f9fbff; }
    .label { border-radius:10px; padding:.35em .6em; font-weight:600; }
    .actions-cell .btn { margin-right:6px; }
    .nav-tabs-custom>.nav-tabs>li>a { font-weight:600; }
    .sticky-tools { position:sticky; top:0; z-index:2; background:#fff; padding:8px 0; }
  </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Header -->
  <header class="main-header">
    <a href="index.jsp" class="logo">
      <span class="logo-mini"><b>M</b>U</span>
      <span class="logo-lg"><b>Monster</b>University</span>
    </a>
    <nav class="navbar navbar-static-top">
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">${sessionScope.nombreCompleto}</span>
            </a>
            <ul class="dropdown-menu">
              <li class="user-header">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                <p>${sessionScope.nombreCompleto}<small>${sessionScope.email}</small></p>
              </li>
              <li class="user-footer">
                <div class="pull-right">
                  <a href="srvUsuario?accion=logout" class="btn btn-default btn-flat">Cerrar Sesión</a>
                </div>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>

  <!-- Sidebar -->
  <aside class="main-sidebar">
    <section class="sidebar">
      <div class="user-panel">
        <div class="pull-left image">
          <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${sessionScope.nombreCompleto}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> En línea</a>
        </div>
      </div>
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENÚ PRINCIPAL</li>
        <li><a href="index.jsp"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
        <li><a href="srvUsuario?accion=listar"><i class="fa fa-users"></i> <span>Gestión de Usuarios</span></a></li>
        <li class="active"><a href="srvPerfil?accion=listar"><i class="fa fa-shield"></i> <span>Gestión de Perfiles</span></a></li>
        <li><a href="srvUsuario?accion=logout"><i class="fa fa-sign-out"></i> <span>Cerrar Sesión</span></a></li>
      </ul>
    </section>
  </aside>

  <!-- Content -->
  <div class="content-wrapper">
    <section class="content-header">
      <h1 class="page-title">
        <i class="fa fa-shield"></i>
        <span>Gestión de Perfiles</span>
        <small style="margin-left:8px; color:#6b6b6b; font-weight:500;">Asignar perfiles a usuarios</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Inicio</a></li>
        <li class="active">Gestión de Perfiles</li>
      </ol>
    </section>

    <section class="content">

      <!-- Mensajes -->
      <c:if test="${not empty param.mensaje}">
        <div class="alert alert-${param.tipo == 'success' ? 'success' : 'danger'} alert-dismissible">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          <i class="icon fa fa-${param.tipo == 'success' ? 'check' : 'ban'}"></i> ${param.mensaje}
        </div>
      </c:if>

      <!-- Estadísticas -->
      <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-user-times"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Sin Perfil</span>
              <span class="info-box-number">${usuariosSinPerfil.size()}</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-graduation-cap"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Estudiantes</span>
              <span class="info-box-number">${estudiantesList.size()}</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-university"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Docentes</span>
              <span class="info-box-number">${docentesList.size()}</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-orange"><i class="fa fa-briefcase"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Secretarios</span>
              <span class="info-box-number">${secretariosList.size()}</span>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-shield"></i></span>
            <div class="info-box-content">
              <span class="info-box-text">Administradores</span>
              <span class="info-box-number">${administradoresList.size()}</span>
            </div>
          </div>
        </div>
      </div>


      <!-- TABS para categorías de usuarios -->
      <div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-sin-perfil" data-toggle="tab"><i class="fa fa-user-times"></i> Sin Perfil (${usuariosSinPerfil.size()})</a></li>
          <li><a href="#tab-estudiantes" data-toggle="tab"><i class="fa fa-graduation-cap"></i> Estudiantes (${estudiantesList.size()})</a></li>
            <li><a href="#tab-docentes" data-toggle="tab"><i class="fa fa-university"></i> Docentes (${docentesList.size()})</a></li>
            <li><a href="#tab-secretarios" data-toggle="tab"><i class="fa fa-briefcase"></i> Secretarios (${secretariosList.size()})</a></li>
          <li><a href="#tab-administradores" data-toggle="tab"><i class="fa fa-shield"></i> Administradores (${administradoresList.size()})</a></li>
        </ul>
        
        <div class="tab-content">
          <!-- TAB 1: Sin Perfil -->
          <div class="tab-pane active" id="tab-sin-perfil">
        <div class="box-header with-border">
          <h3 class="box-title"><i class="fa fa-users"></i> Usuarios sin Perfil Asignado</h3>
        </div>
        <div class="box-body">
          <c:choose>
            <c:when test="${empty usuariosSinPerfil}">
              <div class="alert alert-success" style="border-left: 4px solid #00a65a;">
                <i class="fa fa-check-circle"></i> <strong>¡Excelente!</strong> Todos los usuarios tienen al menos un perfil asignado.
              </div>
            </c:when>
            <c:otherwise>
              <div class="alert alert-warning" style="border-left: 4px solid #f39c12;">
                <i class="fa fa-exclamation-triangle"></i> <strong>Atención:</strong> Los siguientes usuarios no tienen perfiles asignados. Por favor, asigne un perfil a cada uno.
              </div>
              <div class="table-responsive">
                <table id="tablaSinPerfil" class="table table-bordered table-striped table-hover">
                  <thead>
                    <tr style="background: linear-gradient(135deg, #f39c12 0%, #e08e0b 100%); color: white;">
                      <th><i class="fa fa-hashtag"></i> ID</th>
                      <th><i class="fa fa-user"></i> Usuario</th>
                      <th><i class="fa fa-id-card"></i> Nombres</th>
                      <th><i class="fa fa-envelope"></i> Email</th>
                      <th><i class="fa fa-info-circle"></i> Estado</th>
                      <th style="width: 200px;"><i class="fa fa-cogs"></i> Acciones</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${usuariosSinPerfil}" var="usuario">
                      <tr>
                        <td><strong>#${usuario.usuIdUsuario}</strong></td>
                        <td>
                          <span style="font-weight: 600; color: #3c8dbc;">
                            <i class="fa fa-user-circle"></i> ${usuario.username}
                          </span>
                        </td>
                        <td>${usuario.nombreEmpleado} ${usuario.apellidoEmpleado}</td>
                        <td>
                          <a href="mailto:${usuario.emailUsuario}" style="color: #00a65a;">
                            <i class="fa fa-envelope-o"></i> ${usuario.emailUsuario}
                          </a>
                        </td>
                        <td>
                          <c:choose>
                            <c:when test="${usuario.estadoCodigo == 'A'}">
                              <span class="label label-success">
                                <i class="fa fa-check-circle"></i> Activo
                              </span>
                            </c:when>
                            <c:otherwise>
                              <span class="label label-danger">
                                <i class="fa fa-times-circle"></i> Inactivo
                              </span>
                            </c:otherwise>
                          </c:choose>
                        </td>
                        <td>
                          <button type="button" class="btn btn-primary btn-sm" 
                                  onclick="mostrarModalAsignar(${usuario.usuIdUsuario}, '${usuario.username}', '${usuario.nombreEmpleado} ${usuario.apellidoEmpleado}')">
                            <i class="fa fa-shield"></i> Asignar Perfil
                          </button>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </div>

          <!-- TAB 2: Estudiantes -->
          <div class="tab-pane" id="tab-estudiantes">
            <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title"><i class="fa fa-graduation-cap"></i> Usuarios con Perfil Estudiante</h3>
              </div>
              <div class="box-body">
                <c:choose>
                  <c:when test="${empty estudiantesList}">
                    <div class="alert alert-info" style="border-left: 4px solid #00c0ef;">
                      <i class="fa fa-info-circle"></i> No hay usuarios con perfil de estudiante.
                    </div>
                  </c:when>
                  <c:otherwise>
                    <div class="table-responsive">
                      <table id="tablaEstudiantes" class="table table-bordered table-striped table-hover">
                        <thead>
                          <tr style="background: linear-gradient(135deg, #00c0ef 0%, #0097bc 100%); color: white;">
                            <th><i class="fa fa-hashtag"></i> ID</th>
                            <th><i class="fa fa-user"></i> Usuario</th>
                            <th><i class="fa fa-id-card"></i> Nombres</th>
                            <th><i class="fa fa-envelope"></i> Email</th>
                            <th><i class="fa fa-info-circle"></i> Estado</th>
                            <th style="width: 120px;"><i class="fa fa-cogs"></i> Acciones</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${estudiantesList}" var="usuario">
                            <tr>
                              <td><strong>#${usuario.usuIdUsuario}</strong></td>
                              <td>
                                <span style="font-weight: 600; color: #00c0ef;">
                                  <i class="fa fa-user-circle"></i> ${usuario.username}
                                </span>
                              </td>
                              <td>${usuario.nombreEmpleado} ${usuario.apellidoEmpleado}</td>
                              <td>
                                <a href="mailto:${usuario.emailUsuario}" style="color: #00a65a;">
                                  <i class="fa fa-envelope-o"></i> ${usuario.emailUsuario}
                                </a>
                              </td>
                              <td>
                                <c:choose>
                                  <c:when test="${usuario.estadoCodigo == 'A'}">
                                    <span class="label label-success"><i class="fa fa-check-circle"></i> Activo</span>
                                  </c:when>
                                  <c:otherwise>
                                    <span class="label label-danger"><i class="fa fa-times-circle"></i> Inactivo</span>
                                  </c:otherwise>
                                </c:choose>
                              </td>
                              <td class="actions-cell">
                                        <button type="button" class="btn btn-primary btn-sm" 
                                                onclick="abrirModalAsignar(${usuario.usuIdUsuario}, '${usuario.username}', 'EST')"
                                                title="Asignar/editar perfil">
                                          <i class="fa fa-user-graduate"></i> Asignar Perfil
                                        </button>
                                      </td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
          </div>

          <!-- TAB 3: Docentes -->
          <div class="tab-pane" id="tab-docentes">
            <div class="box box-success">
              <div class="box-header with-border">
                <h3 class="box-title"><i class="fa fa-university"></i> Usuarios con Perfil Docente</h3>
              </div>
              <div class="box-body">
                <c:choose>
                  <c:when test="${empty docentesList}">
                    <div class="alert alert-info" style="border-left: 4px solid #00c0ef;">
                      <i class="fa fa-info-circle"></i> No hay usuarios con perfil de docente.
                    </div>
                  </c:when>
                  <c:otherwise>
                    <div class="table-responsive">
                      <table id="tablaDocentes" class="table table-bordered table-striped table-hover">
                        <thead>
                          <tr style="background: linear-gradient(135deg, #00a65a 0%, #008040 100%); color: white;">
                            <th><i class="fa fa-hashtag"></i> ID</th>
                            <th><i class="fa fa-user"></i> Usuario</th>
                            <th><i class="fa fa-id-card"></i> Nombres</th>
                            <th><i class="fa fa-envelope"></i> Email</th>
                            <th><i class="fa fa-info-circle"></i> Estado</th>
                            <th style="width: 120px;"><i class="fa fa-cogs"></i> Acciones</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${docentesList}" var="usuario">
                            <tr>
                              <td><strong>#${usuario.usuIdUsuario}</strong></td>
                              <td>
                                <span style="font-weight: 600; color: #00a65a;">
                                  <i class="fa fa-user-circle"></i> ${usuario.username}
                                </span>
                              </td>
                              <td>${usuario.nombreEmpleado} ${usuario.apellidoEmpleado}</td>
                              <td>
                                <a href="mailto:${usuario.emailUsuario}" style="color: #00a65a;">
                                  <i class="fa fa-envelope-o"></i> ${usuario.emailUsuario}
                                </a>
                              </td>
                              <td>
                                <c:choose>
                                  <c:when test="${usuario.estadoCodigo == 'A'}">
                                    <span class="label label-success"><i class="fa fa-check-circle"></i> Activo</span>
                                  </c:when>
                                  <c:otherwise>
                                    <span class="label label-danger"><i class="fa fa-times-circle"></i> Inactivo</span>
                                  </c:otherwise>
                                </c:choose>
                              </td>
                              <td class="actions-cell">
                                <button type="button" class="btn btn-success btn-sm" 
                                        onclick="abrirModalAsignar(${usuario.usuIdUsuario}, '${usuario.username}', 'DOC')"
                                        title="Asignar/editar perfil">
                                  <i class="fa fa-university"></i> Asignar Perfil
                                </button>
                              </td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
          </div>

          <!-- TAB 4: Secretarios -->
          <div class="tab-pane" id="tab-secretarios">
            <div class="box box-warning">
              <div class="box-header with-border">
                <h3 class="box-title"><i class="fa fa-briefcase"></i> Usuarios con Perfil Secretario Académico</h3>
              </div>
              <div class="box-body">
                <c:choose>
                  <c:when test="${empty secretariosList}">
                    <div class="alert alert-info" style="border-left: 4px solid #00c0ef;">
                      <i class="fa fa-info-circle"></i> No hay usuarios con perfil de secretario académico.
                    </div>
                  </c:when>
                  <c:otherwise>
                    <div class="table-responsive">
                      <table id="tablaSecretarios" class="table table-bordered table-striped table-hover">
                        <thead>
                          <tr style="background: linear-gradient(135deg, #f39c12 0%, #e08e0b 100%); color: white;">
                            <th><i class="fa fa-hashtag"></i> ID</th>
                            <th><i class="fa fa-user"></i> Usuario</th>
                            <th><i class="fa fa-id-card"></i> Nombres</th>
                            <th><i class="fa fa-envelope"></i> Email</th>
                            <th><i class="fa fa-info-circle"></i> Estado</th>
                            <th style="width: 120px;"><i class="fa fa-cogs"></i> Acciones</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${secretariosList}" var="usuario">
                            <tr>
                              <td><strong>#${usuario.usuIdUsuario}</strong></td>
                              <td>
                                <span style="font-weight: 600; color: #f39c12;">
                                  <i class="fa fa-user-circle"></i> ${usuario.username}
                                </span>
                              </td>
                              <td>${usuario.nombreEmpleado} ${usuario.apellidoEmpleado}</td>
                              <td>
                                <a href="mailto:${usuario.emailUsuario}" style="color: #00a65a;">
                                  <i class="fa fa-envelope-o"></i> ${usuario.emailUsuario}
                                </a>
                              </td>
                              <td>
                                <c:choose>
                                  <c:when test="${usuario.estadoCodigo == 'A'}">
                                    <span class="label label-success"><i class="fa fa-check-circle"></i> Activo</span>
                                  </c:when>
                                  <c:otherwise>
                                    <span class="label label-danger"><i class="fa fa-times-circle"></i> Inactivo</span>
                                  </c:otherwise>
                                </c:choose>
                              </td>
                              <td class="actions-cell">
                                <button type="button" class="btn btn-warning btn-sm" 
                                        onclick="abrirModalAsignar(${usuario.usuIdUsuario}, '${usuario.username}', 'SEC')"
                                        title="Asignar/editar perfil">
                                  <i class="fa fa-briefcase"></i> Asignar Perfil
                                </button>
                              </td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
          </div>

          <!-- TAB 5: Administradores -->
          <div class="tab-pane" id="tab-administradores">
            <div class="box box-danger">
              <div class="box-header with-border">
                <h3 class="box-title"><i class="fa fa-shield"></i> Usuarios con Perfil Administrador</h3>
              </div>
              <div class="box-body">
                <c:choose>
                  <c:when test="${empty administradoresList}">
                    <div class="alert alert-info" style="border-left: 4px solid #00c0ef;">
                      <i class="fa fa-info-circle"></i> No hay usuarios con perfil de administrador.
                    </div>
                  </c:when>
                  <c:otherwise>
                    <div class="table-responsive">
                      <table id="tablaAdministradores" class="table table-bordered table-striped table-hover">
                        <thead>
                          <tr style="background: linear-gradient(135deg, #dd4b39 0%, #ac2925 100%); color: white;">
                            <th><i class="fa fa-hashtag"></i> ID</th>
                            <th><i class="fa fa-user"></i> Usuario</th>
                            <th><i class="fa fa-id-card"></i> Nombres</th>
                            <th><i class="fa fa-envelope"></i> Email</th>
                            <th><i class="fa fa-info-circle"></i> Estado</th>
                            <th style="width: 120px;"><i class="fa fa-cogs"></i> Acciones</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach items="${administradoresList}" var="usuario">
                            <tr>
                              <td><strong>#${usuario.usuIdUsuario}</strong></td>
                              <td>
                                <span style="font-weight: 600; color: #dd4b39;">
                                  <i class="fa fa-user-circle"></i> ${usuario.username}
                                </span>
                              </td>
                              <td>${usuario.nombreEmpleado} ${usuario.apellidoEmpleado}</td>
                              <td>
                                <a href="mailto:${usuario.emailUsuario}" style="color: #00a65a;">
                                  <i class="fa fa-envelope-o"></i> ${usuario.emailUsuario}
                                </a>
                              </td>
                              <td>
                                <c:choose>
                                  <c:when test="${usuario.estadoCodigo == 'A'}">
                                    <span class="label label-success"><i class="fa fa-check-circle"></i> Activo</span>
                                  </c:when>
                                  <c:otherwise>
                                    <span class="label label-danger"><i class="fa fa-times-circle"></i> Inactivo</span>
                                  </c:otherwise>
                                </c:choose>
                              </td>
                              <td class="actions-cell">
                                <button type="button" class="btn btn-danger btn-sm" 
                                        onclick="abrirModalAsignar(${usuario.usuIdUsuario}, '${usuario.username}', 'ADM')"
                                        title="Asignar/editar perfil">
                                  <i class="fa fa-shield"></i> Asignar Perfil
                                </button>
                              </td>
                            </tr>
                          </c:forEach>
                        </tbody>
                      </table>
                    </div>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>
          </div>
        </div>
      </div>

    </section>
  </div>

  <!-- Footer -->
  <footer class="main-footer">
    <div class="pull-right hidden-xs"><b>Version</b> 1.0.0</div>
    <strong>Copyright &copy; 2024 Monster University.</strong> Todos los derechos reservados.
  </footer>
</div>

<!-- Modal Asignar Perfil -->
<div class="modal fade" id="modalAsignarPerfil" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" style="background: linear-gradient(135deg, #3c8dbc 0%, #2c6fa3 100%); color: white;">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" style="color: white;">&times;</span>
        </button>
        <h4 class="modal-title">
          <i class="fa fa-shield"></i> Asignar Perfil a Usuario
        </h4>
      </div>
      <form action="srvPerfil" method="POST">
        <input type="hidden" name="accion" value="asignarPerfil">
        <input type="hidden" name="idUsuario" id="modalIdUsuario">
        
        <div class="modal-body">
          <div class="alert alert-info" style="border-left: 4px solid #3c8dbc;">
            <i class="fa fa-info-circle"></i> Asignando perfil a: <strong id="modalNombreUsuario"></strong>
          </div>
          
          <div class="form-group">
            <label>Seleccione el Perfil <span class="text-danger">*</span></label>
            <select name="idPerfil" id="modalSelectPerfil" class="form-control" required>
              <option value="">-- Seleccione un perfil --</option>
              <c:forEach items="${perfilesDisponibles}" var="perfil">
                <option value="${perfil.codigo}">
                  <i class="fa fa-shield"></i> ${perfil.descripcion}
                </option>
              </c:forEach>
            </select>
            <small class="text-muted">El usuario tendrá acceso según el perfil seleccionado</small>
          </div>
        </div>
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">
            <i class="fa fa-times"></i> Cancelar
          </button>
          <button type="submit" class="btn btn-primary">
            <i class="fa fa-save"></i> Asignar Perfil
          </button>
        </div>
      </form>
    </div>
  </div>
</div>

<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="dist/js/adminlte.min.js"></script>

<script>
  // Inicializar DataTables
  $(document).ready(function() {
    var options = {
      "language": {
        "url": "//cdn.datatables.net/plug-ins/1.10.24/i18n/Spanish.json"
      },
      "pageLength": 10,
      "order": [[0, "asc"]],
      "autoWidth": false
    };
    
    $('#tablaSinPerfil').DataTable(options);
    $('#tablaEstudiantes').DataTable(options);
    $('#tablaDocentes').DataTable(options);
    $('#tablaSecretarios').DataTable(options);
    $('#tablaAdministradores').DataTable(options);

    // Persist active tab between reloads
    var saved = localStorage.getItem('gp_active_tab');
    if (saved) {
      $('.nav-tabs a[href="' + saved + '"]').tab('show');
    }
    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      localStorage.setItem('gp_active_tab', $(e.target).attr('href'));
    });

  });

  // Mostrar modal para asignar perfil
  function mostrarModalAsignar(idUsuario, username, nombreCompleto) {
    $('#modalIdUsuario').val(idUsuario);
    $('#modalNombreUsuario').text(username + ' (' + nombreCompleto + ')');
    $('#modalAsignarPerfil').modal('show');
  }
  
  // Función simplificada para abrir modal (sin nombre completo)
  function abrirModalAsignar(idUsuario, username, defaultPrefix) {
    $('#modalIdUsuario').val(idUsuario);
    $('#modalNombreUsuario').text(username);
    // Preseleccionar por prefijo (EST, DOC, SEC, ADM)
    if (defaultPrefix) {
      var sel = document.getElementById('modalSelectPerfil');
      var foundIndex = -1;
      for (var i = 0; i < sel.options.length; i++) {
        var v = (sel.options[i].value || '').toUpperCase();
        var t = (sel.options[i].text || '').toUpperCase();
        if (v.startsWith(defaultPrefix) || t.indexOf(prefixNombre(defaultPrefix)) !== -1) {
          foundIndex = i; break;
        }
      }
      if (foundIndex >= 0) sel.selectedIndex = foundIndex;
    }
    $('#modalAsignarPerfil').modal('show');
  }

  function prefixNombre(prefix) {
    switch ((prefix || '').toUpperCase()) {
      case 'EST': return 'ESTUD';
      case 'DOC': return 'DOCENT';
      case 'SEC': return 'SECRET';
      case 'ADM': return 'ADMIN';
      default: return '';
    }
  }
</script>

</body>
</html>
