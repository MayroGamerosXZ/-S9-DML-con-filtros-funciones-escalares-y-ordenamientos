# 📚 Ejercicios DML - Base de Datos Chinook

## 📋 Descripción General

Este documento contiene 10 ejercicios prácticos de **DML (Data Manipulation Language)** utilizando la base de datos **Chinook** en PostgreSQL. Cada ejercicio demuestra el uso de consultas SQL con filtros, funciones escalares, ordenamientos y cálculos.

---

## 🎯 Requisitos Técnicos Cumplidos

- ✅ **2 consultas** con operadores `LIKE` o `ILIKE`
- ✅ **2 consultas** con funciones escalares (`ROUND`)
- ✅ **7 consultas** con `ORDER BY`
- ✅ **2 consultas** con `LIMIT`
- ✅ **2 consultas** con operaciones matemáticas

---

## 📝 Ejercicios

### 1️⃣ Clientes de Brasil

**Objetivo:** Listar todos los clientes brasileños ordenados alfabéticamente por apellido.

**Qué hace:**
- Consulta la tabla `customer`
- Filtra únicamente clientes cuyo país sea "Brazil"
- Ordena los resultados alfabéticamente por apellido (A-Z)

**Qué devuelve:**
| first_name | last_name | email |
|------------|-----------|-------|
| Luís | Gonçalves | luisg@embraer.com.br |
| Eduardo | Martins | eduardo@woodstock.com.br |
| ... | ... | ... |

**Ejemplo de resultado:** Lista de nombres, apellidos y correos de todos los clientes brasileños.

---

### 2️⃣ Álbumes de AC/DC

**Objetivo:** Obtener todos los álbumes del artista AC/DC.

**Qué hace:**
- Realiza un `INNER JOIN` entre las tablas `album` y `artist`
- Filtra únicamente álbumes del artista con nombre "AC/DC"
- Relaciona ambas tablas mediante el campo `artist_id`

**Qué devuelve:**
| title |
|-------|
| For Those About To Rock We Salute You |
| Let There Be Rock |
| ... |

**Ejemplo de resultado:** Lista con los títulos de todos los álbumes de AC/DC en la base de datos.

---

### 3️⃣ Canciones que Contengan "Love"

**Objetivo:** Buscar canciones cuyo nombre contenga la palabra "love" (sin importar mayúsculas/minúsculas).

**Qué hace:**
- Consulta la tabla `track`
- Utiliza el operador `ILIKE` con el patrón `%love%` para búsqueda case-insensitive
- Busca la palabra "love" en cualquier posición del nombre

**Qué devuelve:**
| track_id | name | album_id |
|----------|------|----------|
| 15 | Love In An Elevator | 5 |
| 89 | Love Song | 8 |
| ... | ... | ... |

**Ejemplo de resultado:** Lista de canciones que incluyen "love", "Love", "LOVE", etc. en su nombre.

---

### 4️⃣ Facturas Mayores a $10

**Objetivo:** Listar facturas con un total superior a $10.00, ordenadas de mayor a menor.

**Qué hace:**
- Consulta la tabla `invoice`
- Filtra facturas con `total > 10.00`
- Ordena los resultados de mayor a menor monto

**Qué devuelve:**
| invoice_id | invoice_date | billing_country | total |
|------------|-------------|-----------------|-------|
| 404 | 2013-11-13 | USA | 25.86 |
| 299 | 2012-09-12 | Brazil | 23.86 |
| ... | ... | ... | ... |

**Ejemplo de resultado:** Facturas de alto valor ordenadas descendentemente por monto total.

---

### 5️⃣ Los 5 Clientes Más Recientes

**Objetivo:** Obtener los últimos 5 clientes registrados en el sistema.

**Qué hace:**
- Consulta la tabla `customer`
- Ordena por `customer_id` de forma descendente (IDs más altos = más recientes)
- Limita el resultado a solo 5 registros

**Qué devuelve:**
| customer_id | first_name | last_name | country |
|-------------|------------|-----------|---------|
| 59 | Rishabh | Mishra | India |
| 58 | Manoj | Pareek | India |
| 57 | Luis | Rojas | Chile |
| 56 | Diego | Gutiérrez | Argentina |
| 55 | Mark | Taylor | Australia |

**Ejemplo de resultado:** Los 5 clientes con los IDs más altos (últimos registrados).

---

### 6️⃣ Canciones de Más de 5 Minutos

**Objetivo:** Listar canciones con duración superior a 5 minutos, mostrando el tiempo en minutos.

**Qué hace:**
- Consulta la tabla `track`
- Filtra canciones con `milliseconds > 300000` (5 minutos)
- Convierte milisegundos a minutos mediante la fórmula: `milliseconds / 60000.0`
- Utiliza `ROUND()` para redondear a 2 decimales
- Ordena de mayor a menor duración

**Qué devuelve:**
| track_id | name | duracion_minutos |
|----------|------|------------------|
| 2820 | Occupation / Precipice | 88.13 |
| 3224 | Through a Looking Glass | 84.57 |
| ... | ... | ... |

**Ejemplo de resultado:** Canciones largas con su duración expresada en minutos con 2 decimales.

---

### 7️⃣ Cantidad de Clientes por País

**Objetivo:** Contar cuántos clientes hay en cada país, ordenados de mayor a menor cantidad.

**Qué hace:**
- Consulta la tabla `customer`
- Agrupa los registros por `country`
- Cuenta el número de clientes en cada país con `COUNT(*)`
- Ordena descendentemente por cantidad de clientes

**Qué devuelve:**
| country | cantidad_clientes |
|---------|-------------------|
| USA | 13 |
| Canada | 8 |
| Brazil | 5 |
| France | 5 |
| ... | ... |

**Ejemplo de resultado:** Estadística de distribución de clientes por país.

---

### 8️⃣ Empleados "Sales Support Agent"

**Objetivo:** Listar empleados con el cargo "Sales Support Agent" ordenados por antigüedad.

**Qué hace:**
- Consulta la tabla `employee`
- Filtra empleados cuyo `title = 'Sales Support Agent'`
- Ordena ascendentemente por fecha de contratación (más antiguos primero)

**Qué devuelve:**
| employee_id | first_name | last_name | title | hire_date |
|-------------|------------|-----------|-------|-----------|
| 3 | Jane | Peacock | Sales Support Agent | 2017-04-01 |
| 4 | Margaret | Park | Sales Support Agent | 2017-05-03 |
| 5 | Steve | Johnson | Sales Support Agent | 2017-10-17 |

**Ejemplo de resultado:** Lista de agentes de soporte con sus fechas de contratación.

---

### 9️⃣ Top 10 Canciones Más Largas

**Objetivo:** Obtener las 10 canciones de mayor duración.

**Qué hace:**
- Consulta la tabla `track`
- Filtra canciones con duración mayor a 5 minutos
- Convierte milisegundos a minutos con `milliseconds / 60000.0`
- Redondea a 2 decimales con `ROUND()`
- Ordena descendentemente por duración
- Limita el resultado a 10 canciones

**Qué devuelve:**
| track_id | name | duracion_minutos |
|----------|------|------------------|
| 2820 | Occupation / Precipice | 88.13 |
| 3224 | Through a Looking Glass | 84.57 |
| 2819 | Battlestar Galactica, Pt. 3 | 49.95 |
| ... | ... | ... |

**Ejemplo de resultado:** Las 10 canciones más largas del catálogo con duración en minutos.

---

### 🔟 Clientes con Apellido que Empiece con "S"

**Objetivo:** Buscar clientes cuyo apellido comience con la letra "S".

**Qué hace:**
- Consulta la tabla `customer`
- Utiliza el operador `LIKE` con el patrón `'S%'`
- El símbolo `%` actúa como comodín (cualquier secuencia de caracteres)
- Ordena alfabéticamente por apellido

**Qué devuelve:**
| customer_id | first_name | last_name | country |
|-------------|------------|-----------|---------|
| 25 | Victor | Stevens | USA |
| 26 | Richard | Cunningham | USA |
| 37 | Fynn | Zimmermann | Germany |
| ... | ... | ... | ... |

**Ejemplo de resultado:** Lista de clientes cuyos apellidos comienzan con "S".

---

## 🔧 Tecnologías Utilizadas

- **PostgreSQL** 12+
- **Base de Datos:** Chinook (base de datos de ejemplo para tiendas de música)
- **Lenguaje:** SQL (DML - Data Manipulation Language)

---

## 📊 Conceptos Aplicados

| Concepto | Ejercicios |
|----------|-----------|
| Filtrado con `WHERE` | 1, 2, 3, 4, 6, 8, 9, 10 |
| `INNER JOIN` | 2 |
| `ORDER BY` | 1, 4, 5, 6, 7, 8, 9, 10 |
| `LIMIT` | 5, 9 |
| `GROUP BY` | 7 |
| Funciones de agregación (`COUNT`) | 7 |
| Funciones escalares (`ROUND`) | 6, 9 |
| Operadores de patrón (`LIKE`, `ILIKE`) | 3, 10 |
| Operaciones matemáticas | 6, 9 |
| Alias de tablas | 2 |
| Alias de columnas (`AS`) | 6, 7, 9 |

---

## 🚀 Cómo Ejecutar las Consultas

1. **Asegúrate de tener PostgreSQL instalado**
2. **Restaura la base de datos Chinook:**
   ```bash
   psql -U postgres -d postgres -f chinook.sql
   ```
3. **Conéctate a la base de datos:**
   ```bash
   psql -U postgres -d chinook
   ```
4. **Copia y ejecuta cualquier consulta del archivo SQL**

---

## 📖 Recursos Adicionales

- [Documentación oficial de PostgreSQL](https://www.postgresql.org/docs/)
- [Base de datos Chinook en GitHub](https://github.com/lerocha/chinook-database)
- [Tutorial de SQL básico](https://www.postgresqltutorial.com/)

---

## 👤 Autor

**Práctica de DML en PostgreSQL**  
Fecha: Octubre 2025  
Base de Datos: Chinook

---

## 📝 Licencia

Este código es de uso educativo y libre para fines de aprendizaje.

---

## ✅ Checklist de Validación

- [x] Todas las consultas ejecutan correctamente
- [x] Se cumplen los requisitos mínimos de LIKE/ILIKE
- [x] Se incluyen funciones escalares
- [x] Se aplican ordenamientos y límites
- [x] Se realizan cálculos matemáticos
- [x] Código comentado y documentado

---

**¡Happy Coding! 🎵🎸**
