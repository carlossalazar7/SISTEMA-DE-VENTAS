-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 30-08-2021 a las 18:52:32
-- Versión del servidor: 5.6.41-84.1
-- Versión de PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `oportuni_despega_quiz`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MT_atributos`
--

CREATE TABLE `MT_atributos` (
  `id` int(6) UNSIGNED NOT NULL,
  `fk_categoria` int(6) UNSIGNED NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `unidades` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `MT_atributos`
--

INSERT INTO `MT_atributos` (`id`, `fk_categoria`, `nombre`, `unidades`) VALUES
(1, 1, 'tamaño pantalla', 'pulgadas'),
(2, 1, 'RAM', 'GB'),
(3, 1, 'tipo bateria', ''),
(4, 1, 'SO', ''),
(5, 2, 'HHDD', 'GB'),
(6, 2, 'RAM', 'GB'),
(7, 2, 'velocidad procesador', 'GHz'),
(8, 2, 'SO', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MT_categorias`
--

CREATE TABLE `MT_categorias` (
  `id` int(6) UNSIGNED NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `MT_categorias`
--

INSERT INTO `MT_categorias` (`id`, `nombre`) VALUES
(1, 'smartphone'),
(2, 'laptop');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MT_productos`
--

CREATE TABLE `MT_productos` (
  `id` int(6) UNSIGNED NOT NULL,
  `fk_categoria` int(6) UNSIGNED NOT NULL,
  `nombre` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `MT_productos`
--

INSERT INTO `MT_productos` (`id`, `fk_categoria`, `nombre`) VALUES
(1, 1, 'iGal 7S'),
(2, 2, 'notebookPro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RL_atributos_producto`
--

CREATE TABLE `RL_atributos_producto` (
  `id` int(6) UNSIGNED NOT NULL,
  `fk_producto` int(6) UNSIGNED NOT NULL,
  `fk_atributo` int(6) UNSIGNED NOT NULL,
  `valor` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `RL_atributos_producto`
--

INSERT INTO `RL_atributos_producto` (`id`, `fk_producto`, `fk_atributo`, `valor`) VALUES
(1, 1, 1, '5'),
(2, 1, 2, 'GB'),
(3, 1, 3, 'Ion Litio'),
(4, 1, 4, 'Android');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `MT_atributos`
--
ALTER TABLE `MT_atributos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categoria` (`fk_categoria`);

--
-- Indices de la tabla `MT_categorias`
--
ALTER TABLE `MT_categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `MT_productos`
--
ALTER TABLE `MT_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categoria` (`fk_categoria`);

--
-- Indices de la tabla `RL_atributos_producto`
--
ALTER TABLE `RL_atributos_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_producto` (`fk_producto`),
  ADD KEY `fk_atributo` (`fk_atributo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `MT_atributos`
--
ALTER TABLE `MT_atributos`
  ADD CONSTRAINT `MT_atributos_ibfk_1` FOREIGN KEY (`fk_categoria`) REFERENCES `MT_categorias` (`id`);

--
-- Filtros para la tabla `MT_productos`
--
ALTER TABLE `MT_productos`
  ADD CONSTRAINT `MT_productos_ibfk_1` FOREIGN KEY (`fk_categoria`) REFERENCES `MT_categorias` (`id`);

--
-- Filtros para la tabla `RL_atributos_producto`
--
ALTER TABLE `RL_atributos_producto`
  ADD CONSTRAINT `RL_atributos_producto_ibfk_1` FOREIGN KEY (`fk_producto`) REFERENCES `MT_productos` (`id`),
  ADD CONSTRAINT `RL_atributos_producto_ibfk_2` FOREIGN KEY (`fk_atributo`) REFERENCES `MT_atributos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
