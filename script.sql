CREATE TABLE usuarios(
	id number PRIMARY KEY,
	username VARCHAR (50) UNIQUE NOT NULL,
	password VARCHAR (50) NOT NULL,
	created_at TIMESTAMP
);

CREATE TABLE categorias(
	id number PRIMARY KEY,
	nombre VARCHAR (50) UNIQUE NOT NULL,
);

INSERT INTO categorias VALUES (1, 'Video juegos', 'https://cdn.pixabay.com/photo/2014/05/03/00/50/video-controller-336657_960_720.jpg');
INSERT INTO categorias VALUES (2, 'Libros', 'https://cdn.pixabay.com/photo/2016/03/27/19/32/blur-1283865_960_720.jpg');
INSERT INTO categorias VALUES (3, 'Software', 'https://cdn.pixabay.com/photo/2016/11/19/14/00/code-1839406_960_720.jpg');
INSERT INTO categorias VALUES (4, 'Muebles', 'https://cdn.pixabay.com/photo/2017/08/02/01/01/living-room-2569325_960_720.jpg');
INSERT INTO categorias VALUES (5, 'Electronica', 'https://cdn.pixabay.com/photo/2015/06/24/15/45/ipad-820272_960_720.jpg');
INSERT INTO categorias VALUES (6, 'Accesorios', 'https://cdn.pixabay.com/photo/2014/05/03/00/46/gadgets-336635_960_720.jpg');
