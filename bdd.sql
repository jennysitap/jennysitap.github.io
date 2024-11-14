create database arq;
use arq;


-- Crear tablas
CREATE TABLE usuarios (
    ID_usuario INT PRIMARY KEY,
    AP_paterno CHAR(50),
    AP_materno CHAR(50),
    Correo VARCHAR(50),
    Contrasena VARCHAR(20),
    Fecha_registro DATE,
    Nombre CHAR(50)
);

CREATE TABLE redes (
    ID_red INT PRIMARY KEY,
    Nombre CHAR(50),
    URL VARCHAR(100),
    Usuario CHAR(50),
    Departamento CHAR(50),
    Estado CHAR(30)
);

CREATE TABLE sesiones_de_usuario (
    ID_sesion INT PRIMARY KEY,
    ID_usuario INT,
    Token_sesion VARCHAR(15),
    Fecha_inicio DATE,
    Fecha_final DATE,
    FOREIGN KEY (ID_usuario) REFERENCES usuarios(ID_usuario) ON DELETE CASCADE
);

CREATE TABLE contactame (
    ID_mensaje INT PRIMARY KEY,
    ID_usuario INT,
    Correo VARCHAR(50),
    Telefono CHAR(10),
    Direccion VARCHAR(60),
    Nombre CHAR(50),
    AP_paterno CHAR(50),
    AP_materno CHAR(50),
    Mensaje CHAR(255),
    Fecha_envio DATE,
    ID_red INT,
    Estado CHAR(30),
    FOREIGN KEY (ID_usuario) REFERENCES usuarios(ID_usuario) ON DELETE SET NULL,
    FOREIGN KEY (ID_red) REFERENCES redes(ID_red) ON DELETE SET NULL
);

CREATE TABLE testimonios (
    ID_testimonio INT PRIMARY KEY,
    ID_usuario INT,
    Nombre CHAR(50),
    Correo VARCHAR(50),
    Comentario CHAR(255),
    Fecha_envio DATE,
    Estado CHAR(10),
    FOREIGN KEY (ID_usuario) REFERENCES usuarios(ID_usuario) ON DELETE SET NULL
);

CREATE TABLE servicios (
    ID_servicio INT PRIMARY KEY,
    Nombre CHAR(50),
    Descripcion CHAR(255),
    Precio NUMERIC(10, 2),
    Duracion VARCHAR(15),
    Categoria CHAR(50),
    Estado CHAR(10)
);

CREATE TABLE proyectos (
    ID_proyecto INT PRIMARY KEY,
    Nombre CHAR(50),
    Descripcion CHAR(255),
    Fecha_inicio DATE,
    Fecha_final DATE,
    Estado CHAR(10),
    Responsable CHAR(50),
    Categoria CHAR(50),
    ID_servicio INT,
    Precio_total NUMERIC(10, 2),
    FOREIGN KEY (ID_servicio) REFERENCES servicios(ID_servicio) ON DELETE SET NULL
);

CREATE TABLE permisos (
    ID_permiso INT PRIMARY KEY,
    Rol CHAR(50),
    Descripcion CHAR(255)
);

CREATE TABLE administradores (
    ID_admin INT PRIMARY KEY,
    ID_permiso INT,
    Nombre CHAR(50),
    Correo VARCHAR(50),
    Telefono CHAR(15),
    Contrasena VARCHAR(20),
    Estado CHAR(10),
    AP_paterno CHAR(50),
    AP_materno CHAR(50),
    FOREIGN KEY (ID_permiso) REFERENCES permisos(ID_permiso) ON DELETE SET NULL
);

CREATE TABLE restauracion (
    ID_producto INT PRIMARY KEY,
    Nombre CHAR(50),
    Marca CHAR(50),
    Descripcion CHAR(255),
    Cantidad INT,
    Precio NUMERIC(10, 2)
);

CREATE TABLE productos_r (
    ID_test INT,
    ID_producto INT,
    Fecha_inicio DATE,
    Cantidad INT,
    Fecha_final DATE,
    ID_servicio INT,
    PRIMARY KEY (ID_test, ID_producto),
    FOREIGN KEY (ID_producto) REFERENCES restauracion(ID_producto) ON DELETE CASCADE,
    FOREIGN KEY (ID_servicio) REFERENCES servicios(ID_servicio) ON DELETE SET NULL
);


-- Crear registros 
INSERT INTO usuarios (ID_usuario, AP_paterno, AP_materno, Correo, Contrasena, Fecha_registro, Nombre) VALUES
(1, 'Gomez', 'Lopez', 'juan.gomez@email.com', 'password123', '2024-01-15', 'Juan'),
(2, 'Martinez', 'Fernandez', 'maria.martinez@email.com', 'password456', '2024-02-20', 'Maria'),
(3, 'Perez', 'Sanchez', 'luis.perez@email.com', 'password789', '2024-03-10', 'Luis'),
(4, 'Hernandez', 'Diaz', 'ana.hernandez@email.com', 'password321', '2024-04-05', 'Ana'),
(5, 'Rodriguez', 'Garcia', 'carlos.rodriguez@email.com', 'password654', '2024-05-22', 'Carlos');

INSERT INTO redes (ID_red, Nombre, URL, Usuario, Departamento, Estado) VALUES
(1, 'Facebook', 'https://www.facebook.com', 'juan.gomez', 'Marketing', 'Activo'),
(2, 'Twitter', 'https://www.twitter.com', 'maria.martinez', 'Ventas', 'Inactivo'),
(3, 'Instagram', 'https://www.instagram.com', 'luis.perez', 'Soporte', 'Activo'),
(4, 'LinkedIn', 'https://www.linkedin.com', 'ana.hernandez', 'RRHH', 'Activo'),
(5, 'TikTok', 'https://www.tiktok.com', 'carlos.rodriguez', 'Comunicación', 'Inactivo');

INSERT INTO sesiones_de_usuario (ID_sesion, ID_usuario, Token_sesion, Fecha_inicio, Fecha_final) VALUES
(1, 1, 'abc123xyz', '2024-01-15', '2024-01-16'),
(2, 2, 'def456uvw', '2024-02-20', '2024-02-21'),
(3, 3, 'ghi789rst', '2024-03-10', '2024-03-11'),
(4, 4, 'jkl012opq', '2024-04-05', '2024-04-06'),
(5, 5, 'mno345abc', '2024-05-22', '2024-05-23');

INSERT INTO contactame (ID_mensaje, ID_usuario, Correo, Telefono, Direccion, Nombre, AP_paterno, AP_materno, Mensaje, Fecha_envio, ID_red, Estado) VALUES
(1, 1, 'juan.gomez@email.com', '1234567890', 'Calle Falsa 123', 'Juan', 'Gomez', 'Lopez', 'Consulta sobre el servicio de marketing', '2024-01-15', 1, 'Leído'),
(2, 2, 'maria.martinez@email.com', '2345678901', 'Avenida Siempre Viva 456', 'Maria', 'Martinez', 'Fernandez', 'Interesada en una oferta de servicios', '2024-02-20', 2, 'Pendiente'),
(3, 3, 'luis.perez@email.com', '3456789012', 'Calle Real 789', 'Luis', 'Perez', 'Sanchez', 'Quisiera más información sobre los planes', '2024-03-10', 3, 'Respondido'),
(4, 4, 'ana.hernandez@email.com', '4567890123', 'Calle Libertad 101', 'Ana', 'Hernandez', 'Diaz', 'Agradecimiento por el servicio recibido', '2024-04-05', 4, 'Leído'),
(5, 5, 'carlos.rodriguez@email.com', '5678901234', 'Avenida Centro 202', 'Carlos', 'Rodriguez', 'Garcia', 'Solicitud de cotización para nuevos servicios', '2024-05-22', 5, 'Pendiente');

INSERT INTO testimonios (ID_testimonio, ID_usuario, Nombre, Correo, Comentario, Fecha_envio, Estado) VALUES
(1, 1, 'Juan Gomez', 'juan.gomez@email.com', 'Excelente servicio de marketing digital, superó nuestras expectativas.', '2024-01-15', 'Aprobado'),
(2, 2, 'Maria Martinez', 'maria.martinez@email.com', 'Muy buenos precios y atención al cliente, recomiendo los servicios.', '2024-02-20', 'Aprobado'),
(3, 3, 'Luis Perez', 'luis.perez@email.com', 'Recibí una atención muy personalizada y los resultados fueron impresionantes.', '2024-03-10', 'Aprobado'),
(4, 4, 'Ana Hernandez', 'ana.hernandez@email.com', 'Me ayudaron a mejorar la gestión de recursos humanos, muy contenta con el servicio.', '2024-04-05', 'Pendiente'),
(5, 5, 'Carlos Rodriguez', 'carlos.rodriguez@email.com', 'Muy buen servicio de comunicación, las estrategias aplicadas fueron efectivas.', '2024-05-22', 'Pendiente');

INSERT INTO servicios (ID_servicio, Nombre, Descripcion, Precio, Duracion, Categoria, Estado) VALUES
(1, 'Consultoría SEO', 'Servicio de optimización para motores de búsqueda', 500.00, '1 mes', 'Marketing Digital', 'Activo'),
(2, 'Desarrollo Web', 'Desarrollo de sitios web personalizados', 1500.00, '2 meses', 'Tecnología', 'Activo'),
(3, 'Gestión de Redes Sociales', 'Manejo de cuentas en plataformas sociales', 400.00, '1 mes', 'Marketing Digital', 'Inactivo'),
(4, 'Asesoría en RRHH', 'Asesoría en recursos humanos y selección de personal', 800.00, '3 meses', 'Consultoría', 'Activo'),
(5, 'Video Marketing', 'Creación de contenido audiovisual para redes', 1200.00, '1 mes', 'Marketing Digital', 'Inactivo');

INSERT INTO proyectos (ID_proyecto, Nombre, Descripcion, Fecha_inicio, Fecha_final, Estado, Responsable, Categoria, ID_servicio, Precio_total) VALUES
(1, 'Optimización SEO Empresa X', 'Proyecto de mejora del posicionamiento web', '2024-01-15', '2024-02-15', 'En Progreso', 'Juan Gomez', 'Marketing Digital', 1, 500.00),
(2, 'Desarrollo Web Tienda Online', 'Creación de un sitio web e-commerce', '2024-02-20', '2024-04-20', 'En Progreso', 'Maria Martinez', 'Tecnología', 2, 1500.00),
(3, 'Campaña Redes Sociales', 'Estrategia de marketing en redes sociales', '2024-03-10', '2024-04-10', 'Completado', 'Luis Perez', 'Marketing Digital', 3, 400.00),
(4, 'Asesoría RRHH Empresa Y', 'Consultoría en recursos humanos y optimización de procesos', '2024-04-05', '2024-06-05', 'Pendiente', 'Ana Hernandez', 'Consultoría', 4, 800.00),
(5, 'Video Marketing Campaña Z', 'Creación de videos promocionales para redes', '2024-05-22', '2024-06-22', 'Pendiente', 'Carlos Rodriguez', 'Marketing Digital', 5, 1200.00);

INSERT INTO permisos (ID_permiso, Rol, Descripcion) VALUES
(1, 'Administrador', 'Acceso total a todos los sistemas y datos'),
(2, 'Usuario', 'Acceso limitado a la plataforma, solo puede ver y gestionar sus propios datos'),
(3, 'Super Usuario', 'Acceso a todos los sistemas con la capacidad de gestionar usuarios y permisos'),
(4, 'Editor', 'Acceso para crear y editar contenido, pero no modificar configuraciones o datos sensibles'),
(5, 'Visor', 'Acceso solo para visualizar información sin poder hacer modificaciones');

INSERT INTO administradores (ID_admin, ID_permiso, Nombre, Correo, Telefono, Contrasena, Estado, AP_paterno, AP_materno) VALUES
(1, 1, 'Carlos Lopez', 'carlos.lopez@empresa.com', '123456789', 'admin123', 'Activo', 'Lopez', 'Martinez'),
(2, 3, 'Laura Ruiz', 'laura.ruiz@empresa.com', '234567890', 'superuser321', 'Activo', 'Ruiz', 'Gomez'),
(3, 2, 'Ricardo Torres', 'ricardo.torres@empresa.com', '345678901', 'user123', 'Inactivo', 'Torres', 'Pérez'),
(4, 4, 'Sofia Jimenez', 'sofia.jimenez@empresa.com', '456789012', 'editor456', 'Activo', 'Jimenez', 'Moreno'),
(5, 5, 'Pedro Martinez', 'pedro.martinez@empresa.com', '567890123', 'visor789', 'Activo', 'Martinez', 'Sanchez');

INSERT INTO restauracion (ID_producto, Nombre, Marca, Descripcion, Cantidad, Precio) VALUES
(1, 'Restaurador de madera', 'WoodTech', 'Producto para restaurar muebles de madera antiguos', 50, 35.99),
(2, 'Limpiador de metal', 'CleanMetal', 'Limpiador especializado para superficies metálicas', 30, 19.99),
(3, 'Pintura para paredes', 'PaintPlus', 'Pintura premium para interiores', 100, 15.50),
(4, 'Cera para muebles', 'ShineWood', 'Cera para dar brillo a superficies de madera', 40, 25.00),
(5, 'Restaurador de piel', 'LeatherFix', 'Producto para restaurar y mantener la piel de sofás y sillas', 25, 40.00);

INSERT INTO productos_r (ID_test, ID_producto, Fecha_inicio, Cantidad, Fecha_final, ID_servicio) VALUES
(1, 1, '2024-01-15', 10, '2024-02-15', 1),
(2, 2, '2024-02-20', 15, '2024-03-20', 2),
(3, 3, '2024-03-10', 20, '2024-04-10', 3),
(4, 4, '2024-04-05', 30, '2024-05-05', 4),
(5, 5, '2024-05-22', 25, '2024-06-22', 5);

-- Consultas

-- Producto Cartesiano
-- Esta consulta genera una combinación de todos los usuarios con todas las redes sociales disponibles.
SELECT u.Nombre, r.Nombre AS Red, u.Correo
FROM usuarios u
CROSS JOIN redes r;
-- Esta consulta muestra todas las combinaciones posibles entre los productos restaurados y los productos disponibles en la tabla restauracion.
SELECT pr.ID_test, r.Nombre AS Producto, pr.Cantidad, r.Precio
FROM productos_r pr
CROSS JOIN restauracion r;
-- Esta consulta produce todas las combinaciones posibles entre los testimonios y los servicios registrados.
SELECT t.Nombre, s.Nombre AS Servicio, t.Comentario
FROM testimonios t
CROSS JOIN servicios s;

-- Inner Join
-- Esta consulta devuelve los usuarios que tienen sesiones activas, mostrando su nombre, correo y token de sesión.
SELECT u.Nombre, u.Correo, s.Token_sesion, s.Fecha_inicio
FROM usuarios u
INNER JOIN sesiones_de_usuario s ON u.ID_usuario = s.ID_usuario;
-- En esta consulta se muestran los mensajes enviados a través de las redes sociales, con el nombre de la red y el estado de cada mensaje.
SELECT c.Nombre, c.Mensaje, r.Nombre AS Red, c.Estado
FROM contactame c
INNER JOIN redes r ON c.ID_red = r.ID_red;
-- Esta consulta obtiene información de los proyectos y los servicios asociados, mostrando el nombre del proyecto, la fecha de inicio, el nombre del servicio y el precio total del proyecto.
SELECT p.Nombre AS Proyecto, p.Fecha_inicio, s.Nombre AS Servicio, p.Precio_total
FROM proyectos p
INNER JOIN servicios s ON p.ID_servicio = s.ID_servicio;

-- Funciones de Columna y Consultas de Resumen
-- Esta consulta cuenta la cantidad de mensajes recibidos por cada red social, utilizando COUNT y GROUP BY para agrupar por red.
SELECT r.Nombre AS Red, COUNT(c.ID_mensaje) AS Mensajes_recibidos
FROM redes r
LEFT JOIN contactame c ON r.ID_red = c.ID_red
GROUP BY r.Nombre;
-- Esta consulta utiliza la función SUM para calcular el total de los precios de los proyectos agrupados por categoría.
SELECT p.Categoria, SUM(p.Precio_total) AS Total_Precio
FROM proyectos p
GROUP BY p.Categoria;
-- Esta consulta utiliza AVG para calcular el precio promedio de los productos en la tabla de restauración.
SELECT AVG(r.Precio) AS Precio_promedio
FROM restauracion r;

