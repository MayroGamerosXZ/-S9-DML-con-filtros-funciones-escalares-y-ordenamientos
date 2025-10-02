-- EJERCICIO 1: CLIENTES DE BRASIL
-- Objetivo: Listar todos los clientes de Brasil ordenados por apellido
-- Tablas: customer
-- Orden: Ascendente por apellido

SELECT
    first_name,                  -- Nombre del cliente
    last_name,                   -- Apellido del cliente
    email                        -- Correo electrónico del cliente
FROM 
    customer                     -- Tabla de clientes
WHERE 
    country = 'Brazil'           -- Filtro: Solo clientes de Brasil
ORDER BY 
    last_name ASC;               -- Ordenamiento: Alfabético por apellido


-- EJERCICIO 2: ÁLBUMES DE AC/DC
-- Objetivo: Obtener todos los álbumes del artista AC/DC
-- Tablas: album, artist
-- Relación: INNER JOIN por artist_id

SELECT
    al.title                     -- Título del álbum
FROM 
    album al                     -- Tabla de álbumes (alias: al)
INNER JOIN 
    artist ar ON al.artist_id = ar.artist_id  -- Unión con tabla artistas
WHERE 
    ar.name = 'AC/DC';           -- Filtro: Solo artista AC/DC



-- EJERCICIO 3: CANCIONES CON "LOVE" EN EL NOMBRE
-- Objetivo: Buscar canciones que contengan "love" (case-insensitive)
-- Tablas: track
-- Operador: ILIKE (búsqueda insensible a mayúsculas/minúsculas)


SELECT
    track_id,                    -- ID de la canción
    name,                        -- Nombre de la canción
    album_id                     -- ID del álbum
FROM 
    track                        -- Tabla de canciones
WHERE 
    name ILIKE '%love%';         -- Filtro: Contiene "love"


-- EJERCICIO 4: FACTURAS MAYORES A $10
-- Objetivo: Listar facturas con total mayor a $10.00
-- Tablas: invoice
-- Orden: Descendente por monto total

SELECT
    invoice_id,                  -- ID de la factura
    invoice_date,                -- Fecha de emisión
    billing_country,             -- País de facturación
    total                        -- Monto total
FROM 
    invoice                      -- Tabla de facturas
WHERE 
    total > 10.00                -- Filtro: Total mayor a $10.00
ORDER BY 
    total DESC;                  -- Ordenamiento: Mayor a menor


-- EJERCICIO 5: LOS 5 CLIENTES MÁS RECIENTES
-- Objetivo: Obtener los últimos 5 clientes registrados
-- Tablas: customer
-- Orden: Descendente por customer_id (IDs más altos = más recientes)
-- Límite: 5 registros

SELECT
    customer_id,                 -- ID del cliente
    first_name,                  -- Nombre del cliente
    last_name,                   -- Apellido del cliente
    country                      -- País del cliente
FROM 
    customer                     -- Tabla de clientes
ORDER BY 
    customer_id DESC             -- Ordenamiento: IDs más recientes primero
LIMIT 5;                         -- Límite: Solo 5 resultados


-- EJERCICIO 6: CANCIONES MAYORES A 5 MINUTOS
-- Objetivo: Listar canciones con duración > 5 minutos (300,000 ms)
-- Tablas: track
-- Cálculo: Convertir milisegundos a minutos (ms / 60000)
-- Orden: Descendente por duración

SELECT
    track_id,                    -- ID de la canción
    name,                        -- Nombre de la canción
    ROUND(milliseconds / 60000.0, 2) AS duracion_minutos  -- Duración en minutos
FROM 
    track                        -- Tabla de canciones
WHERE 
    milliseconds > 300000        -- Filtro: Duración mayor a 5 minutos
ORDER BY 
    milliseconds DESC;           -- Ordenamiento: Más largas primero


-- EJERCICIO 7: CANTIDAD DE CLIENTES POR PAÍS
-- Objetivo: Contar clientes agrupados por país
-- Tablas: customer
-- Función: COUNT(*) para contar registros
-- Orden: Descendente por cantidad de clientes

SELECT
    country,                     -- País
    COUNT(*) AS cantidad_clientes  -- Cantidad de clientes por país
FROM 
    customer                     -- Tabla de clientes
GROUP BY 
    country                      -- Agrupación: Por país
ORDER BY 
    cantidad_clientes DESC;      -- Ordenamiento: Mayor cantidad primero


-- EJERCICIO 8: EMPLEADOS "SALES SUPPORT AGENT"
-- Objetivo: Listar empleados con título "Sales Support Agent"
-- Tablas: employee
-- Orden: Ascendente por fecha de contratación

SELECT
    employee_id,                 -- ID del empleado
    first_name,                  -- Nombre del empleado
    last_name,                   -- Apellido del empleado
    title,                       -- Título/cargo
    hire_date                    -- Fecha de contratación
FROM 
    employee                     -- Tabla de empleados
WHERE 
    title = 'Sales Support Agent'  -- Filtro: Solo agentes de soporte
ORDER BY 
    hire_date ASC;               -- Ordenamiento: Más antiguos primero


-- EJERCICIO 9: TOP 10 CANCIONES MÁS LARGAS
-- Objetivo: Obtener las 10 canciones de mayor duración
-- Tablas: track
-- Cálculo: Convertir milisegundos a minutos
-- Orden: Descendente por duración
-- Límite: 10 registros

SELECT
    track_id,                    -- ID de la canción
    name,                        -- Nombre de la canción
    ROUND(milliseconds / 60000.0, 2) AS duracion_minutos  -- Duración en minutos
FROM 
    track                        -- Tabla de canciones
WHERE 
    milliseconds > 300000        -- Filtro: Duración mayor a 5 minutos
ORDER BY 
    milliseconds DESC            -- Ordenamiento: Más largas primero
LIMIT 10;                        -- Límite: Solo 10 resultados


-- EJERCICIO 10: CLIENTES CON APELLIDO QUE EMPIECE CON "S"
-- Objetivo: Buscar clientes cuyo apellido comience con la letra "S"
-- Tablas: customer
-- Operador: LIKE con patrón 'S%'
-- Orden: Ascendente por apellido

SELECT
    customer_id,                 -- ID del cliente
    first_name,                  -- Nombre del cliente
    last_name,                   -- Apellido del cliente
    country                      -- País del cliente
FROM 
    customer                     -- Tabla de clientes
WHERE 
    last_name LIKE 'S%'          -- Filtro: Apellido empieza con "S"
ORDER BY 
    last_name ASC;               -- Ordenamiento: Alfabético por apellido
