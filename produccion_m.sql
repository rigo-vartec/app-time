-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2021 a las 03:02:39
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
-- Estructura de tabla para la tabla `produccion_m`
--

CREATE TABLE `produccion_m` (
  `id` int(5) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `num_machine` varchar(5) NOT NULL,
  `hora_1` int(5) NOT NULL,
  `hora_2` int(5) NOT NULL,
  `hora_3` int(5) NOT NULL,
  `hora_4` int(5) NOT NULL,
  `hora_5` int(5) NOT NULL,
  `hora_6` int(5) NOT NULL,
  `hora_7` int(5) NOT NULL,
  `hora_8` int(5) NOT NULL,
  `hora_9` int(5) NOT NULL,
  `hora_10` int(5) NOT NULL,
  `step` varchar(2) NOT NULL DEFAULT '1',
  `bloque` int(2) NOT NULL,
  `turno` varchar(10) NOT NULL DEFAULT 'MAÑANA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `produccion_m`
--

INSERT INTO `produccion_m` (`id`, `fecha`, `num_machine`, `hora_1`, `hora_2`, `hora_3`, `hora_4`, `hora_5`, `hora_6`, `hora_7`, `hora_8`, `hora_9`, `hora_10`, `step`, `bloque`, `turno`) VALUES
(1, '2021-06-20', 'A12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'MAÑANA'),
(2, '2021-06-20', 'G01', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'MAÑANA'),
(3, '2021-06-20', 'A11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'MAÑANA'),
(4, '2021-06-20', 'A10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'MAÑANA'),
(5, '2021-06-20', 'G04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'MAÑANA');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `produccion_m`
--
ALTER TABLE `produccion_m`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `produccion_m`
--
ALTER TABLE `produccion_m`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
