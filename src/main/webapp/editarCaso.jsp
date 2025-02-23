<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Caso</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Editar Caso</h1>
        <form action="gestionarCasos" method="post">
            <input type="hidden" name="action" value="editar">
            <input type="hidden" name="id_caso" value="${caso.idCaso}">

            <div class="mb-3">
                <label for="tipo_caso" class="form-label">Tipo de Caso</label>
                <select id="tipo_caso" name="tipo_caso" class="form-control" required>
                    <option value="Civil" ${caso.tipoCaso == 'Civil' ? 'selected' : ''}>Civil</option>
                    <option value="Penal" ${caso.tipoCaso == 'Penal' ? 'selected' : ''}>Penal</option>
                    <option value="Laboral" ${caso.tipoCaso == 'Laboral' ? 'selected' : ''}>Laboral</option>
                    <option value="Comercial" ${caso.tipoCaso == 'Comercial' ? 'selected' : ''}>Comercial</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción</label>
                <textarea id="descripcion" name="descripcion" class="form-control" rows="3" required>${caso.descripcion}</textarea>
            </div>

            <div class="mb-3">
                <label for="id_cliente" class="form-label">ID Cliente</label>
                <input type="number" id="id_cliente" name="id_cliente" value="${caso.idCliente}" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="id_abogado" class="form-label">ID Abogado</label>
                <input type="number" id="id_abogado" name="id_abogado" value="${caso.idAbogado}" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="estado_caso" class="form-label">Estado del Caso</label>
                <select id="estado_caso" name="estado_caso" class="form-control" required>
                    <option value="abierto" ${caso.estadoCaso == 'abierto' ? 'selected' : ''}>Abierto</option>
                    <option value="en_progreso" ${caso.estadoCaso == 'en_progreso' ? 'selected' : ''}>En Progreso</option>
                    <option value="cerrado" ${caso.estadoCaso == 'cerrado' ? 'selected' : ''}>Cerrado</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Guardar Cambios</button>
        </form>
        <a href="gestionarCasos?action=listar" class="btn btn-secondary mt-3"><i class="fas fa-arrow-left"></i> Regresar a la lista</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
