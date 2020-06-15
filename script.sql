CREATE TABLE usuarios(
	id number PRIMARY KEY,
	username VARCHAR (50) UNIQUE NOT NULL,
	password VARCHAR (50) NOT NULL,
	created_at TIMESTAMP
);

CREATE TABLE categorias(
	id number PRIMARY KEY,
	nombre VARCHAR (50) UNIQUE NOT NULL,
	image VARCHAR (300) UNIQUE NOT NULL,
);

CREATE TABLE productElectronica(
	id number PRIMARY KEY,
	nombre VARCHAR (40) UNIQUE NOT NULL
);

CREATE TABLE productos(
	codigo number PRIMARY KEY,
	nombreproducto VARCHAR (50) UNIQUE NOT NULL,
	image VARCHAR (300) UNIQUE NOT NULL,
	descripcion VARCHAR (300) UNIQUE NOT NULL,
	precio number NOT NULL,
	idproductocategoria number Not NULL,
	FOREIGN KEY (idproductocategoria)  REFERENCES categorias(id)
)

INSERT INTO categorias VALUES (1, 'Video juegos', 'https://cdn.pixabay.com/photo/2014/05/03/00/50/video-controller-336657_960_720.jpg');
INSERT INTO categorias VALUES (2, 'Libros', 'https://cdn.pixabay.com/photo/2016/03/27/19/32/blur-1283865_960_720.jpg');
INSERT INTO categorias VALUES (3, 'Software', 'https://cdn.pixabay.com/photo/2016/11/19/14/00/code-1839406_960_720.jpg');
INSERT INTO categorias VALUES (4, 'Muebles', 'https://cdn.pixabay.com/photo/2017/08/02/01/01/living-room-2569325_960_720.jpg');
INSERT INTO categorias VALUES (5, 'Electronica', 'https://cdn.pixabay.com/photo/2015/06/24/15/45/ipad-820272_960_720.jpg');
INSERT INTO categorias VALUES (6, 'Accesorios', 'https://cdn.pixabay.com/photo/2014/05/03/00/46/gadgets-336635_960_720.jpg');



INSERT INTO productos VALUES (1, 'Reloj', 'https://cdn.pixabay.com/photo/2018/02/24/20/39/clock-3179167_960_720.jpg', 'Muy bonito', 40000, 6);
INSERT INTO productos VALUES (2, 'Maquina de Juegos', 'https://cdn.pixabay.com/photo/2013/09/06/20/50/pinball-179631_960_720.jpg', 'Podras jugar al 100', 45000, 5);
INSERT INTO productos VALUES (3, 'Hermoso mueble', 'https://cdn.pixabay.com/photo/2014/09/15/21/46/couch-447484_960_720.jpg', 'Muy comoda', 60000, 4);
INSERT INTO productos VALUES (4, 'Nuevo Software', 'https://cdn.pixabay.com/photo/2018/09/04/10/36/smart-home-3653454_960_720.jpg', 'Increible su funcion', 50000, 3);
INSERT INTO productos VALUES (5, 'Halo 5', 'https://cdn.pixabay.com/photo/2020/01/10/14/18/war-4755403_960_720.jpg', 'Full graficos', 55000, 1);
INSERT INTO productos VALUES (6, 'Satanas', 'https://cdn.pixabay.com/photo/2016/03/09/15/29/books-1246674_960_720.jpg', 'Buen libro', 45000, 2);
INSERT INTO productos VALUES (7, 'Cicla', 'https://cdn.pixabay.com/photo/2017/09/20/15/49/bike-2769021_960_720.jpg', 'Cicla Electrica', 100000, 5);
INSERT INTO productos VALUES (8, 'Antivirus', 'https://cdn.pixabay.com/photo/2014/02/13/07/28/security-265130_960_720.jpg', 'El mejor del mercado', 46000, 3);
INSERT INTO productos VALUES (9, 'Cobija', 'https://cdn.pixabay.com/photo/2015/06/08/15/02/pug-801826_960_720.jpg', 'Para tu perrito', 6000, 60);