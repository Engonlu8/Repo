CREATE TABLE marca (
    id INT PRIMARY KEY,
    name VARCHAR (30)
);

CREATE TABLE categoria (
    id INT PRIMARY KEY,
    name VARCHAR (30)
);

CREATE TABLE resultado (
    id INT PRIMARY KEY,
    incidencias VARCHAR (30),
    posicion VARCHAR (30)
);

CREATE TABLE pais (
    id INT PRIMARY KEY,
    name VARCHAR (30)
);

CREATE TABLE circuito (
    id INT PRIMARY KEY,
    name VARCHAR (30),
    longitud VARCHAR (30),
    teléfono VARCHAR (30),
    id_pais INT,
	FOREIGN KEY (id_pais) REFERENCES pais (id)
);

CREATE TABLE GP (
    id INT PRIMARY KEY,
    name VARCHAR (30),
    year date,
    id_circuito INT,
	FOREIGN KEY (id_circuito) REFERENCES circuito (id)
);

CREATE TABLE piloto (
    id INT PRIMARY KEY,
    name VARCHAR (30),
    apellido VARCHAR (30),
    alias VARCHAR (30),
    id_pais INT,
	FOREIGN KEY (id_pais) REFERENCES pais (id)
);

CREATE TABLE equipo (
    id INT PRIMARY KEY,
    name VARCHAR (30),
    jefe_de_equipo VARCHAR (30),
    id_marca INT,
	FOREIGN KEY (id_marca) REFERENCES marca (id),
    id_categoria INT,
	FOREIGN KEY (id_categoria) REFERENCES categoria (id)
);

CREATE TABLE piloto_equipo (
    id_piloto INT,
    id_equipo INT,
	FOREIGN KEY (id_piloto) REFERENCES piloto (id),
	FOREIGN KEY (id_equipo) REFERENCES equipo (id),
    PRIMARY KEY (id_piloto, id_equipo),
    year date,
    dorsal VARCHAR (30)
);

CREATE TABLE piloto_resultado_GP (
    id_piloto INT,
    id_resultado INT,
    id_gp INT,
	FOREIGN KEY (id_piloto) REFERENCES piloto (id),
	FOREIGN KEY (id_resultado) REFERENCES resultado (id),
    FOREIGN KEY (id_gp) REFERENCES GP (id),
    PRIMARY KEY (id_piloto, id_resultado, id_gp)
);

CREATE TABLE piloto_circuito (
    id_piloto INT,
    id_circuito INT,
    FOREIGN KEY (id_piloto) REFERENCES piloto (id),
    FOREIGN KEY (id_circuito) REFERENCES circuito (id)
);