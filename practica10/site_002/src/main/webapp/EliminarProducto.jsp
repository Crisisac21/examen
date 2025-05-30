<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.util.*, com.producto.seguridad.Pagina, com.producto.negocio.Product" session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Confirmar Eliminación</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="css/estilo.css" rel="stylesheet">
</head>
<body>

<!-- ENCABEZADO -->
<header class="bg-dark text-white py-3">
    <div class="container d-flex align-items-center">
        <img class="me-3" src="Imagenes/logan.jpg" alt="Logo de la Tienda" style="height: 60px;">
        <h1 class="h4 mb-0">Christian Labrys - Eliminar Producto</h1>
    </div>
</header>

<%
    Integer perfil = (Integer) session.getAttribute("perfil");
    Pagina pag = new Pagina();
    String menu = pag.mostrarMenu(perfil);
    out.print(menu);
%>

<div class="container my-5">
<%
    String id = request.getParameter("id");
    if (id != null && !id.trim().isEmpty()) {
        Product producto = new Product();
        String tabla = producto.buscarProductoPorId(id);
%>
    <div class="card shadow border-danger">
        <div class="card-body">
            <h3 class="text-danger">¿Estás seguro de que deseas eliminar el siguiente producto?</h3>
            <div class="table-responsive mt-3 mb-4">
                <%= tabla %>
            </div>

            <!-- Botón que activa el modal de confirmación -->
            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmarModal">
                Confirmar Eliminación
            </button>
            <a href="productos.jsp" class="btn btn-secondary">Cancelar</a>

            <!-- Modal de confirmación -->
            <div class="modal fade" id="confirmarModal" tabindex="-1" aria-labelledby="confirmarModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <form method="post" action="procesarEliminacion.jsp">
                        <div class="modal-content">
                            <div class="modal-header bg-danger text-white">
                                <h5 class="modal-title" id="confirmarModalLabel">Confirmar Eliminación</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                            </div>
                            <div class="modal-body">
                                Esta acción no se puede deshacer. ¿Deseas continuar?
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" name="id" value="<%= id %>">
                                <input type="hidden" name="confirmar" value="si">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-danger">Eliminar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
<%
    } else {
%>
    <div class="alert alert-danger" role="alert">
        ID de producto no especificado.
    </div>
<%
    }
%>
</div>

<footer class="bg-light py-4 mt-5">
    <div class="container text-center">
        <p class="mb-2">© 2025 Christian Labrys - Derechos reservados</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
