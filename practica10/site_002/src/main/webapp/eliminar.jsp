<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="java.util.*, com.producto.seguridad.Usuario, com.producto.seguridad.Pagina, com.producto.negocio.Product" session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Eliminar Producto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <
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

<!-- MENÚ -->
<%
    Integer perfil = (Integer) session.getAttribute("perfil");
    Pagina pag = new Pagina();
    String menu = pag.mostrarMenu(perfil);
    out.print(menu);
%>

<!-- CUERPO -->
<div class="container my-5">
<%
    String id = request.getParameter("id");
    if (id != null && !id.trim().isEmpty()) {
        Product producto = new Product();
        String tabla = producto.buscarProductoPorId(id);
%>
    <div class="card shadow">
        <div class="card-body">
            <h2 class="card-title text-danger mb-4">¿Estás seguro de que deseas eliminar este producto?</h2>
            <div class="table-responsive mb-4">
                <%= tabla %>
            </div>

            <form action="EliminarProducto.jsp" method="post" class="d-flex gap-2">
                <input type="hidden" name="id" value="<%= id %>">
                <input type="hidden" name="confirmar" value="si">
                <button type="submit" class="btn btn-danger">Confirmar Eliminación</button>
                <a href="productos.jsp" class="btn btn-secondary">Cancelar</a>
            </form>
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

<!-- PIE DE PÁGINA -->
<footer class="bg-light py-4 mt-5">
    <div class="container text-center">
        <p class="mb-2">© 2025 Christian Labrys - Derechos reservados</p>
        <div class="d-flex justify-content-center gap-3">
            <a href="https://facebook.com"><img src="Iconos/facebook.png" alt="Facebook" width="30"></a>
            <a href="https://instagram.com"><img src="Iconos/instagram.png" alt="Instagram" width="30"></a>
            <a href="https://wa.me/5491234567890"><img src="Iconos/whatsapp.png" alt="WhatsApp" width="30"></a>
            <a href="https://www.linkedin.com/in/christian-isac-hidalgo-murillo-88a574325"><img src="Iconos/linkedin.png" alt="LinkedIn" width="30"></a>
        </div>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
