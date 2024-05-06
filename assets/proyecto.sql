-- ---------------- --
-- CREACIÓN DE BBDD --
-- ---------------- --

CREATE DATABASE proyecto;

USE proyecto;

-- ------------------ --
-- CREACIÓN DE TABLAS --
-- ------------------ --

-- Tabla REY

CREATE TABLE REY (
    id_rey INT PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT,
    fecha_nac DATE
);

-- Tabla PALACIO

CREATE TABLE PALACIO (
    id_palacio INT PRIMARY KEY,
    nombre VARCHAR(100),
    tamaño VARCHAR(50),
    num_habitaciones INT
);

-- Tabla CARCEL

CREATE TABLE CARCEL (
    id_carcel INT PRIMARY KEY,
    id_palacio INT,
    num_reclusos INT,
    num_celdas INT,
    FOREIGN KEY (id_palacio) REFERENCES PALACIO (id_palacio)
);

-- Tabla ALDEA

CREATE TABLE ALDEA (
    id_aldea INT PRIMARY KEY,
    nombre VARCHAR(100),
    poblacion INT
);

-- Tabla HABITANTE

CREATE TABLE HABITANTE (
    id_habitante INT PRIMARY KEY,
    nombre VARCHAR(100),
    genero VARCHAR(10),
    edad INT,
    id_aldea INT,
    FOREIGN KEY (id_aldea) REFERENCES ALDEA (id_aldea)
);

-- Tabla MERCENARIO

CREATE TABLE MERCENARIO (
    id_mercenario INT PRIMARY KEY,
    nombre VARCHAR(100),
    genero VARCHAR(10)
);

-- Tabla Ataca_Mercenario

CREATE TABLE Ataca_Mercenario (
    id_aldea INT,
    id_mercenario INT,
    fecha DATE,
    FOREIGN KEY (id_aldea) REFERENCES ALDEA (id_aldea),
    FOREIGN KEY (id_mercenario) REFERENCES MERCENARIO (id_mercenario),
    PRIMARY KEY (id_aldea, id_mercenario)
);

-- Tabla MINISTRO

CREATE TABLE MINISTRO (
    id_ministro INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT
);

-- Tabla CONSEJO_REAL

CREATE TABLE CONSEJO_REAL (
    id_consejo INT PRIMARY KEY,
    id_rey INT,
    num_asientos INT,
    FOREIGN KEY (id_rey) REFERENCES REY (id_rey)
);

-- Tabla Acude

CREATE TABLE Acude (
    id_consejo INT,
    id_ministro INT,
    fecha DATE,
    FOREIGN KEY (id_consejo) REFERENCES CONSEJO_REAL (id_consejo),
    FOREIGN KEY (id_ministro) REFERENCES MINISTRO (id_ministro),
    PRIMARY KEY (id_consejo, id_ministro)
);

-- Tabla HERO

CREATE TABLE HERO (
    id_heroe INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla CONS_AYU_HEROE

CREATE TABLE CONS_AYU_HEROE (
    id_consejo INT,
    num_asientos INT,
    id_heroe INT,
    nombre VARCHAR(100),
    FOREIGN KEY (id_consejo) REFERENCES CONSEJO_REAL (id_consejo),
    FOREIGN KEY (id_heroe) REFERENCES HERO (id_heroe),
    PRIMARY KEY (id_consejo, id_heroe)
);

-- Tabla ZONA

CREATE TABLE ZONA (
    id_zona INT PRIMARY KEY,
    nombre VARCHAR(100),
    bioma VARCHAR(100)
);

-- Tabla Viaja

CREATE TABLE Viaja (
    id_heroe INT,
    id_zona INT,
    FOREIGN KEY (id_heroe) REFERENCES HERO (id_heroe),
    FOREIGN KEY (id_zona) REFERENCES ZONA (id_zona),
    PRIMARY KEY (id_heroe, id_zona)
);

-- Tabla MONSTRUO

CREATE TABLE MONSTRUO (
    id_monstruo INT PRIMARY KEY,
    nombre VARCHAR(100),
    indice_peligrosidad INT,
    descripcion TEXT
);

-- Tabla Hay

CREATE TABLE Hay (
    id_zona INT,
    id_monstruo INT,
    FOREIGN KEY (id_zona) REFERENCES ZONA (id_zona),
    FOREIGN KEY (id_monstruo) REFERENCES MONSTRUO (id_monstruo),
    PRIMARY KEY (id_zona, id_monstruo)
);

-- Tabla Ataca

CREATE TABLE Ataca (
    id_monstruo INT,
    id_habitante INT,
    fecha DATE,
    FOREIGN KEY (id_monstruo) REFERENCES MONSTRUO (id_monstruo),
    FOREIGN KEY (id_habitante) REFERENCES HABITANTE (id_habitante),
    PRIMARY KEY (id_monstruo, id_habitante)
);

-- Tabla FAMILIA

CREATE TABLE FAMILIA (
    id_familia INT PRIMARY KEY,
    nombre VARCHAR(100),
    fundacion DATE,
    miembros INT
);

-- Tabla Tiene

CREATE TABLE Tiene (
    id_rey INT,
    id_familia INT,
    FOREIGN KEY (id_rey) REFERENCES REY (id_rey),
    FOREIGN KEY (id_familia) REFERENCES FAMILIA (id_familia),
    PRIMARY KEY (id_rey, id_familia)
);

-- Tabla Vive

CREATE TABLE Vive (
    id_rey INT,
    id_palacio INT,
    FOREIGN KEY (id_rey) REFERENCES REY (id_rey),
    FOREIGN KEY (id_palacio) REFERENCES PALACIO (id_palacio),
    PRIMARY KEY (id_rey, id_palacio)
);

-- Tabla CAR_TRJ_CRL

CREATE TABLE CAR_TRJ_CRL (
    id_carcelero INT PRIMARY KEY,
    nombre VARCHAR(100),
    id_carcel INT,
    num_reclusos INT,
    num_celdas INT,
    FOREIGN KEY (id_carcel) REFERENCES CARCEL (id_carcel)
);

-- ------------------ --
-- INSERCIÓN DE DATOS --
-- ------------------ --

-- REY
INSERT INTO
    REY (
        id_rey,
        nombre,
        edad,
        fecha_nac
    )
VALUES (
        1,
        'Alejandro III',
        44,
        '0482-05-15'
    ),
    (
        2,
        'Alejandro IV',
        22,
        '0540-11-21'
    ),
    (3, 'Allan', 69, '0493-03-10');

-- PALACIO
INSERT INTO
    PALACIO (
        id_palacio,
        nombre,
        tamaño,
        num_habitaciones
    )
VALUES (
        1,
        'Bastión Escarpado',
        'Pequeño',
        30
    ),
    (
        2,
        'Bastión Sol Radiante',
        'Grande',
        100
    );

-- CARCEL
INSERT INTO
    CARCEL (
        id_carcel,
        id_palacio,
        num_reclusos,
        num_celdas
    )
VALUES (1, 1, 50, 25),
    (2, 2, 20, 15);

-- ALDEA
INSERT INTO
    ALDEA (id_aldea, nombre, poblacion)
VALUES (1, 'Brumosa', 1200),
    (2, 'Piedra Alta', 300);

-- HABITANTE
INSERT INTO
    HABITANTE (
        id_habitante,
        nombre,
        genero,
        edad,
        id_aldea
    )
VALUES (
        1,
        'Lancelot',
        'Masculino',
        30,
        1
    ),
    (2, 'Gorgo', 'Femenino', 28, 2),
    (3, 'Darko', 'Masculino', 2, 1),
    (
        4,
        'Fatima',
        'Femenino',
        20,
        2
    ),
    (
        5,
        'David',
        'Masculino',
        56,
        1
    ),
    (
        6,
        'Sahaza',
        'Femenino',
        85,
        2
    ),
    (
        7,
        'Lopen',
        'Masculino',
        15,
        1
    ),
    (
        8,
        'Fazzka',
        'Femenino',
        101,
        2
    ),
    (9, 'Dan', 'Masculino', 32, 1),
    (
        10,
        'Diana',
        'Femenino',
        14,
        2
    ),
    (
        11,
        'Claire',
        'Femenino',
        6,
        1
    );

-- MERCENARIO
INSERT INTO
    MERCENARIO (id_mercenario, nombre, genero)
VALUES (1, 'Adán', 'Masculino'),
    (2, 'Alfa', 'Femenino'),
    (3, 'Calavera', 'Masculino'),
    (4, 'Dante', 'Masculino'),
    (5, 'María', 'Femenino'),
    (6, 'Dutch', 'Masculino'),
    (7, 'Sombra', 'Masculino'),
    (8, 'Némesis', 'Masculino');

-- MINISTRO
INSERT INTO
    MINISTRO (
        id_ministro,
        nombre,
        descripcion
    )
VALUES (
        1,
        'Robert',
        'Ministro de justicia'
    ),
    (
        2,
        'Cráneo',
        'Ministro de defensa'
    ),
    (
        3,
        'Daud',
        'Ministro de economía'
    ),
    (
        4,
        'Lydia',
        'Ministra de espionaje'
    );

-- CONSEJO_REAL
INSERT INTO
    CONSEJO_REAL (
        id_consejo,
        id_rey,
        num_asientos
    )
VALUES (1, 1, 5);

-- Acude
INSERT INTO
    Acude (
        id_consejo,
        id_ministro,
        fecha
    )
VALUES (1, 2, '0526-04-01');

-- HERO
INSERT INTO
    HERO (id_heroe, nombre)
VALUES (1, 'Anya'),
    (2, 'Mefisto'),
    (3, 'Oscuro'),
    (4, 'Tristán'),
    (5, 'Gonza'),
    (6, 'Samara');

-- CONS_AYU_HEROE
INSERT INTO
    CONS_AYU_HEROE (
        id_consejo,
        num_asientos,
        id_heroe,
        nombre
    )
VALUES (1, 5, 1, 'Tristán');

-- ZONA
INSERT INTO
    ZONA (id_zona, nombre, bioma)
VALUES (
        1,
        'Bosque Oscuro',
        'Bosque templado'
    ),
    (
        2,
        'Capilla Radiante',
        'Bosque mediterráneo'
    ),
    (
        3,
        'Catacumbas',
        'Bosque mediterráneo'
    ),
    (4, 'Cementerio', 'Taiga'),
    (5, 'Puerto Norte', 'Tundra'),
    (
        6,
        'Torre Escarlata',
        'Desierto'
    );

-- Viaja
INSERT INTO
    Viaja (id_heroe, id_zona)
VALUES (1, 3),
    (2, 5),
    (3, 6),
    (4, 6),
    (5, 4),
    (6, 6);

-- MONSTRUO
INSERT INTO
    MONSTRUO (
        id_monstruo,
        nombre,
        indice_peligrosidad,
        descripcion
    )
VALUES (
        1,
        'Demonio de Fuego',
        8,
        'Un temible demonio rojo muy peligroso'
    ),
    (
        2,
        'Sátiro',
        6,
        'Bestia bípeda con apariencia extraña'
    ),
    (
        3,
        'Sabueso',
        3,
        'Demonio cuadrúpedo con tentáculos'
    ),
    (
        4,
        'Fantasma',
        6,
        'Criatura procedente de la torre carmesí'
    ),
    (
        5,
        'Homo Novus',
        10,
        'Criatura desconocida que aterra a los humanos del reino de Arkania'
    ),
    (
        6,
        'Lobo',
        3,
        'Baja peligrosidad si no atacan en grupo'
    ),
    (
        7,
        'Titán',
        9,
        'La cosa caída del cielo'
    );

-- Hay
INSERT INTO
    Hay (id_zona, id_monstruo)
VALUES (4, 1),
    (4, 2),
    (6, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (6, 7);

-- Ataca
INSERT INTO
    Ataca (
        id_monstruo,
        id_habitante,
        fecha
    )
VALUES (1, 1, '526-10-07'),
    (3, 2, '526-09-30'),
    (6, 3, '324-08-23'),
    (4, 4, '389-04-06'),
    (7, 5, '489-05-05'),
    (2, 6, '520-03-15'),
    (3, 11, '428-01-27');

-- FAMILIA
INSERT INTO
    FAMILIA (
        id_familia,
        nombre,
        fundacion,
        miembros
    )
VALUES (
        1,
        'Familia Radiante',
        '0250-11-01',
        4
    ),
    (
        2,
        'Familia Nocturnia',
        '0158-05-10',
        12
    );

-- Tiene
INSERT INTO Tiene (id_rey, id_familia) VALUES (1, 1), (3, 2);

-- Vive
INSERT INTO Vive (id_rey, id_palacio) VALUES (1, 2), (2, 2), (3, 1);

-- CAR_TRJ_CRL
INSERT INTO
    CAR_TRJ_CRL (
        id_carcelero,
        nombre,
        id_carcel,
        num_reclusos,
        num_celdas
    )
VALUES (1, 'Guardián', 1, 50, 10);

-- --- ----- --
-- CONSULTAS --
-- --------- --

-- 1. Lista los reyes y sus edades:

SELECT nombre, edad FROM REY;

-- 2. Muestra el nombre y tamaño de los palacios de Arkania:

SELECT nombre, tamaño FROM PALACIO;

-- 3. Obtén el nombre de la aldea con más población:

SELECT nombre FROM ALDEA ORDER BY poblacion DESC LIMIT 1;

-- 4. Obtén la cantidad de habitantes de género masculino de cada aldea:

SELECT id_aldea, COUNT(*) AS num_hombres
FROM HABITANTE
WHERE
    genero = 'Masculino'
GROUP BY
    id_aldea;

-- 5. Lista al completo a todos los ministros:

SELECT nombre, descripcion FROM MINISTRO;

-- 6. Obten el número de asientos del consejo real:

SELECT SUM(num_asientos) AS total_asientos FROM CONSEJO_REAL;

-- 7. Lista a los héroes y las zonas que han visitado:

SELECT h.nombre AS nombre_heroe, z.nombre AS nombre_zona
FROM HERO AS h
    JOIN Viaja AS v ON h.id_heroe = v.id_heroe
    JOIN ZONA AS z ON v.id_zona = z.id_zona;

-- 8. Muestra el nombre y descripciones de los monstruos que tengan un índice de peligrosidad mayor a 7:

SELECT nombre, descripcion
FROM MONSTRUO
WHERE
    indice_peligrosidad > 7;

-- 9. Obtén la familia con más miembros:

SELECT nombre FROM FAMILIA ORDER BY miembros DESC LIMIT 1;

-- 10. Cuenta la cantidad de habitantes de cada aldea:

SELECT id_aldea, COUNT(*) AS num_habitantes
FROM HABITANTE
GROUP BY
    id_aldea;

-- 11. Encuentra al héroe que han viajado a zonas con bioma bosque:

SELECT DISTINCT
    h.nombre
FROM HERO AS h
    JOIN Viaja AS v ON h.id_heroe = v.id_heroe
    JOIN ZONA AS z ON v.id_zona = z.id_zona
WHERE
    z.bioma LIKE '%Bosque%';

-- 12. Encuentra al ministro que acudió al consejo real:

SELECT M.nombre
FROM MINISTRO AS m
    JOIN Acude AS a ON m.id_ministro = a.id_ministro;

-- 13. Lista al monstruo más peligroso:

SELECT nombre
FROM MONSTRUO
WHERE
    indice_peligrosidad = (
        SELECT MAX(indice_peligrosidad)
        FROM MONSTRUO
    );

-- 14. Cuenta la cantidad de celdas de cada cárcel:

SELECT id_carcel, SUM(num_celdas) AS total_celdas
FROM CARCEL
GROUP BY
    id_carcel;

-- 15. Muestra a los héroes que no han viajado a ninguna zona:

SELECT nombre
FROM HERO
WHERE
    id_heroe NOT IN(
        SELECT id_heroe
        FROM Viaja
    );

-- 16. Muestra a los ministros que no han acudido a ningún consejo real:

SELECT nombre
FROM MINISTRO
WHERE
    id_ministro NOT IN(
        SELECT id_ministro
        FROM Acude
    );

-- 17. Obtén el nombre de la familia fundada más recientemente:

SELECT nombre FROM FAMILIA ORDER BY fundacion DESC LIMIT 1;

-- 18: Cuenta la cantidad de habitantes de cada género, de cada aldea:

SELECT id_aldea, genero, COUNT(*) AS cantidad
FROM HABITANTE
GROUP BY
    id_aldea,
    genero;

-- 19: Lista a los héroes que han viajado a zonas donde hay monstruos con índice de peligrosidad mayor a 7:

SELECT DISTINCT
    h.nombre AS nombre_heroe
FROM
    HERO AS h
    JOIN Viaja AS v ON h.id_heroe = v.id_heroe
    JOIN Hay AS Hay ON v.id_zona = Hay.id_zona
    JOIN MONSTRUO AS m ON Hay.id_monstruo = m.id_monstruo
WHERE
    m.indice_peligrosidad > 7;

-- 20: Mostrar los nombres de los ministros que han asistido a consejos reales presididos por reyes que han vivido en todos los palacios donde hay al menos una cárcel:

SELECT M.nombre AS nombre_ministro
FROM MINISTRO AS M
WHERE
    NOT EXISTS (
        SELECT id_consejo
        FROM CONSEJO_REAL AS CR
        WHERE
            CR.id_rey NOT IN(
                SELECT R.id_rey
                FROM REY AS R
                WHERE
                    NOT EXISTS (
                        SELECT id_palacio
                        FROM PALACIO
                        WHERE
                            id_palacio NOT IN(
                                SELECT id_palacio
                                FROM Vive AS V
                                WHERE
                                    V.id_rey = R.id_rey
                            )
                    )
            )
            AND id_consejo NOT IN(
                SELECT id_consejo
                FROM Acude AS A
                WHERE
                    A.id_ministro = M.id_ministro
            )
    );