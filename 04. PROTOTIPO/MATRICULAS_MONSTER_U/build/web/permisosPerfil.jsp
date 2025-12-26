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
  <title>Permisos | Monster U</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <style>
    .page-title { display:flex; align-items:center; gap:10px; }
    .page-title i { color:#3c8dbc; }
    .perfil-selector { background:#f4f4f4; padding:20px; border-radius:10px; margin-bottom:20px; }
    .perfil-btn { margin:5px; border-radius:8px; font-weight:600; transition:.2s; }
    .perfil-btn:hover { transform:translateY(-2px); box-shadow:0 4px 10px rgba(0,0,0,.15); }
    .perfil-btn.active { box-shadow:0 4px 15px rgba(0,0,0,.25); }
    .modulo-section { margin-bottom:20px; }
    .modulo-header { background:linear-gradient(135deg, #3c8dbc 0%, #2c6fa3 100%); color:white; padding:12px; border-radius:8px 8px 0 0; font-weight:700; }
    .permisos-list { background:#fff; border:1px solid #ddd; border-top:none; border-radius:0 0 8px 8px; padding:15px; }
    .permiso-item { padding:10px; margin-bottom:8px; background:#f9fbff; border-left:4px solid #3c8dbc; border-radius:4px; display:flex; align-items:center; }
    .permiso-item:hover { background:#f0f7ff; }
    .permiso-item input[type="checkbox"] { margin-right:12px; width:18px; height:18px; cursor:pointer; }
    .permiso-label { cursor:pointer; flex:1; margin:0; }
    .permiso-title { font-weight:700; color:#1e3a5f; }
    .btn-guardar { margin-top:20px; padding:12px 30px; font-weight:700; border-radius:8px; }
    .alert { border-radius:8px; }

    /* Category grouping UI */
    .categoria-header { background:#eef6fc; color:#1e3a5f; padding:10px 12px; border:1px solid #d6e7f5; border-radius:8px; font-weight:700; display:flex; align-items:center; justify-content:space-between; }
    .categoria-header:hover { background:#e6f2fa; cursor:pointer; }
    .categoria-section { margin:12px 0 20px; }
    .categoria-list { border:1px solid #ddd; border-top:none; border-radius:0 0 8px 8px; padding:10px; background:#fff; }
    .domain-label { margin-left:8px; font-size:11px; background:#e9ecef; color:#555; }
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
        <li><a href="srvPerfil?accion=listar"><i class="fa fa-shield"></i> <span>Gestión de Perfiles</span></a></li>
        <li class="active"><a href="srvPermisos?accion=listar"><i class="fa fa-lock"></i> <span>Permisos</span></a></li>
        <li><a href="srvUsuario?accion=logout"><i class="fa fa-sign-out"></i> <span>Cerrar Sesión</span></a></li>
      </ul>
    </section>
  </aside>

  <!-- Content -->
  <div class="content-wrapper">
    <section class="content-header">
      <h1 class="page-title">
        <i class="fa fa-lock"></i>
        <span>Gestión de Permisos</span>
        <small style="margin-left:8px; color:#6b6b6b; font-weight:500;">Asignar opciones a perfiles</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Inicio</a></li>
        <li class="active">Permisos</li>
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

      <div class="box box-primary">
        <div class="box-header with-border">
          <h3 class="box-title"><i class="fa fa-list-check"></i> Opciones por Perfil</h3>
        </div>
        <div class="box-body">

          <!-- Selector de Perfiles -->
          <div class="perfil-selector">
            <h4><i class="fa fa-user-shield"></i> Seleccione un Perfil</h4>
            <div style="display:flex; flex-wrap:wrap; gap:10px; margin-top:10px;">
              <c:forEach items="${perfiles}" var="perfil">
                <a href="srvPermisos?codigoPerfil=${perfil.codigo}" 
                   class="btn perfil-btn ${perfil.codigo == perfilSeleccionado ? 'active btn-primary' : 'btn-default'}" 
                   style="flex-basis:auto;">
                  <i class="fa fa-user"></i> ${perfil.descripcion}
                </a>
              </c:forEach>
            </div>
          </div>

          <!-- Formulario de Permisos -->
          <form action="srvPermisos" method="POST" id="formPermisos">
            <input type="hidden" name="accion" value="guardarPermisos">
            <input type="hidden" name="codigoPerfil" value="${perfilSeleccionado}">

            <c:if test="${empty permisosPorModulo}">
              <div class="alert alert-info">
                <i class="fa fa-info-circle"></i> No hay permisos disponibles para configurar.
              </div>
            </c:if>

            <c:forEach items="${permisosPorModulo}" var="modulo">
              <c:if test="${modulo.key == 'PERSONAL' || modulo.key == 'ACADEMICO' || modulo.key == 'SEGURIDAD' || modulo.key == 'FINANZAS'}">
              <div class="modulo-section">
                <div class="modulo-header">
                  <i class="fa fa-folder-open"></i> ${modulo.key}
                  <span class="badge badge-light" style="margin-left:10px;">
                    ${modulo.value.size()} opción(es)
                  </span>
                </div>

                <!-- Categorías por sección -->
                <div class="categoria-section" data-categoria="administracion">
                  <div class="categoria-header">
                    <span><i class="fa fa-shield"></i> Administración</span>
                  </div>
                  <div class="permisos-list categoria-list"></div>
                </div>

                <div class="categoria-section" data-categoria="procesos">
                  <div class="categoria-header">
                    <span><i class="fa fa-cogs"></i> Procesos</span>
                  </div>
                  <div class="permisos-list categoria-list"></div>
                </div>

                <div class="categoria-section" data-categoria="reportes">
                  <div class="categoria-header">
                    <span><i class="fa fa-bar-chart"></i> Reportes</span>
                  </div>
                  <div class="permisos-list categoria-list"></div>
                </div>

                <!-- Lista cruda (se distribuye vía JS por categoría) -->
                <div class="permisos-list raw-list" style="display:none;">
                  <c:forEach items="${modulo.value}" var="permiso">
                    <div class="permiso-item" data-codigo="${permiso.codigo}">
                      <input type="checkbox" 
                             id="permiso_${permiso.codigo}" 
                             name="permiso_${permiso.codigo}"
                             ${permiso.isAsignado() ? 'checked' : ''}
                             value="1">
                      <label for="permiso_${permiso.codigo}" class="permiso-label">
                        <div class="permiso-title">${permiso.descripcion}</div>
                      </label>
                    </div>
                  </c:forEach>
                </div>
              </div>
              </c:if>
            </c:forEach>

            <c:if test="${not empty permisosPorModulo}">
              <button type="submit" class="btn btn-success btn-guardar btn-block">
                <i class="fa fa-save"></i> Actualizar Opciones
              </button>
            </c:if>
          </form>

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

<script src="bower_components/jquery/dist/jquery.min.js"></script>
<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="dist/js/adminlte.min.js"></script>

<script>
  $(document).ready(function() {
    // Validar que al menos un permiso esté seleccionado
    $('#formPermisos').on('submit', function(e) {
      var checkedPermisos = $('input[type="checkbox"]:checked').length;
      if (checkedPermisos === 0) {
        e.preventDefault();
        alert('⚠️ Por favor selecciona al menos un permiso');
        return false;
      }
    });

    // Guardar preferencias locales de módulos expandidos
    $('.modulo-header').on('click', function() {
      $(this).siblings('.permisos-list').slideToggle(200);
    });

    // Agrupar por categoría/domino según el código
    $('.modulo-section').each(function() {
      var $section = $(this);
      var $rawItems = $section.find('.raw-list .permiso-item');
      $rawItems.each(function() {
        var $item = $(this);
        var code = ($item.data('codigo') || '').toString();
        var parts = code.split('.');
        var categoria = parts.length > 1 ? parts[1] : 'administracion';
        var dominio = parts.length > 2 ? parts[2] : '';

        // Mappear 'gestion' a 'administracion' para retro-compatibilidad
        if (categoria === 'gestion') categoria = 'administracion';

        // Añadir etiqueta de dominio visual
        if (dominio && $item.find('.domain-label').length === 0) {
          $item.find('.permiso-title').append(' <span class="label label-default domain-label" title="Dominio">' + dominio + '</span>');
        }

        // Contenedor destino por categoría
        var $target = $section.find('.categoria-section[data-categoria="' + categoria + '"] .categoria-list');
        if ($target.length) {
          $target.append($item);
        } else {
          // Fallback: agregar a Administración
          $section.find('.categoria-section[data-categoria="administracion"] .categoria-list').append($item);
        }
      });

      // Mostrar/ocultar categorías vacías y contar elementos
      $section.find('.categoria-section').each(function() {
        var $cat = $(this);
        var count = $cat.find('.permiso-item').length;
        if (count === 0) {
          $cat.hide();
        } else {
          $cat.find('.categoria-header').append('<span class="badge" style="margin-left:8px;">' + count + '</span>');
        }
      });

      // Ocultar la lista cruda
      $section.find('.raw-list').remove();
    });

    // Toggle de cada categoría
    $('.categoria-header').on('click', function() {
      $(this).siblings('.categoria-list').slideToggle(150);
    });
  });
</script>

</body>
</html>
