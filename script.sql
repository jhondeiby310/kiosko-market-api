CREATE TABLE usuarios(
	id number PRIMARY KEY,
	nombre VARCHAR (50) NOT NULL,
	apellido VARCHAR (50) NOT NULL,
	correo VARCHAR (100) UNIQUE NOT NULL,
	contrasena VARCHAR (50) NOT NULL,
	rol number NOT NULL	
);

CREATE TABLE categorias(
	id number PRIMARY KEY,
	nombre VARCHAR (50) UNIQUE NOT NULL,
	image VARCHAR (300) UNIQUE NOT NULL,
	descripcion VARCHAR (300) UNIQUE NOT NULL
);


CREATE TABLE productos(
	codigo number PRIMARY KEY,
	nombreproducto VARCHAR (50) UNIQUE NOT NULL,
	image VARCHAR (300) UNIQUE NOT NULL,
	descripcion VARCHAR (300) UNIQUE NOT NULL,
	precio VARCHAR NOT NULL,
	idproductocategoria number Not NULL,
	FOREIGN KEY (idproductocategoria)  REFERENCES categorias(id)
)

INSERT INTO categorias VALUES (1, 'Video juegos', 'https://cdn.pixabay.com/photo/2014/05/03/00/50/video-controller-336657_960_720.jpg','Para tus largas horas de diversión');
INSERT INTO categorias VALUES (2, 'Libros', 'https://cdn.pixabay.com/photo/2016/03/27/19/32/blur-1283865_960_720.jpg','Encuentra los libros que te llevan a soñar');
INSERT INTO categorias VALUES (3, 'Software', 'https://cdn.pixabay.com/photo/2016/11/19/14/00/code-1839406_960_720.jpg','Software para el trabajo o tu proyecto creativo');
INSERT INTO categorias VALUES (4, 'Muebles', 'https://cdn.pixabay.com/photo/2017/08/02/01/01/living-room-2569325_960_720.jpg','Comodidad para tu hogar');
INSERT INTO categorias VALUES (5, 'Electronica', 'https://cdn.pixabay.com/photo/2015/06/24/15/45/ipad-820272_960_720.jpg','Para tus momentos de ocio y creatividad');
INSERT INTO categorias VALUES (6, 'Accesorios', 'https://cdn.pixabay.com/photo/2014/05/03/00/46/gadgets-336635_960_720.jpg','Para que luzcas a la moda');

INSERT INTO productos VALUES (1, 'Nioh2', 'https://dprimero.com/wp-content/uploads/2019/05/NIOH2_PS4_FRONT-ver-2-800x1029.png', 'Desvaina tus armas mortales y elimina a todos tus enemigos en tu camino', '$201.560', 1);
INSERT INTO productos VALUES (2, 'Final Fantasy VII', 'https://dprimero.com/wp-content/uploads/2019/06/final.jpg', 'Historia alucinante, personajes inolvidables, batallas épicas y más', '$218.403', 1);
INSERT INTO productos VALUES (3, 'DOOM Eternal', 'https://dprimero.com/wp-content/uploads/2020/03/Imagen-para-productos-miniatura-en-la-pagina.jpg', 'Consigue la tecnología más avanzada para aniquilar demonios', '$226.807', 1);
INSERT INTO productos VALUES (4, 'Call of Duty Modern Warfare Dark Edition', 'https://dprimero.com/wp-content/uploads/2019/08/SKU-000549.jpg', 'Prepárate para la oscuridad con está edición de Modern Warfare', '$919.900', 1);
INSERT INTO productos VALUES (5, 'Dragon Ball Kakarot', 'https://dprimero.com/wp-content/uploads/2019/10/SKU-000580.jpg', 'Revive la historia de Goku en DRAGON BALL Z:¡KAKAROTO¡', '$201.597', 1);
INSERT INTO productos VALUES (6, 'El principito', 'https://images.cdn2.buscalibre.com/fit-in/360x360/05/0a/050a44e6c04791fdc89f39f2aeeb0820.jpg', 'Antroine De Saint-Exupéry', '$25.591', 2);
INSERT INTO productos VALUES (7, 'Mas Importante Que el Dinero', 'https://images.cdn2.buscalibre.com/fit-in/360x360/04/83/04831c908a47b1d101f62e54600eeeb3.jpg', 'Robert T.Kiyosaki', '$41.591', 2);
INSERT INTO productos VALUES (8, 'El Milagro Metabolico', 'https://images.cdn1.buscalibre.com/fit-in/360x360/ea/a5/eaa593b5d5b4a4576330a40fa29372da.jpg', 'Carlos Jaramillo', '$39.182', 2);
INSERT INTO productos VALUES (9, 'Satanas', 'https://images.cdn2.buscalibre.com/fit-in/360x360/02/32/0232df26f98f0e4f912cf2685354dc66.jpg', 'Mario Mendoza', '$83.955', 2);
INSERT INTO productos VALUES (10, 'La Vitamina De La Felicidad', 'https://images.cdn3.buscalibre.com/fit-in/360x360/1d/f9/1df9a1abda1364aeeeefcef4999edf0b.jpg', 'Holick, Michael F', '$36.000', 2);
INSERT INTO productos VALUES (11, 'Software De Venta Control Inventario', 'https://http2.mlstatic.com/software-pos-punto-de-venta-control-inventario-original-D_NQ_NP_982125-MCO31035486024_062019-F.webp', 'El software punto de venta más sencillo para administrar tu negocio', '$450.000', 3);
INSERT INTO productos VALUES (12, 'Software Punto De Venta Pos En Excel', 'https://http2.mlstatic.com/software-punto-de-venta-pos-en-excel-D_NQ_NP_657523-MCO31163580011_062019-F.webp', 'Es un sistema desarrolado en Excel programado para que funcione de forma Automatizada para ayudarte', '$190.000', 3);
INSERT INTO productos VALUES (13, 'Software Sistema De Venta Restaurante', 'https://http2.mlstatic.com/software-sistema-punto-de-venta-restaurante-bar-sistema-pos-D_NQ_NP_631740-MCO31241772147_062019-F.webp', 'Es un programa para restaurantes, bares, pizzerías y en general todos los negocios de este tipo', '$59.990', 3);
INSERT INTO productos VALUES (14, 'Sistema Software De Ventas Caja Registradora', 'https://http2.mlstatic.com/sistema-software-pos-punto-de-venta-no-mas-caja-registradora-D_NQ_NP_856499-MCO31031111294_062019-F.webp', 'Convierta su computador tradicional en un punto de pago', '$486.000', 3);
INSERT INTO productos VALUES (15, 'Driver Booster PRO', 'https://www.megawarez.org/wp-content/uploads/2018/07/IObit-Driver-Booster-pro-6-box-cover-poster.png', 'Mantenga sus controladores actualizados', '$201.566', 3); 
INSERT INTO productos VALUES (16, 'Mesas Auxiliar', 'https://tugocolombia.vteximg.com.br/arquivos/ids/182319-1000-1000/2008295-1.jpg?v=636413320524270000', 'Acabado de Madera color Blanco', '$329.990', 4);
INSERT INTO productos VALUES (17, 'Centro de Entretenimiento', 'https://tugocolombia.vteximg.com.br/arquivos/ids/211266-1000-1000/541331-1.jpg?v=637249242012400000', 'Acabado Madera Fina Color Natural', '$499.990', 4);
INSERT INTO productos VALUES (18, 'Carro Tv Gramado Natural', 'https://tugocolombia.vteximg.com.br/arquivos/ids/192042-1000-1000/541005-1.jpg?v=636844705950770000', 'Acabado MDF color Natural', '$349.990', 4);
INSERT INTO productos VALUES (19, 'Sofa Cama Bassic Turquesa', 'https://tugocolombia.vteximg.com.br/arquivos/ids/208970-1000-1000/4000013-1.jpg?v=637175526090400000', 'Acabado Tela Color Turquesa', '$599.999', 4);
INSERT INTO productos VALUES (20, 'Sofa 3P Reclinable Dante Taupe', 'https://tugocolombia.vteximg.com.br/arquivos/ids/209474-1000-1000/3008002-1.jpg?v=637187805417770000', 'Acabado Microfibra Color Taupe', '$2.499.990', 4);
INSERT INTO productos VALUES (21, 'PRT-14425', 'https://www.sigmaelectronica.net/wp-content/uploads/2020/06/PRT-14425.jpg', 'Cable adaptador JST', '$7.616', 5);
INSERT INTO productos VALUES (22, 'TARJETA ATWINC', 'https://www.sigmaelectronica.net/wp-content/uploads/imported/ATWINC1500B.JPG', 'Tarjeta adaptadora para el modulo WIFI', '$47.600', 5);
INSERT INTO productos VALUES (23, 'A001078', 'https://www.sigmaelectronica.net/wp-content/uploads/2014/03/ARDUINO-robot.jpg', 'Arduino oficial sobre ruedas', '$714.000', 5);
INSERT INTO productos VALUES (24, 'ATSAMD20-XPRO', 'https://www.sigmaelectronica.net/wp-content/uploads/2013/11/ATSAMD20-XPRO.jpg', 'Kit de evaluación para el microcontrolador con núcleo', '$95.200', 5);
INSERT INTO productos VALUES (25, 'L30', 'https://www.sigmaelectronica.net/wp-content/uploads/2011/11/GPS-QUECTEL-L30.png', 'El L30 provee un alto nivel de inmunidad a interferencia', '$21.420', 5);

CREATE SEQUENCE producto;
ALTER TABLE productos ALTER codigo SET DEFAULT NEXTVAL('producto');
ALTER TABLE categorias ALTER id SET DEFAULT NEXTVALI('categoria');