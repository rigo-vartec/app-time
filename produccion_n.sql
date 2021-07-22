-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2021 a las 03:02:47
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `database_demo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion_n`
--

CREATE TABLE `produccion_n` (
  `id` int(5) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `num_machine` varchar(5) NOT NULL,
  `hora_1` int(5) NOT NULL DEFAULT 0,
  `hora_2` int(5) NOT NULL DEFAULT 0,
  `hora_3` int(5) NOT NULL DEFAULT 0,
  `hora_4` int(5) NOT NULL DEFAULT 0,
  `hora_5` int(5) NOT NULL DEFAULT 0,
  `hora_6` int(5) NOT NULL DEFAULT 0,
  `hora_7` int(5) NOT NULL DEFAULT 0,
  `step` varchar(5) NOT NULL DEFAULT '1',
  `bloque` int(2) NOT NULL,
  `turno` varchar(10) NOT NULL DEFAULT 'NOCHE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `produccion_n`
--

INSERT INTO `produccion_n` (`id`, `fecha`, `num_machine`, `hora_1`, `hora_2`, `hora_3`, `hora_4`, `hora_5`, `hora_6`, `hora_7`, `step`, `bloque`, `turno`) VALUES
(156, '2021-06-21', 'A12', 0, 1, 2000, 0, 0, 0, 0, '1', 1, 'NOCHE'),
(157, '2021-06-21', 'G01', 0, 1, 2000, 0, 0, 0, 0, '1', 1, 'NOCHE'),
(158, '2021-06-21', 'A11', 0, 1, 3000, 0, 0, 0, 0, '1', 1, 'NOCHE'),
(159, '2021-06-21', 'A10', 0, 1, 4000, 0, 0, 0, 0, '1', 1, 'NOCHE'),
(160, '2021-06-21', 'G04', 0, 1, 0, 0, 0, 0, 0, '1', 1, 'NOCHE'),
(161, '2021-06-27', 'A12', 0, 0, 0, 0, 0, 0, 0, '1', 1, 'NOCHE'),
(162, '2021-06-27', 'G01', 0, 0, 0, 0, 0, 0, 0, '1', 1, 'NOCHE'),
(163, '2021-06-27', 'A11', 0, 0, 0, 0, 0, 0, 0, '1', 1, 'NOCHE'),
(164, '2021-06-27', 'A10', 0, 0, 0, 0, 0, 0, 0, '1', 1, 'NOCHE'),
(165, '2021-06-27', 'G04', 0, 0, 0, 0, 11, 0, 0, '1', 1, 'NOCHE'),
(166, '2021-06-27', 'A04', 0, 0, 0, 21, 0, 0, 0, '1', 3, 'NOCHE'),
(167, '2021-06-27', 'X06', 0, 0, 0, 24, 0, 0, 0, '1', 3, 'NOCHE'),
(168, '2021-06-27', 'A05', 0, 0, 0, 28, 0, 0, 0, '1', 3, 'NOCHE'),
(169, '2021-06-27', 'X07', 0, 0, 0, 13, 0, 0, 0, '1', 3, 'NOCHE');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `produccion_n`
--
ALTER TABLE `produccion_n`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `produccion_n`
--
ALTER TABLE `produccion_n`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
