-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 22-09-2022 a las 19:28:21
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `banco`
--
CREATE DATABASE IF NOT EXISTS `banco` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `banco`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

DROP TABLE IF EXISTS `entradas`;
CREATE TABLE IF NOT EXISTS `entradas` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(255) NOT NULL,
  `categoria_id` int(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` mediumtext,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entrada_usuario` (`usuario_id`),
  KEY `fk_entrada_categoria` (`categoria_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
CREATE TABLE IF NOT EXISTS `sucursales` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(100) NOT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `direccion` (`direccion`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id`, `direccion`, `ciudad`) VALUES
(1, 'Av. escalada 900', 'Lugano'),
(4, 'Lafuente 3210', 'Villa Soldati'),
(2, 'Av. Caseros 3500', 'Pque. Patricios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) NOT NULL,
  `calle` varchar(100) DEFAULT NULL,
  `saldo` int(100) DEFAULT '0',
  `edad` int(100) NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre_completo`, `calle`, `saldo`, `edad`, `fecha_ingreso`) VALUES
(1, 'Matias Massara', 'Calle 1000', 10000, 0, NULL),
(2, 'Alan Torres', 'Hilario 1300', 23000, 0, NULL),
(3, 'Gonzalo Vaira', 'Eduardo Acevedo 900', 15000, 0, NULL),
(4, 'Nicolas Zeballos', 'Av. Caseros 3500', 5000, 29, NULL),
(5, 'Martin De Rosa', 'Corvalan 2041', 10000, 30, '2022-05-10');
--
-- Base de datos: `biblioteca`
--
CREATE DATABASE IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `biblioteca`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `textos`
--

DROP TABLE IF EXISTS `textos`;
CREATE TABLE IF NOT EXISTS `textos` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre_libro` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `lugar` varchar(255) DEFAULT NULL,
  `precio` int(100) NOT NULL,
  `cantidad_paginas` int(100) DEFAULT NULL,
  `lectores` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `textos`
--

INSERT INTO `textos` (`id`, `nombre_libro`, `autor`, `lugar`, `precio`, `cantidad_paginas`, `lectores`) VALUES
(1, 'Las Cronicas de Narnia', 'C.S. Lewis', 'Suecia', 1500, 350, NULL),
(5, 'El Diablo en la Botella', 'Robert Louis Stevenson', 'Suecia', 6000, 300, NULL);
--
-- Base de datos: `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `blog`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `saldo` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_renome`
--

DROP TABLE IF EXISTS `usuarios_renome`;
CREATE TABLE IF NOT EXISTS `usuarios_renome` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` char(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios_renome`
--

INSERT INTO `usuarios_renome` (`id`, `nombre`, `apellido`, `email`, `password`) VALUES
(1, 'Victor', 'hola que tal', 'dasasda', 'dasasdasd'),
(2, 'Lautaro', 'hola que tal', 'asdasdsa', 'asdasddas'),
(3, 'Alfonso', 'asddasd', 'victor@robles.com', 'adsdasasd');
--
-- Base de datos: `blog_master`
--
CREATE DATABASE IF NOT EXISTS `blog_master` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `blog_master`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Accion'),
(2, 'Rol'),
(3, 'Deportes'),
(4, 'Plataformas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

DROP TABLE IF EXISTS `entradas`;
CREATE TABLE IF NOT EXISTS `entradas` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(255) NOT NULL,
  `categoria_id` int(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` mediumtext,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entrada_usuario` (`usuario_id`),
  KEY `fk_entrada_categoria` (`categoria_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `entradas`
--

INSERT INTO `entradas` (`id`, `usuario_id`, `categoria_id`, `titulo`, `descripcion`, `fecha`) VALUES
(1, 1, 1, 'Novedadesl del GTA 5', 'Review del GTA 5', '2022-05-16'),
(2, 1, 2, 'review del Lol Online', 'Todo sobre el Lol', '2022-05-16'),
(3, 1, 3, 'Nuevos jugadores de FIFA 19', 'Review del FIFA 19', '2022-05-16'),
(4, 2, 1, 'Novedades de Assasins Online', 'Review del Assasins', '2022-05-16'),
(5, 2, 2, 'Review del Wow Online', 'Todo sobre el Wow', '2022-05-16'),
(6, 2, 3, 'Nuevos jugadores del PES 19', 'Review del PES 19', '2022-05-16'),
(7, 1, 1, 'Novedadesl del Call of Duty', 'Review del COD', '2022-05-16'),
(8, 2, 1, 'Review del Fornite Online', 'Todo sobre el Fornite', '2022-05-16'),
(9, 3, 3, 'Nuevos jugadores de Formula 1 2020', 'Review del Formula 1 2020', '2022-05-16'),
(10, 3, 1, 'Guia del GTA Vice City', 'GTA', '2022-05-16'),
(11, 1, 1, 'Review del Minecraft', 'Minecraft', '2022-05-10'),
(12, 9, 1, 'Reseña del Call of dutty 5', 'dasasdasdsadasdasd', '2022-05-30');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `entradas_con_nombres`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `entradas_con_nombres`;
CREATE TABLE IF NOT EXISTS `entradas_con_nombres` (
`id` int(255)
,`titulo` varchar(255)
,`Autor` varchar(100)
,`Categoria` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidos` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `email`, `password`, `fecha`) VALUES
(1, 'Victor', 'Robles', 'victor@robles.com', 'adsadsds', '2022-05-12'),
(2, 'Antonio', 'Martinez', 'antonio@martinez.com', 'dada', '2022-05-12'),
(5, 'Marcio', 'Ochoa', 'marcio@ochoa.com', 'sssss', '2022-05-12'),
(7, 'Admin', 'Admin', 'admin@admin.com', 'admin', '2022-05-16'),
(8, 'Mauro', 'Miguel', 'mauro@miguel.com', '$2y$04$ywQwmWAp2rPdJfw5Vpx03.gFXrTgqi7Sj8pimX7w92c4VBYNtxf0e', '2022-05-30'),
(9, 'Mauro', 'Miguel', 'mauro@miguel2.com', '$2y$04$pRWnh0kOUgyFC0C2kXgwfuyyHhNs/klN68/8.VAgOugasiPgsHfTS', '2022-05-30'),
(10, 'Kevin', 'Roldan', 'kevin@roldan.com', '$2y$04$5Lu75CNo7FzcD4sKWJAuHOLEwV.NGbkeT6uz9YDaoE6XDq/SMvx8C', '2022-06-10'),
(12, 'Lucas', 'Roldan', 'asdsad@sdaasd.com', '$2y$04$dqghq9/VHOuzA.oJpifPJerJincmBm/TYxk69S23188hcdgIOoZoC', '2022-06-10'),
(13, 'Federico', 'Frass', 'fede@frass.com', '$2y$04$AWIMBDXhRj7SGKxKfh2qxe.YYwnIQQPQXp8b5nztQIH2MsZ5/qaqi', '2022-06-10'),
(14, 'Rodrigo', 'Gamboa', 'rodri@gamboa.com', '$2y$04$RAnDYa9n2gkI5GL5TKi7D.O3M1Vr2MV0vCa7jfRIwpoU8uHVSSxN2', '2022-06-10'),
(15, 'Fabricio\'', 'Delmobico\'', 'fab@dek.com', '$2y$04$P57qwJXW.dDlPkpD97/QfeNs4WLzCtS1IedK.AN9SEEF5LtuLu5nW', '2022-06-10'),
(16, 'Ramiro', 'Avila', 'ramiro@avila.com', '$2y$04$bo9KSNBa34zfUzo9Gqm8ZuTgRUEBZk2cn3lNHOHzi6mcSiURzJ.WS', '2022-06-12'),
(17, 'Luciano', 'Manteca', 'luciano@manteca.com', '$2y$04$kSPfrf7j3nZF0Vt.FlyczOHLnxMuCP7AMWIQjIVWzvYMRzmZfjbNK', '2022-06-12'),
(18, 'Diego', 'Zarate', 'diego@zarate.com', '$2y$04$H3yPylo/HZT2Tyu//hF4XuvOC/8mjuufGm13IGU0W1RWttrsaMwmq', '2022-06-12');

-- --------------------------------------------------------

--
-- Estructura para la vista `entradas_con_nombres`
--
DROP TABLE IF EXISTS `entradas_con_nombres`;

DROP VIEW IF EXISTS `entradas_con_nombres`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `entradas_con_nombres`  AS SELECT `e`.`id` AS `id`, `e`.`titulo` AS `titulo`, `u`.`nombre` AS `Autor`, `c`.`nombre` AS `Categoria` FROM ((`entradas` `e` join `usuarios` `u` on((`e`.`usuario_id` = `u`.`id`))) join `categorias` `c` on((`e`.`categoria_id` = `c`.`id`))) ;
--
-- Base de datos: `bookstore`
--
CREATE DATABASE IF NOT EXISTS `bookstore` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bookstore`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `Id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `Id` int(100) NOT NULL AUTO_INCREMENT,
  `IdAuthor` int(100) NOT NULL,
  `IdCategory` int(100) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description_book` varchar(255) DEFAULT NULL,
  `price` int(100) NOT NULL,
  `stock` int(150) NOT NULL,
  `language_book` varchar(100) NOT NULL,
  `year_book` varchar(10) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_author_table` (`IdAuthor`),
  KEY `fk_category_table` (`IdCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bookautor`
--

DROP TABLE IF EXISTS `bookautor`;
CREATE TABLE IF NOT EXISTS `bookautor` (
  `IdAuthor` int(100) NOT NULL,
  `IdBook` int(100) NOT NULL,
  `name_bookauthor` varchar(150) NOT NULL,
  `campo` varchar(100) DEFAULT NULL,
  KEY `IdAuthor` (`IdAuthor`),
  KEY `IdBook` (`IdBook`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `Id` int(100) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

DROP TABLE IF EXISTS `orden`;
CREATE TABLE IF NOT EXISTS `orden` (
  `IdOrden` int(100) NOT NULL AUTO_INCREMENT,
  `IdUser` int(100) DEFAULT NULL,
  `IdOrderBook` int(100) DEFAULT NULL,
  `date_orden` date DEFAULT NULL,
  `campo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdOrden`),
  KEY `fk_users_table` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orderbooks`
--

DROP TABLE IF EXISTS `orderbooks`;
CREATE TABLE IF NOT EXISTS `orderbooks` (
  `IdBook` int(100) NOT NULL,
  `IdOrden` int(100) NOT NULL,
  `quantity` int(100) DEFAULT NULL,
  KEY `fk_books_table` (`IdBook`),
  KEY `fk_orden_table` (`IdOrden`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sesion`
--

DROP TABLE IF EXISTS `sesion`;
CREATE TABLE IF NOT EXISTS `sesion` (
  `IdSesion` int(100) NOT NULL AUTO_INCREMENT,
  `IdUser` int(100) DEFAULT NULL,
  PRIMARY KEY (`IdSesion`),
  KEY `fk_user_table` (`IdUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shoppingcard`
--

DROP TABLE IF EXISTS `shoppingcard`;
CREATE TABLE IF NOT EXISTS `shoppingcard` (
  `IdShoppingCard` int(100) NOT NULL AUTO_INCREMENT,
  `IdSesion` int(100) NOT NULL,
  `IdBook` int(100) NOT NULL,
  PRIMARY KEY (`IdShoppingCard`),
  KEY `fk_sesion_table` (`IdSesion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `Id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `rol` varchar(100) DEFAULT NULL,
  `phone` int(255) NOT NULL,
  `state` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fk_author_table` FOREIGN KEY (`IdAuthor`) REFERENCES `author` (`Id`),
  ADD CONSTRAINT `fk_category_table` FOREIGN KEY (`IdCategory`) REFERENCES `categories` (`Id`);

--
-- Filtros para la tabla `bookautor`
--
ALTER TABLE `bookautor`
  ADD CONSTRAINT `bookautor_ibfk_1` FOREIGN KEY (`IdAuthor`) REFERENCES `author` (`Id`),
  ADD CONSTRAINT `bookautor_ibfk_2` FOREIGN KEY (`IdBook`) REFERENCES `book` (`Id`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `fk_users_table` FOREIGN KEY (`IdUser`) REFERENCES `users` (`Id`);

--
-- Filtros para la tabla `orderbooks`
--
ALTER TABLE `orderbooks`
  ADD CONSTRAINT `fk_books_table` FOREIGN KEY (`IdBook`) REFERENCES `book` (`Id`),
  ADD CONSTRAINT `fk_orden_table` FOREIGN KEY (`IdOrden`) REFERENCES `orden` (`IdOrden`);

--
-- Filtros para la tabla `sesion`
--
ALTER TABLE `sesion`
  ADD CONSTRAINT `fk_user_table` FOREIGN KEY (`IdUser`) REFERENCES `users` (`Id`);

--
-- Filtros para la tabla `shoppingcard`
--
ALTER TABLE `shoppingcard`
  ADD CONSTRAINT `fk_sesion_table` FOREIGN KEY (`IdSesion`) REFERENCES `sesion` (`IdSesion`);
--
-- Base de datos: `club`
--
CREATE DATABASE IF NOT EXISTS `club` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `club`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asociados`
--

DROP TABLE IF EXISTS `asociados`;
CREATE TABLE IF NOT EXISTS `asociados` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `tipo_socio` varchar(255) DEFAULT NULL,
  `telefono` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `direccion` (`localidad`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asociados`
--

INSERT INTO `asociados` (`id`, `nombre`, `localidad`, `email`, `tipo_socio`, `telefono`) VALUES
(1, 'Mauro Miguel', 'Carlos Berg 2714', 'mauro@miguel.com', 'Activo simple', NULL),
(2, 'Mauricio Gomez', 'Calle 129 N 10', 'mauricio@gomez.com', 'Vitalicio', NULL),
(3, 'Federico Zapata', 'Valentin Alsina 4500', 'mauro@miguel.com', 'Activo Simple', NULL);
--
-- Base de datos: `concesionario`
--
CREATE DATABASE IF NOT EXISTS `concesionario` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `concesionario`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `vendedor_id` int(10) DEFAULT NULL,
  `nombre` varchar(150) NOT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `gastado` float(50,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cliente_vendedor` (`vendedor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `vendedor_id`, `nombre`, `ciudad`, `gastado`, `fecha`) VALUES
(1, 1, 'Construcciones Diaz Inc.', 'Alcobendas', 24000.00, '2022-05-20'),
(2, 1, 'Fruteria Antonia Inc.', 'Fuenlabrada', 40000.00, '2022-05-20'),
(3, 1, 'Imprenta Martinez Inc.', 'Barcelona', 32000.00, '2022-05-20'),
(4, 1, 'Jesus Colchones Inc.', 'El Prat', 96000.00, '2022-05-20'),
(5, 1, 'Bar Pepe Inc.', 'Valencia', 170000.00, '2022-05-20'),
(6, 1, 'Tienda Pc Inc.', 'Murcia', 245000.00, '2022-05-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coches`
--

DROP TABLE IF EXISTS `coches`;
CREATE TABLE IF NOT EXISTS `coches` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `modelo` varchar(100) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `precio` int(20) NOT NULL,
  `stock` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `coches`
--

INSERT INTO `coches` (`id`, `modelo`, `marca`, `precio`, `stock`) VALUES
(1, 'Renault Clio', 'Renault', 12852, 13),
(2, 'Seat Panda', 'Seat', 10710, 10),
(3, 'Mercedes Ranchera', 'Mercedes Benz', 34272, 24),
(4, 'Porche Cayene', 'Porche', 69615, 5),
(5, 'Lambo aventador', 'Lamborghini', 182070, 2),
(6, 'Ferrari Spider', 'Ferrari', 262395, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encargos`
--

DROP TABLE IF EXISTS `encargos`;
CREATE TABLE IF NOT EXISTS `encargos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(10) NOT NULL,
  `coche_id` int(10) NOT NULL,
  `cantidad` int(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_encargo_cliente` (`cliente_id`),
  KEY `fk_encargo_coche` (`coche_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `encargos`
--

INSERT INTO `encargos` (`id`, `cliente_id`, `coche_id`, `cantidad`, `fecha`) VALUES
(1, 1, 1, 2, '2022-05-20'),
(2, 2, 2, 4, '2022-05-20'),
(3, 3, 3, 1, '2022-05-20'),
(4, 4, 3, 3, '2022-05-20'),
(5, 5, 5, 1, '2022-05-20'),
(6, 6, 6, 1, '2022-05-20'),
(7, 4, 4, 3, '2022-05-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE IF NOT EXISTS `grupos` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `grupos`
--

INSERT INTO `grupos` (`id`, `nombre`, `ciudad`) VALUES
(1, 'Vendedores A', 'Madrid'),
(2, 'Vendedores B', 'Madrid'),
(3, 'Directores Mecanicos', 'Madrid'),
(4, 'Vendedores A', 'Barcelona'),
(5, 'Vendedores B', 'Barcelona'),
(6, 'Vendedores C', 'Valencia'),
(7, 'Vendedores A', 'Bilbao'),
(8, 'Vendedores B', 'Pamplona'),
(9, 'Vendedores C', 'Santiago de Compostela');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
CREATE TABLE IF NOT EXISTS `vendedores` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `grupo_id` int(10) NOT NULL,
  `jefe` int(10) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(150) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `sueldo` float(20,2) DEFAULT NULL,
  `comision` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vendedor_grupo` (`grupo_id`),
  KEY `fk_vendedor_jefe` (`jefe`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vendedores`
--

INSERT INTO `vendedores` (`id`, `grupo_id`, `jefe`, `nombre`, `apellidos`, `cargo`, `fecha`, `sueldo`, `comision`) VALUES
(1, 1, NULL, 'David', 'Lopez', 'Responsable de tienda', '2009-11-25', 30000.00, 6.00),
(3, 1, 1, 'Fran', 'Martinez', 'Ayudante en tienda', '2022-05-20', 23000.00, 6.00),
(4, 2, NULL, 'Nelson', 'Sanchez', 'Responsable de tienda', '2018-01-15', 38000.00, 6.00),
(5, 2, 3, 'Jesus', 'Lopez', 'Ayudante en tienda', '2022-05-20', 12000.00, 6.00),
(6, 3, NULL, 'Victor', 'Lopez', 'Ayudante en jefe', '2022-05-20', 50000.00, 2.00),
(7, 4, NULL, 'Antonio', 'Lopez', 'Vendedor de recambios', '2022-05-20', 13000.00, 6.00),
(8, 5, NULL, 'Salvador', 'Lopez', 'Vendedor experto', '2022-05-20', 60000.00, 0.50),
(9, 6, NULL, 'Joaquin', 'Lopez', 'Ejecutivo de cuentas', '2022-05-20', 80000.00, 0.50),
(10, 6, 8, 'Luis', 'Lopez', 'Ayudante en tienda', '2022-05-20', 10000.00, 6.00);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_cliente_vendedor` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores` (`id`);

--
-- Filtros para la tabla `encargos`
--
ALTER TABLE `encargos`
  ADD CONSTRAINT `fk_encargo_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `fk_encargo_coche` FOREIGN KEY (`coche_id`) REFERENCES `coches` (`id`);

--
-- Filtros para la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD CONSTRAINT `fk_vendedor_grupo` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`),
  ADD CONSTRAINT `fk_vendedor_jefe` FOREIGN KEY (`jefe`) REFERENCES `vendedores` (`id`);
--
-- Base de datos: `farmacia`
--
CREATE DATABASE IF NOT EXISTS `farmacia` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `farmacia`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
CREATE TABLE IF NOT EXISTS `medicamentos` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nombre_droga` varchar(255) NOT NULL,
  `marca_remedio` varchar(255) DEFAULT NULL,
  `precio` int(100) DEFAULT NULL,
  `stock` int(100) NOT NULL,
  `sucursal` varchar(255) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_nombre_marca` (`marca_remedio`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id`, `nombre_droga`, `marca_remedio`, `precio`, `stock`, `sucursal`, `fecha_ingreso`) VALUES
(1, 'Risperidona', 'Risperin', 2500, 80, NULL, NULL),
(2, 'Levomepromazina', 'Nozinan', 4000, 40, NULL, NULL),
(3, 'Aspirina', 'Bayaspirina', 500, 35, NULL, NULL),
(4, 'Paracetamol', 'Tafirol', 900, 0, 'Pque.Patricios', NULL),
(5, 'Divalproato de Sodio', 'Valcote', NULL, 0, NULL, NULL),
(6, 'Clotiapina', NULL, 3000, 10, 'Pompeya', NULL),
(7, 'Risperidona', 'Risperdal', 6000, 300, 'Nuñez', NULL);
--
-- Base de datos: `ferrersoft`
--
CREATE DATABASE IF NOT EXISTS `ferrersoft` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ferrersoft`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajas`
--

DROP TABLE IF EXISTS `cajas`;
CREATE TABLE IF NOT EXISTS `cajas` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `apertura` int(100) NOT NULL,
  `cierre` int(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`id`, `apertura`, `cierre`, `fecha`) VALUES
(18, 76570, 99541, '2022-09-13'),
(19, 99541, 65697, '2022-09-14'),
(20, 65697, 89347, '2022-09-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Herramienta Manual'),
(2, 'Sierras'),
(3, 'Electricidad'),
(4, 'Madera');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

DROP TABLE IF EXISTS `empleados`;
CREATE TABLE IF NOT EXISTS `empleados` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `dni` int(255) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `telefono` int(255) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sueldo` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `dni`, `cargo`, `direccion`, `ciudad`, `telefono`, `fecha_nacimiento`, `sueldo`) VALUES
(34, 'Victoria Ceja', 25749950, 'Jefe', 'Panama 910', 'CABA', 48655776, '1981-03-04', 125000),
(39, 'Olivia Correa', 36698121, 'Vendedor', 'Av Corrientes 1984', 'CABA', 52461500, '2002-12-26', 76000),
(42, 'Alejandro Somoza', 36011496, 'Jefe', 'Lafuente 6933', 'CABA', 49196000, '1980-01-02', 125000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(255) NOT NULL,
  `proveedor_id` int(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` int(100) NOT NULL,
  `stock` int(200) NOT NULL,
  `stock_reposicion` int(200) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producto_categorias` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria_id`, `proveedor_id`, `descripcion`, `precio`, `stock`, `stock_reposicion`, `imagen`) VALUES
(2, 1, 3, 'Lijadora 1000cc', 12000, 10, 12, NULL),
(3, 3, 9, 'Tester Digital', 6000, 20, 12, NULL),
(9, 3, 8, 'Cable alargue 10mts', 2500, 34, 33, NULL),
(10, 1, 11, 'Lijadora 300cc', 12000, 23, 28, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE IF NOT EXISTS `proveedores` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `codigo_postal` int(100) NOT NULL,
  `telefono` int(255) NOT NULL,
  `cuit` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `razon_social`, `direccion`, `ciudad`, `codigo_postal`, `telefono`, `cuit`) VALUES
(1, 'Andromeda Power', 'Carlos Pinto 8900', 'Berazategui', 4378, 46376737, '27936190621'),
(2, 'Herramientas Lugo SA', 'Av. La Plata 120', 'CABA', 3456, 46376737, '27694888823'),
(3, 'Equipamientos Liniers', 'Av. Rivadavia 7000', 'CABA', 2333, 14415535, '27620535570'),
(4, 'Herramientas Once SRL', 'Pueyrredon 350', 'CABA', 1116, 11116737, '20260085000'),
(7, 'Herramientas Recoleta', 'Av Estado de Israel 4230', 'CABA', 4450, 13333737, '30263102769'),
(8, 'Lussay SRL', 'Av Pueyrredon 146', 'Avellaneda', 9999, 14882387, '24783954679'),
(9, 'Miraflor Herramientas', 'Jorge Luis Borges 2076', 'Lanus', 2023, 48990514, '24619323447'),
(11, 'Equipos Ferreteros SA', 'Carlos Calvo 340', 'CABA', 1345, 41152760, '44930090621'),
(14, 'Equipamientos Soldati', 'Lafuente 3050', 'CABA', 1437, 49196666, '23644707492');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `empleado_id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `rol` varchar(255) NOT NULL DEFAULT 'Usuario Comun',
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `empleado_id`, `username`, `rol`, `password`, `image`) VALUES
(16, 34, 'Victoria', 'Administrador', '$2y$05$bWpCwK0doAu/WhTY7BG41engMvjbBOxhRnlOxsb9rEYfkLvd1m1Um', NULL),
(21, 39, 'OliCorrea', 'Usuario Comun', '$2y$05$5KHO6C0zNNiAP8bFYvAs9eoSgsp7FP2qV3aul5AyWvObl7B2vKk5q', NULL),
(24, 42, 'AleSomoza', 'Administrador', '$2y$05$KPsOtzwunRTaHczcSTVKEemNhLLa/ylvJtsfLo.4u/QwjazhcaqqS', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_producto_categorias` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
--
-- Base de datos: `fiesta`
--
CREATE DATABASE IF NOT EXISTS `fiesta` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fiesta`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invitados`
--

DROP TABLE IF EXISTS `invitados`;
CREATE TABLE IF NOT EXISTS `invitados` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
--
-- Base de datos: `form`
--
CREATE DATABASE IF NOT EXISTS `form` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `form`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`) VALUES
(1, 'Pepito1990', '$2y$06$lBI8CQgDeuW3dHN3qtBLNuExsX49SY9f9/lGBmHUnDkYAGQAkRPz.'),
(2, 'Aurelio9000', '$2y$06$/o0Pfb4TDx4TcKBCEZij/u3Af/zo.0ucUSC8/sNRt.nyMRquxYvPW'),
(3, 'Alan8000', '$2y$06$vG39VpIKXqPiYMHQMLD26.6CWfYgv4CodHqcBFDcS5nbC7XfDZFUu');
--
-- Base de datos: `fruteria_master`
--
CREATE DATABASE IF NOT EXISTS `fruteria_master` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fruteria_master`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frutas`
--

DROP TABLE IF EXISTS `frutas`;
CREATE TABLE IF NOT EXISTS `frutas` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` float NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `frutas`
--

INSERT INTO `frutas` (`id`, `nombre`, `descripcion`, `precio`, `fecha`) VALUES
(1, 'Naranja', 'Producto citrico', 1, '2022-08-09'),
(2, 'Pera', 'Derivado de la manzana', 0.4, '2022-09-01'),
(3, 'Cereza 0', 'Descripcion de la fruta0', 0, '2022-09-21'),
(4, 'Cereza 1', 'Descripcion de la fruta1', 1, '2022-09-21'),
(5, 'Cereza 2', 'Descripcion de la fruta2', 2, '2022-09-21'),
(6, 'Cereza 3', 'Descripcion de la fruta3', 3, '2022-09-21'),
(7, 'Cereza 4', 'Descripcion de la fruta4', 4, '2022-09-21'),
(8, 'Cereza 5', 'Descripcion de la fruta5', 5, '2022-09-21'),
(9, 'Cereza 6', 'Descripcion de la fruta6', 6, '2022-09-21'),
(10, 'Cereza 7', 'Descripcion de la fruta7', 7, '2022-09-21'),
(11, 'Cereza 8', 'Descripcion de la fruta8', 8, '2022-09-21'),
(12, 'Cereza 9', 'Descripcion de la fruta9', 9, '2022-09-21'),
(13, 'Cereza 10', 'Descripcion de la fruta10', 10, '2022-09-21'),
(14, 'Cereza 11', 'Descripcion de la fruta11', 11, '2022-09-21'),
(15, 'Cereza 12', 'Descripcion de la fruta12', 12, '2022-09-21'),
(16, 'Cereza 13', 'Descripcion de la fruta13', 13, '2022-09-21'),
(17, 'Cereza 14', 'Descripcion de la fruta14', 14, '2022-09-21'),
(18, 'Cereza 15', 'Descripcion de la fruta15', 15, '2022-09-21'),
(19, 'Cereza 16', 'Descripcion de la fruta16', 16, '2022-09-21'),
(20, 'Cereza 17', 'Descripcion de la fruta17', 17, '2022-09-21'),
(21, 'Cereza 18', 'Descripcion de la fruta18', 18, '2022-09-21'),
(22, 'Cereza 19', 'Descripcion de la fruta19', 19, '2022-09-21'),
(23, 'Cereza 20', 'Descripcion de la fruta20', 20, '2022-09-21'),
(24, 'Manzana', 'Descripcion de la frutaManzana', 0, '2022-09-21'),
(25, 'Kiwi', 'Descripcion de la frutaKiwi', 1, '2022-09-21'),
(26, 'Melon', 'Descripcion de la frutaMelon', 2, '2022-09-21'),
(27, 'Banana', 'Descripcion de la frutaBanana', 3, '2022-09-21'),
(28, 'Aguacate', 'Descripcion de la frutaAguacate', 4, '2022-09-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
--
-- Base de datos: `grupo_scout`
--
CREATE DATABASE IF NOT EXISTS `grupo_scout` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `grupo_scout`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jovenes`
--

DROP TABLE IF EXISTS `jovenes`;
CREATE TABLE IF NOT EXISTS `jovenes` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `rama` varchar(100) DEFAULT NULL,
  `etapa_progresion` varchar(100) DEFAULT NULL,
  `ingreso` date DEFAULT NULL,
  `responsable` varchar(100) DEFAULT NULL,
  `dni` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `jovenes`
--

INSERT INTO `jovenes` (`id`, `nombre_completo`, `direccion`, `rama`, `etapa_progresion`, `ingreso`, `responsable`, `dni`) VALUES
(7, 'Afiliado0', 'Calle 0 15000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 0', 0),
(8, 'Afiliado1', 'Calle 1 25000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 1', 300000),
(9, 'Afiliado2', 'Calle 2 35000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 2', 600000),
(10, 'Afiliado3', 'Calle 3 45000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 3', 900000),
(11, 'Afiliado4', 'Calle 4 55000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 4', 1200000),
(12, 'Afiliado5', 'Calle 5 65000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 5', 1500000),
(13, 'Afiliado6', 'Calle 6 75000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 6', 1800000),
(14, 'Afiliado7', 'Calle 7 85000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 7', 2100000),
(15, 'Afiliado8', 'Calle 8 95000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 8', 2400000),
(16, 'Afiliado9', 'Calle 9 105000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 9', 2700000),
(17, 'Afiliado10', 'Calle 10 115000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 10', 3000000),
(18, 'Afiliado11', 'Calle 11 125000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 11', 3300000),
(19, 'Afiliado12', 'Calle 12 135000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 12', 3600000),
(20, 'Afiliado13', 'Calle 13 145000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 13', 3900000),
(21, 'Afiliado14', 'Calle 14 155000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 14', 4200000),
(22, 'Afiliado15', 'Calle 15 165000', 'manada', 'Pata Tierna', '2022-09-21', 'Responsable 15', 4500000);
--
-- Base de datos: `home_banking`
--
CREATE DATABASE IF NOT EXISTS `home_banking` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `home_banking`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `dni` int(100) NOT NULL,
  `saldo` int(100) DEFAULT NULL,
  `usuario` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `cbu` bigint(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `dni`, `saldo`, `usuario`, `password`, `cbu`) VALUES
(16, 'Mauro Miguel', 34123567, 0, 'MauMiguel900', '$2y$04$lSx3stWca9ZiiC0pu4/NMe.ru8/156a4CqPvZ4pct4hWZPbO1XWm2', 15722538811),
(17, 'Mariana Ochoa', 32890600, 0, 'MOchoa1990', '$2y$04$vzfiQKGEM6VICUQ86OMxQOBiUlR0IWkYPCdnATuNWN8o9HS/vElS2', 69524976753),
(18, 'Fernando Galindez', 12567800, 0, 'FG1979', '$2y$04$W.O5OLJAm5oLYu9D1YUB8Opqc4xxjZMgwnTqa/Q7SCoxf9PbEJPoG', 76316732935),
(19, 'Ana Maria Mortelaro', 4555800, 0, 'AMMortelaro900', '$2y$04$5SAplMjtpimQqnrx1MewXueNX99AK1jV.X4arozxExahHzrFp9sxa', 77795499076),
(20, 'Roberto Bello', 12800900, 0, 'Bello1980', '$2y$04$Uo9nUOWRDjO43obmj5hG9u52FVS1Kz2zYdlRij5OR5ehhj29qwg7G', 38241818372),
(21, 'Mariano Loa', 12555800, 0, 'MarLoa', '$2y$04$Y4gc8o.vg11wpgIZFQwyR.bA8C4GLbWCse5ev.PdW6Au0qgyXoKQW', 42650579057),
(22, 'Bernardo Macias', 34234777, 0, 'BMas2000', '$2y$04$Qrn.iQzFnojTGCUg2EslK.SXm6kMonJhB4W4XHQHLzhPJ7wJysqne', 22552649919),
(23, 'Angel Damasco', 30666985, 0, 'Damasco1999', '$2y$04$EcqhMQB.FEGQiOYN6Ohr9eXcAbAhg202I.dhnZC.jKH/xLL8qHNp2', 94595975953),
(24, 'Gabriela Garcia', 23666523, 0, 'GG2002', '$2y$04$OhapH8FGTSsdjZGkhbZkJuDiT3iAZ87B4pjFI.6lBsTy5H17umvvC', 92663908737),
(25, 'Lucia Jimenez', 34567999, 0, 'LJimenez2000', '$2y$04$f3HOFxdOCcNXsZXjkqTtceD6GLJ7yGvq1I9QmWXR2anzfxHgWWPXC', 87133866465),
(26, 'Mario Molaro', 6998700, 0, 'MMolaro900', '$2y$04$bzQEVYFwfjRu115t6dDg2e6pEGrivCmFLJ/BBdd/69JFaaupGtr9G', 23095264335),
(27, 'Belardo Dominguez', 46123400, 0, 'BDom1988', '$2y$04$H7NcUqJAlGIMoivEvhz4x.HFWFMPFEp8nj3uNLt4cwTvuWuv3IzJi', 40604203503),
(28, 'Jonathan Denegris', 45600321, 0, 'JD1990', '$2y$04$2pqENrEbkAzyttSfoCfVHuZTCG0oo5b/TXwchQm91fiMyu.5HNiji', 47981899036),
(29, 'Mariana Burgos', 23658124, 0, 'BurgosM1960', '$2y$04$PcbYfYcXc1THOaU.kFhpQ.LtYg5Lkyz2QUIG9KwlN500YFndQ4xuq', 90351829147),
(30, 'Rodrigo Gigena', 34444456, 0, 'RGig1987', '$2y$04$MFWOS0mhQogL5YUlx1RWgOc.AU9enwOsvdPvygMNXT20KJT1zkpVy', 38648524495),
(31, 'Lisandro Arbeloa', 34912000, 0, 'LArbeloa1978', '$2y$04$KZdkGGUhLPhSGq3yNC6gg.pV8Md/APBSswTWS3TSjtasKFK8uJ2RC', 80752127320),
(32, 'Mariano Juarez', 23145150, 0, 'MJuarez', '$2y$04$uUpWxXAOMmqdsFD4KdQaM.tE4gbrRZVDSEOTGbhSSGC3H9Ni5avFG', 60136712004),
(33, 'Martina Novoa', 26999871, 0, 'MNovoa6000', '$2y$04$yiRRU4aZ8Yj1fulOfs3y8u0oJiK6Zav2ndsbZy6qeP6BOhptBKGtO', 79776273029),
(34, 'Julian Zapata', 3500479, 0, 'JuliZap', '$2y$04$uncxVJWUNXB8vIrEKakitu4R5fda3leC4lYsZGfRDt49oW1Mg.ahm', 78890805360),
(35, 'Karina Avalos', 46555120, 0, 'Kavalos1234', '$2y$04$HiIqctFuu/2KbmZtLXCip.KJXQorEH.yuGJrcitWuL10vcu98JpTG', 17850779039),
(36, 'Nicolas Zeballos', 36900874, 0, 'NicoZ', '$2y$04$UE3dRocTjeZPv7pMSEr86OiqnI9mheVjpniStT3lZOx/R67KyNR.O', 46540840006),
(37, 'Hernan Herrera', 23677532, 0, 'Herrera23', '$2y$04$NuTavU3xvh5SubW1CS2DCeyg.TU245KAPTPjEqtDTEVhxJVC1oCQG', 82311512172),
(38, 'Natalia Oyarbe', 36999704, 0, 'OyarbeNat', '$2y$04$I/xjjynUCIzaSAF0jMpRW.K14RJqMo2Eo.PNuNqE7IVKGl0rl.5qC', 42102125408),
(39, 'Teodoro Cazorla', 39999632, 0, 'CazorlaT', '$2y$04$PLEdM2Mf/29TKYYEFP.mZeUqMi8bAFEwuwwcpP0JMlTUymcJbmrcC', 89246920290),
(40, 'Fabricio Sanchez', 6908789, 0, 'FSanchez1234', '$2y$04$q8VkvVBKrSaDpUkCplzKi.oi7SRqifFiWinPvBWpssLgsBE.Pp6DO', 67715459896),
(41, 'Fernando Goa', 36214987, 0, 'FGoa', '$2y$04$maP4fjHRtSdjNrf9/4CDzuywBIzftfh0TW4dek03Vah8PH3Ullczy', 69903714999);
--
-- Base de datos: `instagram`
--
CREATE DATABASE IF NOT EXISTS `instagram` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `instagram`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'primary key',
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `fk_likeuser` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `media` text NOT NULL,
  PRIMARY KEY (`post_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `profile` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_likeuser` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`);

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
--
-- Base de datos: `journal`
--
CREATE DATABASE IF NOT EXISTS `journal` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `journal`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

DROP TABLE IF EXISTS `noticias`;
CREATE TABLE IF NOT EXISTS `noticias` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `fecha` date DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `title`, `content`, `fecha`, `category`) VALUES
(23, 'Asesinato en Villa Lugano', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultricies mauris nisi, non aliquet ligula consequat ac. Suspendisse eu lorem porttitor, tempus dui sit amet, molestie urna. Donec vitae varius risus, ac maximus magna. In sodales massa a convallis feugiat. Donec nec ullamcorper eros, et bibendum turpis. Aenean non orci nunc. Morbi hendrerit mi sed risus commodo euismod pretium quis velit. Quisque in posuere urna.', '2022-08-11', 'Policiales'),
(24, 'Allanamiento narco en Rosario', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultricies mauris nisi, non aliquet ligula consequat ac. Suspendisse eu lorem porttitor, tempus dui sit amet, molestie urna. Donec vitae varius risus, ac maximus magna. In sodales massa a convallis feugiat. Donec nec ullamcorper eros, et bibendum turpis. Aenean non orci nunc. Morbi hendrerit mi sed risus commodo euismod pretium quis velit. Quisque in posuere urna.', '2022-08-23', 'Policiales'),
(25, 'Estudiantes se queda con el clasico platense', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultricies mauris nisi, non aliquet ligula consequat ac. Suspendisse eu lorem porttitor, tempus dui sit amet, molestie urna. Donec vitae varius risus, ac maximus magna. In sodales massa a convallis feugiat. Donec nec ullamcorper eros, et bibendum turpis. Aenean non orci nunc. Morbi hendrerit mi sed risus commodo euismod pretium quis velit. Quisque in posuere urna.', '2022-08-31', 'Deportes'),
(26, 'Cayo banda dedicada al robo de motos en Lanus', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultricies mauris nisi, non aliquet ligula consequat ac. Suspendisse eu lorem porttitor, tempus dui sit amet, molestie urna. Donec vitae varius risus, ac maximus magna. In sodales massa a convallis feugiat. Donec nec ullamcorper eros, et bibendum turpis. Aenean non orci nunc. Morbi hendrerit mi sed risus commodo euismod pretium quis velit. Quisque in posuere urna.', '2022-08-25', 'Policiales'),
(27, 'Intenso bombardeo ruso en Ucrania', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultricies mauris nisi, non aliquet ligula consequat ac. Suspendisse eu lorem porttitor, tempus dui sit amet, molestie urna. Donec vitae varius risus, ac maximus magna. In sodales massa a convallis feugiat. Donec nec ullamcorper eros, et bibendum turpis. Aenean non orci nunc. Morbi hendrerit mi sed risus commodo euismod pretium quis velit. Quisque in posuere urna.', '2022-08-13', 'Internacionales'),
(28, 'Nueva edicion de los premios Martin Fierro', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultricies mauris nisi, non aliquet ligula consequat ac. Suspendisse eu lorem porttitor, tempus dui sit amet, molestie urna. Donec vitae varius risus, ac maximus magna. In sodales massa a convallis feugiat. Donec nec ullamcorper eros, et bibendum turpis. Aenean non orci nunc. Morbi hendrerit mi sed risus commodo euismod pretium quis velit. Quisque in posuere urna.', '2022-08-28', 'Espectaculos'),
(29, 'Nueva sesion en la camara de diputados', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultricies mauris nisi, non aliquet ligula consequat ac. Suspendisse eu lorem porttitor, tempus dui sit amet, molestie urna. Donec vitae varius risus, ac maximus magna. In sodales massa a convallis feugiat. Donec nec ullamcorper eros, et bibendum turpis. Aenean non orci nunc. Morbi hendrerit mi sed risus commodo euismod pretium quis velit. Quisque in posuere urna.', '2022-08-26', 'Politica'),
(30, 'Los Pumas vencieron a Nueva Zelanda', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ultricies mauris nisi, non aliquet ligula consequat ac. Suspendisse eu lorem porttitor, tempus dui sit amet, molestie urna. Donec vitae varius risus, ac maximus magna. In sodales massa a convallis feugiat. Donec nec ullamcorper eros, et bibendum turpis. Aenean non orci nunc. Morbi hendrerit mi sed risus commodo euismod pretium quis velit. Quisque in posuere urna.', '2022-08-27', 'Deportes'),
(31, 'A 100 dias del mundial', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse pharetra sem vitae pretium tempus. Curabitur tellus mi, euismod id scelerisque id, ullamcorper ut massa.', '2022-08-25', 'Deportes'),
(32, 'Reunion del G20', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse pharetra sem vitae pretium tempus. Curabitur tellus mi, euismod id scelerisque id, ullamcorper ut massa.', '2022-08-17', 'Internacionales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `rol` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `rol`, `password`) VALUES
(12, 'Rolando', 'Admin', '$2y$05$qhUO59KRi4Qd3uOAnHA7qOasA/RGkNr.ujKk97zYZvXj6hGdq0Ini'),
(13, 'Matias', 'User', '$2y$05$ckYjcgqBWfurgi/.9Kj3DesZXkmtSpaEbgVHVKQ6ZXrnM3JpSXOrG'),
(14, 'Geremias', 'Admin', '$2y$05$6xYvdIHEfTAit2XW.WV.MOeEWCHesCIXYWqR75qQoZtX4anwrtfzu');
--
-- Base de datos: `laravel_master`
--
CREATE DATABASE IF NOT EXISTS `laravel_master` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `laravel_master`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) DEFAULT NULL,
  `image_id` int(255) DEFAULT NULL,
  `content` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_users` (`user_id`),
  KEY `fk_comments_images` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `image_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'Buena foto de familia!!', '2022-09-16 21:50:38', '2022-09-16 21:50:38'),
(2, 2, 1, 'Buena foto de PLAYA!!', '2022-09-16 21:50:38', '2022-09-16 21:50:38'),
(3, 2, 4, 'que bueno!!', '2022-09-16 21:50:38', '2022-09-16 21:50:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_images_users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `images`
--

INSERT INTO `images` (`id`, `user_id`, `image_path`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'test.jpg', 'descripción de prueba 1', '2022-09-16 21:50:38', '2022-09-16 21:50:38'),
(2, 1, 'playa.jpg', 'descripción de prueba 2', '2022-09-16 21:50:38', '2022-09-16 21:50:38'),
(3, 1, 'arena.jpg', 'descripción de prueba 3', '2022-09-16 21:50:38', '2022-09-16 21:50:38'),
(4, 3, 'familia.jpg', 'descripción de prueba 4', '2022-09-16 21:50:38', '2022-09-16 21:50:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) DEFAULT NULL,
  `image_id` int(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_likes_users` (`user_id`),
  KEY `fk_likes_images` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `likes`
--

INSERT INTO `likes` (`id`, `user_id`, `image_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '2022-09-16 21:50:39', '2022-09-16 21:50:39'),
(2, 2, 4, '2022-09-16 21:50:39', '2022-09-16 21:50:39'),
(3, 3, 1, '2022-09-16 21:50:39', '2022-09-16 21:50:39'),
(4, 3, 2, '2022-09-16 21:50:39', '2022-09-16 21:50:39'),
(5, 2, 1, '2022-09-16 21:50:40', '2022-09-16 21:50:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `surname` varchar(200) DEFAULT NULL,
  `nick` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `role`, `name`, `surname`, `nick`, `email`, `password`, `image`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, 'user', 'Víctor', 'Robles', 'victorroblesweb', 'victor@victor.com', 'pass', NULL, '2022-09-16 21:50:37', '2022-09-16 21:50:37', NULL),
(2, 'user', 'Juan', 'Lopez', 'juanlopez', 'juan@juan.com', 'pass', NULL, '2022-09-16 21:50:37', '2022-09-16 21:50:37', NULL),
(3, 'user', 'Manolo', 'Garcia', 'manologarcia', 'manolo@manolo.com', 'pass', NULL, '2022-09-16 21:50:38', '2022-09-16 21:50:38', NULL),
(4, NULL, 'Mauro', NULL, NULL, 'mauro@mauro.com', '$2y$10$MQbt5C/Q7FQiJQ8Ku5obDu2aj1B201rJ5Grpk2/QO5yqtQd5FdYSO', NULL, '2022-09-21 23:58:12', '2022-09-21 23:58:12', 'xDstpnx8gxoYD6WR2eup9S9V1oyreJgLvEgMUfwuyXDrhiSs0ZQ4P8L7IUGG'),
(5, NULL, 'Damian', NULL, NULL, 'damian@damian.com', '$2y$10$/n4k5rsxQs9yHZmYUHOWjOtwIW5Tz99Y4JsoARbigRo1d3emqZkla', NULL, '2022-09-22 00:01:12', '2022-09-22 00:01:12', 'mQPHD9uPzmSS3lzVf48ERUgAukVT1NYE8Awcpb21qL7kmbPfmuEiLvXKr8Wg'),
(6, NULL, 'Ricardo', 'Martinez', 'RicMartinez', 'ricardo@martinez.com', '$2y$10$4TZlkYW2uw2oj/0ZfY9el.i9/CPHQmWovKT1JIFTENIJyGarceLFi', NULL, '2022-09-22 00:13:50', '2022-09-22 00:13:50', 'AHgqKYnkcnl944amNTMpbBBjGGNOZw63PdANPk9mpb40H0FANAmoH6p6WWOx'),
(7, 'user', 'Mariano', 'Ulloa', 'MUlloa', 'mariano@ulloa.com', '$2y$10$jnqs.Y2vrUrRe1nLm1.VM.QiEBTxSS/xJd4mFoiQ/oiwB.EsPSkf2', NULL, '2022-09-22 00:16:00', '2022-09-22 00:16:00', 'MoXmpkn4eDOqKNwCMjETruXeSyDTBpyKaDhYgIJdHRBU4ulGGmPu1fGVcoEu'),
(8, 'user', 'Roberto', 'Bermudez', 'robert', 'rogert@email.com', '$2y$10$6Hl/aoNUim9cGF4Fq4aoD.ijmcDXGWPwfMFsCCwk6ulH3QQyQzgLe', NULL, '2022-09-22 00:28:48', '2022-09-22 00:28:48', 'fDISPcVylQzuDGOtWgK8oRvvcTxTvu6uJxa1nUQNvGT8P5jUo2ngxjYIaTny');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_images` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `fk_comments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_images_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `fk_likes_images` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`),
  ADD CONSTRAINT `fk_likes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
--
-- Base de datos: `laravel_practica`
--
CREATE DATABASE IF NOT EXISTS `laravel_practica` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `laravel_practica`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `nombre`) VALUES
(1, 'Gaseosas'),
(2, 'Alfajores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `category_id` int(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `precio` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `category_id`, `description`, `precio`) VALUES
(1, 1, 'Pepsi 500mls', '250'),
(2, 2, 'Jorgelin Chocolate', '180');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
--
-- Base de datos: `login`
--
CREATE DATABASE IF NOT EXISTS `login` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `login`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(150) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`) VALUES
(21, 'Renato', '$2y$04$anB7G1LuY0YrvLSz0W3VYu5F8ohtux.K4.7r1bWlTURj.0rYXD6tS'),
(22, 'AlanTorres', '$2y$04$vjT1W22G1vHAfCufllf5YO1KC60lJyWu1tYJ5Od/DA6AROAv6iH1q'),
(23, 'MartinDeRosa', '$2y$04$2Wjvl0.Zhtpy6vKel41MmuAqB8kmp5GP17bfT5FJzlqFpHWoipS4.'),
(24, 'Esculapio', '$2y$04$8Q8pZK3a3fSDG3EKlGAJFOCh72.Xp5ofQ3IeOZpRyaioSrhXNaf4e');
--
-- Base de datos: `mvc`
--
CREATE DATABASE IF NOT EXISTS `mvc` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mvc`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
--
-- Base de datos: `negocio`
--
CREATE DATABASE IF NOT EXISTS `negocio` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `negocio`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(2, 'Gaseosas'),
(3, 'Helados'),
(4, 'Cigarrillos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(100) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `precio` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria_id`, `descripcion`, `precio`) VALUES
(1, 2, 'Coca Cola 600mls', 150);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
--
-- Base de datos: `notas_master`
--
CREATE DATABASE IF NOT EXISTS `notas_master` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `notas_master`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

DROP TABLE IF EXISTS `notas`;
CREATE TABLE IF NOT EXISTS `notas` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` mediumtext,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entrada_usuario` (`usuario_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Base de datos: `php-mysql`
--
CREATE DATABASE IF NOT EXISTS `php-mysql` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `php-mysql`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

DROP TABLE IF EXISTS `notas`;
CREATE TABLE IF NOT EXISTS `notas` (
  `id` int(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `color` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id`, `titulo`, `descripcion`, `color`) VALUES
(1, 'Nota 1', 'Hacer los ejercicios de SQL', 'red'),
(2, 'Aprendiendo PHP  ', 'Master de PHP de Víctor Robles Web', 'yellow'),
(3, 'Nota Nueva', 'Esta nota es nueva', 'pink'),
(4, 'Nota Nueva2', 'He creado una nueva nota', 'green'),
(5, 'Nota desde PHP', 'Esto es una nota de PHP', 'violet'),
(6, 'New Note', 'This is a new note', 'ligthblue');
--
-- Base de datos: `php_blog`
--
CREATE DATABASE IF NOT EXISTS `php_blog` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `php_blog`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

DROP TABLE IF EXISTS `entradas`;
CREATE TABLE IF NOT EXISTS `entradas` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(255) NOT NULL,
  `categoria_id` int(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` mediumtext,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entrada_usuario` (`usuario_id`),
  KEY `fk_entrada_categoria` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `fk_entrada_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `fk_entrada_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
--
-- Base de datos: `pizzeria`
--
CREATE DATABASE IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pizzeria`;
--
-- Base de datos: `practica_mvc`
--
CREATE DATABASE IF NOT EXISTS `practica_mvc` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `practica_mvc`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

DROP TABLE IF EXISTS `notas`;
CREATE TABLE IF NOT EXISTS `notas` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(255) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` mediumtext,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entrada_usuario` (`usuario_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Base de datos: `practice`
--
CREATE DATABASE IF NOT EXISTS `practice` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `practice`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
--
-- Base de datos: `prueba`
--
CREATE DATABASE IF NOT EXISTS `prueba` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `prueba`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `username` varchar(150) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`username`, `password`) VALUES
('Ramiro5000', '$2y$04$xLonveREEpYJ0Acds/39QuzPJ84mLG9cEVgtil9Wok0uk4s4RLY.C'),
('dasasdsad', '$2y$04$Lt5SoFfEwxHj30Ka/7p5pOc77a34NY7t7bEn3MCCu1q4nLDL4uk2C'),
('Dario92200', '$2y$04$X96U/Bs0jX1cIFLLpyCTIeV3AQykH2C2U.qtknResfLq1seGVXNpu'),
('Javiersda', '$2y$04$zLznnoM0XT9P0u4JvrGz6OpouebAKGRBBsZMTGD.GQaztiY.fuDi.'),
('AlanNicolas8', '$2y$04$P3f7SEJHpb.o150vnylVV.HP4NNqOgrqvpSVRAciUzldqpdm1T8k2'),
('Kiko3', '$2y$04$aoPPftlCE3rlxJG7yuYbCuK8eRh.Chs1Z9nPF9aIipSRcxmvWn9.2'),
('Usuario0', '@@%%0'),
('Usuario1', '@@%%1.5'),
('Usuario2', '@@%%3'),
('Usuario3', '@@%%4.5'),
('Usuario4', '@@%%6'),
('Usuario5', '@@%%7.5'),
('Usuario6', '@@%%9'),
('Usuario7', '@@%%10.5'),
('Usuario8', '@@%%12'),
('Usuario9', '@@%%13.5'),
('Usuario10', '@@%%15'),
('Usuario11', '@@%%16.5'),
('Usuario12', '@@%%18'),
('Usuario13', '@@%%19.5'),
('Usuario14', '@@%%21'),
('Usuario15', '@@%%22.5');
--
-- Base de datos: `prueba_laravel`
--
CREATE DATABASE IF NOT EXISTS `prueba_laravel` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `prueba_laravel`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=255 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`) VALUES
(54, 'Username0', '0'),
(55, 'Username1', '1.57'),
(56, 'Username2', '2.0933333333333'),
(57, 'Username3', '2.355'),
(58, 'Username4', '2.512'),
(59, 'Username5', '2.6166666666667'),
(60, 'Username6', '2.6914285714286'),
(61, 'Username7', '2.7475'),
(62, 'Username8', '2.7911111111111'),
(63, 'Username9', '2.826'),
(64, 'Username10', '2.8545454545455'),
(65, 'Username11', '2.8783333333333'),
(66, 'Username12', '2.8984615384615'),
(67, 'Username13', '2.9157142857143'),
(68, 'Username14', '2.9306666666667'),
(69, 'Username15', '2.94375'),
(70, 'Username16', '2.9552941176471'),
(71, 'Username17', '2.9655555555556'),
(72, 'Username18', '2.9747368421053'),
(73, 'Username19', '2.983'),
(74, 'Username20', '2.9904761904762'),
(75, 'Username21', '2.9972727272727'),
(76, 'Username22', '3.0034782608696'),
(77, 'Username23', '3.0091666666667'),
(78, 'Username24', '3.0144'),
(79, 'Username25', '3.0192307692308'),
(80, 'Username26', '3.0237037037037'),
(81, 'Username27', '3.0278571428571'),
(82, 'Username28', '3.031724137931'),
(83, 'Username29', '3.0353333333333'),
(84, 'Username30', '3.0387096774194'),
(85, 'Username31', '3.041875'),
(86, 'Username32', '3.0448484848485'),
(87, 'Username33', '3.0476470588235'),
(88, 'Username34', '3.0502857142857'),
(89, 'Username35', '3.0527777777778'),
(90, 'Username36', '3.0551351351351'),
(91, 'Username37', '3.0573684210526'),
(92, 'Username38', '3.0594871794872'),
(93, 'Username39', '3.0615'),
(94, 'Username40', '3.0634146341463'),
(95, 'Username41', '3.0652380952381'),
(96, 'Username42', '3.066976744186'),
(97, 'Username43', '3.0686363636364'),
(98, 'Username44', '3.0702222222222'),
(99, 'Username45', '3.0717391304348'),
(100, 'Username46', '3.0731914893617'),
(101, 'Username47', '3.0745833333333'),
(102, 'Username48', '3.0759183673469'),
(103, 'Username49', '3.0772'),
(104, 'Username50', '3.078431372549'),
(105, 'Username51', '3.0796153846154'),
(106, 'Username52', '3.0807547169811'),
(107, 'Username53', '3.0818518518519'),
(108, 'Username54', '3.0829090909091'),
(109, 'Username55', '3.0839285714286'),
(110, 'Username56', '3.0849122807018'),
(111, 'Username57', '3.0858620689655'),
(112, 'Username58', '3.0867796610169'),
(113, 'Username59', '3.0876666666667'),
(114, 'Username60', '3.0885245901639'),
(115, 'Username61', '3.0893548387097'),
(116, 'Username62', '3.0901587301587'),
(117, 'Username63', '3.0909375'),
(118, 'Username64', '3.0916923076923'),
(119, 'Username65', '3.0924242424242'),
(120, 'Username66', '3.0931343283582'),
(121, 'Username67', '3.0938235294118'),
(122, 'Username68', '3.0944927536232'),
(123, 'Username69', '3.0951428571429'),
(124, 'Username70', '3.0957746478873'),
(125, 'Username71', '3.0963888888889'),
(126, 'Username72', '3.0969863013699'),
(127, 'Username73', '3.0975675675676'),
(128, 'Username74', '3.0981333333333'),
(129, 'Username75', '3.0986842105263'),
(130, 'Username76', '3.0992207792208'),
(131, 'Username77', '3.0997435897436'),
(132, 'Username78', '3.100253164557'),
(133, 'Username79', '3.10075'),
(134, 'Username80', '3.1012345679012'),
(135, 'Username81', '3.1017073170732'),
(136, 'Username82', '3.1021686746988'),
(137, 'Username83', '3.102619047619'),
(138, 'Username84', '3.1030588235294'),
(139, 'Username85', '3.103488372093'),
(140, 'Username86', '3.103908045977'),
(141, 'Username87', '3.1043181818182'),
(142, 'Username88', '3.1047191011236'),
(143, 'Username89', '3.1051111111111'),
(144, 'Username90', '3.1054945054945'),
(145, 'Username91', '3.1058695652174'),
(146, 'Username92', '3.1062365591398'),
(147, 'Username93', '3.1065957446809'),
(148, 'Username94', '3.1069473684211'),
(149, 'Username95', '3.1072916666667'),
(150, 'Username96', '3.1076288659794'),
(151, 'Username97', '3.1079591836735'),
(152, 'Username98', '3.1082828282828'),
(153, 'Username99', '3.1086'),
(154, 'Username100', '3.1089108910891'),
(155, 'Username101', '3.1092156862745'),
(156, 'Username102', '3.1095145631068'),
(157, 'Username103', '3.1098076923077'),
(158, 'Username104', '3.1100952380952'),
(159, 'Username105', '3.1103773584906'),
(160, 'Username106', '3.1106542056075'),
(161, 'Username107', '3.1109259259259'),
(162, 'Username108', '3.1111926605505'),
(163, 'Username109', '3.1114545454545'),
(164, 'Username110', '3.1117117117117'),
(165, 'Username111', '3.1119642857143'),
(166, 'Username112', '3.1122123893805'),
(167, 'Username113', '3.1124561403509'),
(168, 'Username114', '3.1126956521739'),
(169, 'Username115', '3.1129310344828'),
(170, 'Username116', '3.1131623931624'),
(171, 'Username117', '3.1133898305085'),
(172, 'Username118', '3.1136134453782'),
(173, 'Username119', '3.1138333333333'),
(174, 'Username120', '3.1140495867769'),
(175, 'Username121', '3.114262295082'),
(176, 'Username122', '3.1144715447154'),
(177, 'Username123', '3.1146774193548'),
(178, 'Username124', '3.11488'),
(179, 'Username125', '3.1150793650794'),
(180, 'Username126', '3.1152755905512'),
(181, 'Username127', '3.11546875'),
(182, 'Username128', '3.1156589147287'),
(183, 'Username129', '3.1158461538462'),
(184, 'Username130', '3.1160305343511'),
(185, 'Username131', '3.1162121212121'),
(186, 'Username132', '3.1163909774436'),
(187, 'Username133', '3.1165671641791'),
(188, 'Username134', '3.1167407407407'),
(189, 'Username135', '3.1169117647059'),
(190, 'Username136', '3.1170802919708'),
(191, 'Username137', '3.1172463768116'),
(192, 'Username138', '3.1174100719424'),
(193, 'Username139', '3.1175714285714'),
(194, 'Username140', '3.1177304964539'),
(195, 'Username141', '3.1178873239437'),
(196, 'Username142', '3.118041958042'),
(197, 'Username143', '3.1181944444444'),
(198, 'Username144', '3.1183448275862'),
(199, 'Username145', '3.1184931506849'),
(200, 'Username146', '3.1186394557823'),
(201, 'Username147', '3.1187837837838'),
(202, 'Username148', '3.1189261744966'),
(203, 'Username149', '3.1190666666667'),
(204, 'Username150', '3.1192052980132'),
(205, 'Username151', '3.1193421052632'),
(206, 'Username152', '3.119477124183'),
(207, 'Username153', '3.1196103896104'),
(208, 'Username154', '3.1197419354839'),
(209, 'Username155', '3.1198717948718'),
(210, 'Username156', '3.12'),
(211, 'Username157', '3.1201265822785'),
(212, 'Username158', '3.120251572327'),
(213, 'Username159', '3.120375'),
(214, 'Username160', '3.1204968944099'),
(215, 'Username161', '3.1206172839506'),
(216, 'Username162', '3.120736196319'),
(217, 'Username163', '3.1208536585366'),
(218, 'Username164', '3.1209696969697'),
(219, 'Username165', '3.1210843373494'),
(220, 'Username166', '3.1211976047904'),
(221, 'Username167', '3.1213095238095'),
(222, 'Username168', '3.1214201183432'),
(223, 'Username169', '3.1215294117647'),
(224, 'Username170', '3.1216374269006'),
(225, 'Username171', '3.1217441860465'),
(226, 'Username172', '3.1218497109827'),
(227, 'Username173', '3.1219540229885'),
(228, 'Username174', '3.1220571428571'),
(229, 'Username175', '3.1221590909091'),
(230, 'Username176', '3.1222598870056'),
(231, 'Username177', '3.1223595505618'),
(232, 'Username178', '3.1224581005587'),
(233, 'Username179', '3.1225555555556'),
(234, 'Username180', '3.1226519337017'),
(235, 'Username181', '3.1227472527473'),
(236, 'Username182', '3.1228415300546'),
(237, 'Username183', '3.1229347826087'),
(238, 'Username184', '3.123027027027'),
(239, 'Username185', '3.1231182795699'),
(240, 'Username186', '3.1232085561497'),
(241, 'Username187', '3.1232978723404'),
(242, 'Username188', '3.1233862433862'),
(243, 'Username189', '3.1234736842105'),
(244, 'Username190', '3.1235602094241'),
(245, 'Username191', '3.1236458333333'),
(246, 'Username192', '3.1237305699482'),
(247, 'Username193', '3.1238144329897'),
(248, 'Username194', '3.1238974358974'),
(249, 'Username195', '3.1239795918367'),
(250, 'Username196', '3.1240609137056'),
(251, 'Username197', '3.1241414141414'),
(252, 'Username198', '3.1242211055276'),
(253, 'Username199', '3.1243'),
(254, 'Username200', '3.1243781094527');
--
-- Base de datos: `rivcafest`
--
CREATE DATABASE IF NOT EXISTS `rivcafest` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `rivcafest`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `price` int(100) NOT NULL,
  `description` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `user`, `password`, `price`, `description`) VALUES
(1, 'Admin', '$2y$05$YYVnLMSYUGEiO0u/NngOUuT6QMmFBQpKU4uH8jbrqSISd9aW8x.rS', 18000, 'CASA QUINTA SOBRE 5 LOTES, 2963mÂ², UBICADA EN LA CALLE 237 ENTRE 40 Y 41- ÃNGEL ETCHEVERRY - LISANDRO OLMOS - PARTIDO DE LA PLATA. A 200 METROS DE LA RUTA 2 y LA RUTA 215. COMODIDADES: QUINCHO DE 15X6MTS CON COCINA MUY AMPLIA CON PARRILLA DE 2.4MTS Y BARRA DE DISEÃ‘O. MESA DE ALGARROBO PARA 12 PERSONAS. 2 BAÃ‘OS TIPO VESTUARIOS - DAMA Y CABALLERO. CUARTO AUXILIAR CON DOS HELADERAS Y UN FREEZER. 3 DORMITORIOS CON CAMA MATRIMONIAL Y SUPERPUESTAS. 2 BAÃ‘O COMPLETOS. TERRENO LIBRE PARQUIZADO CON CANCHA DE FUTBOL. PILETA DE NATACIÃ“N DE 11X4MTS CON BARRAL PERIMETRAL ZONA BAJA PARA NIÃ‘OS Y SOLARIUM. PERGOLA CON ASADOR Y PARRILLA. FRONDOSO PARQUE DE ARBOLES ORNAMENTALES Y PALMERAS DECORATIVAS. CUARTO CON TRES DOS HELADERAS Y UN FREEZER. IDEAL PARA EL DESCANSO Y DISFRUTAR AL AIRE LIBRE EN FAMILIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE IF NOT EXISTS `reserva` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `initial_date` date DEFAULT NULL,
  `final_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
--
-- Base de datos: `store`
--
CREATE DATABASE IF NOT EXISTS `store` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `store`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `precio` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `precio`) VALUES
(1, 'Leche 1lt', 150),
(2, 'Aceite Cañuelas 2lts', 450),
(5, 'Papel de cocina Sussex', 220),
(6, 'Yogurt Sancor Frutilla', 300);
--
-- Base de datos: `tienda_master`
--
CREATE DATABASE IF NOT EXISTS `tienda_master` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `tienda_master`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Manga Corta'),
(2, 'Tirantes'),
(3, 'Manga Larga'),
(4, 'Sudaderas'),
(5, 'Lucha libre'),
(6, 'Running'),
(7, 'Gorra'),
(8, 'Chaquetas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas_pedidos`
--

DROP TABLE IF EXISTS `lineas_pedidos`;
CREATE TABLE IF NOT EXISTS `lineas_pedidos` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(255) NOT NULL,
  `producto_id` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_linea_pedido` (`pedido_id`),
  KEY `fk_linea_producto` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(255) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `localidad` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `coste` float(200,2) NOT NULL,
  `estado` varchar(20) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedidos_usuario` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(255) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` float(100,2) NOT NULL,
  `stock` int(255) NOT NULL,
  `oferta` varchar(2) DEFAULT NULL,
  `fecha` date NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_producto_categoria` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria_id`, `nombre`, `descripcion`, `precio`, `stock`, `oferta`, `fecha`, `imagen`) VALUES
(1, 1, 'Box logo supreme', 'Box logo supreme', 100.00, 20, NULL, '2022-08-19', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `email`, `password`, `rol`, `imagen`) VALUES
(1, 'Admin', 'Admin', 'admin@admin.com', 'contraseña', 'Admin', NULL),
(2, 'Kevin', 'Roldan', 'kevin@roldan.com', '$2y$10$hO2wtzFsqW7oMvDBtdJ8k.hGXP4axIMpswEh6ceXAPTa73CGSnJKu', 'user', NULL),
(3, 'Maximiliano', 'Rodriguez', 'mazi@rodriguez.com', '$2y$10$mvaElDlLJkOsZucQUzwIHu/LsKkGDf7Y4TLQGpVedvue8Xe81ZMfi', 'user', NULL),
(4, 'Fernando', 'Galindez', 'fer@galindez.com', '$2y$10$9O9Dn/ZQjCrLIZrHZzcpgO.2V6B/lak2srEVXSpGZUDSE4CgzTx7W', 'user', NULL),
(5, 'Freddy', 'Ochoa', 'freddy@ochoa.com', '$2y$10$8nKb9GBIGUDryWLgYS8IeOGY8/606FrrWAecovBg7dEpkxcwEaNyi', 'user', NULL),
(6, 'Julieta', 'Venegas', 'juli@venegas.com', '$2y$10$3mEfGAEDZzlFFZs6.Lnfoey5u/6o3dCYJ45Vb9123QbxFg2uGbAgC', 'user', NULL),
(7, 'Ronaldo', 'Assis', 'ronaldo@correo.com', '$2y$10$IkQwxONwB4F2saWhaYs4fObZ1Za0tcJ//R8d3L2ABh0ZeEsswFxIa', 'admin', NULL),
(8, 'Luciano', 'Gonzales', 'lucho@gonzales.com', '$2y$10$uIZwDkj/8piP9Q5.2YR.4.Uaz8mKrdX5XIPczT36dszhpfZQWnj6O', 'user', NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `lineas_pedidos`
--
ALTER TABLE `lineas_pedidos`
  ADD CONSTRAINT `fk_linea_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`),
  ADD CONSTRAINT `fk_linea_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
