-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-11-2023 a las 16:59:45
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba_cansultas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `IdCategoria` int(11) NOT NULL,
  `NombreCategoria` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`IdCategoria`, `NombreCategoria`) VALUES
(1, 'cocina'),
(2, 'tecnologicos'),
(3, 'higiene'),
(4, 'mascotas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `CodigoProd` int(11) NOT NULL,
  `NombreProd` varchar(20) NOT NULL,
  `CategoriaProd` int(11) NOT NULL,
  `Precio` varchar(50) NOT NULL,
  `Cantidad` tinyint(150) NOT NULL,
  `Disponibilidad` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`CodigoProd`, `NombreProd`, `CategoriaProd`, `Precio`, `Cantidad`, `Disponibilidad`) VALUES
(1, 'panela', 1, '36000', 20, 1),
(2, 'Televisor', 2, '700000', 11, 1),
(3, 'Galletas perro', 4, '18000', 35, 1),
(4, 'Acondicionador', 3, '30000', 15, 1),
(5, 'Celulares', 2, '500000', 5, 1),
(6, 'Collares', 4, '20000', 50, 1),
(7, 'Nevera', 1, '500000', 2, 0),
(8, 'estufa', 1, '400000', 5, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`IdCategoria`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`CodigoProd`),
  ADD KEY `CategoriaProd` (`CategoriaProd`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `IdCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `CodigoProd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`CategoriaProd`) REFERENCES `categoria` (`IdCategoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
