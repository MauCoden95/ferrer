-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 14-09-2022 a las 03:17:29
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
-- Base de datos: `ferrersoft`
--

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cajas`
--

INSERT INTO `cajas` (`id`, `apertura`, `cierre`, `fecha`) VALUES
(14, 44500, 56200, '2022-09-09'),
(15, 56200, 58900, '2022-09-10'),
(17, 58900, 76570, '2022-09-12'),
(18, 76570, 99541, '2022-09-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Herramienta Manual'),
(2, 'Sierras'),
(3, 'Electricidad'),
(4, 'Madera'),
(5, 'Accesorios'),
(6, 'Medidores');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `dni`, `cargo`, `Direccion`, `Ciudad`, `telefono`, `fecha_nacimiento`, `sueldo`) VALUES
(1, 'David Mena', 32312576, 'Jefe', '25 de Mayo 764','CABA', 43107000, '1980-03-25', 1250000),
(2, 'Renata Zambrano', 38087858, 'Cajera', 'Costa Rica 3990','CABA', 48210842, '1997-09-20', 60000),
(3, 'Luciana Navarro Segundo', 36926065, 'Jefa', 'Caaguazú 6299','Lanus', 46410756, '1971-04-07', 1250000);


INSERT INTO empleados VALUES(NULL, 'Luciana Navarro Segundo', 36926065, 'Jefa', 'Caaguazú 6299','Lanus', 46410756, '1971-04-07', 125000);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria_id`, `proveedor_id`, `descripcion`, `precio`, `stock`, `stock_reposicion`, `imagen`) VALUES
(1, 1, 1, 'Sierra Circular 500cc', 45000, 23, 20, NULL),
(2, 1, 3, 'Lijadora 1000cc', 12000, 10, 12, NULL),
(3, 3, 9, 'Tester Digital', 6000, 20, 12, NULL),
(4, 3, 5, 'Protector de tension para televisores', 1100, 34, 37, NULL),
(5, 3, 7, 'Cable 10mts cobre', 1500, 150, 109, NULL),
(6, 3, 9, 'Interruptor diferencial 30MA', 4500, 34, 37, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `razon_social`, `direccion`, `ciudad`, `codigo_postal`, `telefono`, `cuit`) VALUES
(1, 'Black & Decker SRL', 'Carlos Pinto 8900', 'Berazategui', 4378, 46376737, '27936190621'),
(2, 'Herramientas Lugo SA', 'Av. La Plata 120', 'CABA', 3456, 46376737, '27694888823'),
(3, 'Equipamientos Liniers', 'Av. Rivadavia 7000', 'CABA', 2333, 14415535, '27620535570'),
(4, 'Herramientas Once SRL', 'Pueyrredon 350', 'CABA', 1116, 11116737, '20260085000'),
(5, 'Luisito y CIA.', 'Montevideo 666', 'CABA', 9990, 14888535, '27213460922'),
(6, 'LLaves y Herrajes SRL', 'Zabala 1925', 'CABA', 3655, 43745086, '30461515947'),
(7, 'Herramientas Recoleta', 'Av Estado de Israel 4230', 'CABA', 4450, 13333737, '30263102769'),
(8, 'Lussay SRL', 'Av Pueyrredon 146', 'Avellaneda', 9999, 14882387, '24783954679'),
(9, 'Miraflor Herramientas', 'Jorge Luis Borges 2076', 'Lanus', 2023, 48990514, '24619323447'),
(11, 'Equipamientos Benito Juarez ', 'Benito Juarez 2159', 'CABA', 1407, 45660462, '27969436545'),
(12, 'Manuel Aguilar & Hnos', 'La Rioja 442', 'CABA', 1450, 49128522, '27328671080'),
(13, 'Herramientas Amaya', 'Av Juan Bautista Alberdi 401', 'CABA', 1424, 49017622, '30264544048');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `rol`, `password`, `image`) VALUES
(1, 'Mauro1995', 'Usuario Comun', '$2y$05$y3S0z.i5yccIo6L.cpFNs.XDzvuA/eU4mUqfRNgf.9InOLclHdkMa', NULL);


INSERT INTO usuarios VALUES(NULL,33,'LuciNavarro','Administrador','Admin1990',NULL);
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_producto_categorias` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


CREATE TABLE usuarios(
  id int(255) auto_increment not null,
  empleado_id int(255) not null,
  username VARCHAR(255) not null,
  rol VARCHAR(255) not null,
  password VARCHAR(255) not null,
  constraint pk_usuarios PRIMARY KEY(id),
  constraint pk_usuarios_empleados FOREIGN KEY(id) REFERENCES empleados(id)
)Engine=InnoDb;


INSERT INTO usuarios VALUES(NULL,1,'DavidM','Admin',);
