<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crear Caso</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Crear Caso</h1>
        <form action="gestionarCasos" method="post">
            <input type="hidden" name="action" value="crear">
            
            <!-- Selector para Tipo de Caso -->
            <div class="mb-3">
                <label for="tipo_caso" class="form-label">Tipo de Caso</label>
                <select id="tipo_caso" name="tipo_caso" class="form-control" required>
                    <option value="Civil">Civil</option>
                    <option value="Penal">Penal</option>
                    <option value="Laboral">Laboral</option>
                    <option value="Comercial">Comercial</option>
                    <option value="Administrativo">Administrativo</option>
                </select>
            </div>
            
            <!-- Input para Descripción -->
            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción</label>
                <textarea id="descripcion" name="descripcion" class="form-control" rows="3" required></textarea>
            </div>
            
            <!-- Input para ID Cliente -->
            <div class="mb-3">
                <label for="id_cliente" class="form-label">ID Cliente</label>
                <input type="number" id="id_cliente" name="id_cliente" class="form-control" required>
            </div>
            
            <!-- Input para ID Abogado -->
            <div class="mb-3">
                <label for="id_abogado" class="form-label">ID Abogado</label>
                <input type="number" id="id_abogado" name="id_abogado" class="form-control" required>
            </div>
            
            <!-- Selector para Estado del Caso -->
            <div class="mb-3">
                <label for="estado_caso" class="form-label">Estado del Caso</label>
                <select id="estado_caso" name="estado_caso" class="form-control" required>
                    <option value="abierto">Abierto</option>
                    <option value="en_progreso">En Progreso</option>
                    <option value="cerrado">Cerrado</option>
                </select>
            </div>
            
            <!-- Input para Estado -->
            <div class="mb-3">
                <label for="estado" class="form-label">Estado</label>
                <input type="text" id="estado" name="estado" class="form-control" required>
            </div>
            
            <!-- Input para Tipo -->
            <div class="mb-3">
                <label for="tipo" class="form-label">Tipo</label>
                <input type="text" id="tipo" name="tipo" class="form-control" required>
            </div>
            
            <!-- Input para ID Usuario -->
            <div class="mb-3">
                <label for="id_usuario" class="form-label">ID Usuario</label>
                <input type="number" id="id_usuario" name="id_usuario" class="form-control" required>
            </div>
            
            <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Crear Caso</button>
        </form>
        <a href="gestionarCasos?action=listar" class="btn btn-secondary mt-3"><i class="fas fa-arrow-left"></i> Regresar a la lista</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
