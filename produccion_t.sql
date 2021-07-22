-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2021 a las 03:02:54
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
-- Estructura de tabla para la tabla `produccion_t`
--

CREATE TABLE `produccion_t` (
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
  `step` varchar(5) NOT NULL DEFAULT '1',
  `bloque` int(2) NOT NULL,
  `turno` varchar(10) NOT NULL DEFAULT 'TARDE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `produccion_t`
--

INSERT INTO `produccion_t` (`id`, `fecha`, `num_machine`, `hora_1`, `hora_2`, `hora_3`, `hora_4`, `hora_5`, `hora_6`, `hora_7`, `hora_8`, `hora_9`, `hora_10`, `step`, `bloque`, `turno`) VALUES
(54, '2021-06-24', 'A04', 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, '1', 3, 'TARDE'),
(55, '2021-06-24', 'X06', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 3, 'TARDE'),
(56, '2021-06-24', 'A05', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 3, 'TARDE'),
(57, '2021-06-24', 'X07', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 3, 'TARDE'),
(58, '2021-06-24', 'A06', 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, '1', 4, 'TARDE'),
(59, '2021-06-24', 'A02', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 4, 'TARDE'),
(60, '2021-06-24', 'A07', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 4, 'TARDE'),
(61, '2021-06-24', 'A08', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 4, 'TARDE'),
(62, '2021-06-24', 'A13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 4, 'TARDE'),
(63, '2021-06-24', 'A12', 0, 0, 0, 0, 0, 0, 396, 0, 0, 0, '1', 1, 'TARDE'),
(64, '2021-06-24', 'G01', 0, 0, 0, 0, 0, 0, 335, 0, 0, 0, '1', 1, 'TARDE'),
(65, '2021-06-24', 'A11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'TARDE'),
(66, '2021-06-24', 'A10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'TARDE'),
(67, '2021-06-24', 'G04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'TARDE'),
(68, '2021-06-24', 'G03', 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, '1', 2, 'TARDE'),
(69, '2021-06-24', 'A03', 0, 0, 0, 0, 6, 0, 0, 0, 0, 0, '1', 2, 'TARDE'),
(70, '2021-06-24', 'G02', 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, '1', 2, 'TARDE'),
(71, '2021-06-24', 'A09', 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, '1', 2, 'TARDE'),
(72, '2021-06-24', 'A01', 0, 0, 0, 0, 1000, 0, 0, 0, 0, 0, '1', 2, 'TARDE'),
(73, '2021-07-13', 'A12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'TARDE'),
(74, '2021-07-13', 'G01', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'TARDE'),
(75, '2021-07-13', 'A11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'TARDE'),
(76, '2021-07-13', 'A10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'TARDE'),
(77, '2021-07-13', 'G04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'TARDE'),
(78, '2021-07-13', 'G03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 2, 'TARDE'),
(79, '2021-07-13', 'A03', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 2, 'TARDE'),
(80, '2021-07-13', 'G02', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 2, 'TARDE'),
(81, '2021-07-13', 'A09', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 2, 'TARDE'),
(82, '2021-07-13', 'A01', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 2, 'TARDE'),
(83, '2021-07-21', 'A12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'TARDE'),
(84, '2021-07-21', 'G01', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'TARDE'),
(85, '2021-07-21', 'A11', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'TARDE'),
(86, '2021-07-21', 'A10', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'TARDE'),
(87, '2021-07-21', 'G04', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '1', 1, 'TARDE');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `produccion_t`
--
ALTER TABLE `produccion_t`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `produccion_t`
--
ALTER TABLE `produccion_t`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
