-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2021 a las 03:02:31
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
-- Estructura de tabla para la tabla `produccion`
--

CREATE TABLE `produccion` (
  `id` int(10) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `num_machine` varchar(5) NOT NULL,
  `turno` varchar(55) NOT NULL,
  `hora_1` int(5) NOT NULL,
  `hora_2` int(5) NOT NULL,
  `hora_3` int(5) NOT NULL,
  `hora_4` int(5) NOT NULL,
  `hora_5` int(5) NOT NULL,
  `hora_6` int(5) NOT NULL,
  `hora_7` int(5) NOT NULL,
  `hora_8` int(5) NOT NULL,
  `hora_9` int(5) NOT NULL,
  `step` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `produccion`
--

INSERT INTO `produccion` (`id`, `fecha`, `num_machine`, `turno`, `hora_1`, `hora_2`, `hora_3`, `hora_4`, `hora_5`, `hora_6`, `hora_7`, `hora_8`, `hora_9`, `step`) VALUES
(1, '2021-06-13', 'A01', 'NOCHE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, '2021-06-13', 'A01', 'NOCHE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, '2021-06-13', 'A01', 'NOCHE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, '2021-06-13', 'A01', 'NOCHE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, '2021-06-13', 'A01', 'NOCHE', 2000, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, '2021-06-13', 'A01', 'NOCHE', 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, '2021-06-13', 'A01', 'NOCHE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
(8, '2021-06-13', 'A12', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `produccion`
--
ALTER TABLE `produccion`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `produccion`
--
ALTER TABLE `produccion`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
