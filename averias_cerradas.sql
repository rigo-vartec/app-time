-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2021 a las 03:02:17
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
-- Estructura de tabla para la tabla `averias_cerradas`
--

CREATE TABLE `averias_cerradas` (
  `id` int(10) NOT NULL,
  `creation_date` varchar(20) NOT NULL,
  `num_machine` varchar(5) NOT NULL,
  `num_ope` int(10) DEFAULT NULL,
  `turno` varchar(16) NOT NULL,
  `op_mantto` int(10) NOT NULL,
  `start_time` time NOT NULL,
  `start_date` varchar(50) NOT NULL,
  `arrival_time` time NOT NULL,
  `sub_time` time NOT NULL,
  `canceled_time` time NOT NULL,
  `opening_time` time NOT NULL,
  `end_time` time NOT NULL,
  `total_time` time NOT NULL,
  `type_break` varchar(80) NOT NULL,
  `user_id` int(10) NOT NULL,
  `mantto_id` int(10) NOT NULL,
  `description` text DEFAULT NULL,
  `estatus_corte` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `averias_cerradas`
--

INSERT INTO `averias_cerradas` (`id`, `creation_date`, `num_machine`, `num_ope`, `turno`, `op_mantto`, `start_time`, `start_date`, `arrival_time`, `sub_time`, `canceled_time`, `opening_time`, `end_time`, `total_time`, `type_break`, `user_id`, `mantto_id`, `description`, `estatus_corte`) VALUES
(1, '08-06-2021', 'A01', 55980, 'TARDE', 55970, '22:07:35', 'Martes, 8 deJunio de 2021', '23:24:56', '01:17:21', '00:00:00', '23:29:56', '23:35:24', '00:05:28', '2', 4, 0, 'fgjfgn', ''),
(2, '21-07-2021', 'A01', 55980, 'TARDE', 55970, '19:23:31', 'Miércoles, 21 deJulio de 2021', '19:24:10', '00:00:39', '00:00:00', '19:29:10', '19:30:21', '00:01:11', '4', 6, 0, '', ''),
(3, '21-07-2021', 'A01', 55980, 'TARDE', 55970, '19:36:21', 'Miércoles, 21 deJulio de 2021', '19:37:26', '00:01:05', '00:00:00', '19:42:26', '19:42:42', '00:00:16', '1', 6, 0, 'hey ehy ', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `averias_cerradas`
--
ALTER TABLE `averias_cerradas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `averias_cerradas`
--
ALTER TABLE `averias_cerradas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
