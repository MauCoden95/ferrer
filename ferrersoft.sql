-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 09-09-2022 a las 02:06:43
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
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Herramienta Manual'),
(2, 'Sierras'),
(3, 'Electricidad'),
(4, 'Madera'),
(5, 'Accesorios');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `categoria_id`, `proveedor_id`, `descripcion`, `precio`, `stock`, `stock_reposicion`, `imagen`) VALUES
(1, 1, 1, 'Sierra Circular 500cc', 45000, 23, 20, NULL),
(2, 1, 3, 'Lijadora 1000cc', 12000, 10, 12, NULL),
(3, 3, 9, 'Tester Digital', 6000, 20, 12, NULL),
(4, 3, 5, 'Protector de tension para televisores', 1100, 34, 37, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

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
(10, 'Soddic Hnos', 'Juncal 2701', 'CABA', 447, 48990514, '24619323447'),
(11, 'Equipamientos Benito Juarez ', 'Benito Juarez 2159', 'CABA', 1407, 45660462, '27969436545');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
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


CREATE TABLE cajas(
  id int(255) auto_increment not null,
  apertura int(100) not null,
  cierre int(100) null,
  fecha date,
  constraint pk_caja PRIMARY KEY(id)
)Engine=InnoDb;



CREATE TABLE empleados(
  id int(255) auto_increment,
  nombre VARCHAR(255) not null,
  dni int(255) not null,
  cargo VARCHAR(255) not null,
  Direccion VARCHAR(255) not null,
  telefono int(255) not null,
  fecha_nacimiento date,
  sueldo int(255) null,
  constraint pk_empleados PRIMARY KEY(id)
)Engine=InnoDb;

