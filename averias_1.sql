-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2021 a las 03:01:55
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
-- Estructura de tabla para la tabla `averias_1`
--

CREATE TABLE `averias_1` (
  `id` int(10) NOT NULL,
  `fecha` date NOT NULL DEFAULT current_timestamp(),
  `creation_date` varchar(20) NOT NULL,
  `num_machine` varchar(5) NOT NULL,
  `num_ope` int(10) NOT NULL,
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
  `description` text DEFAULT NULL,
  `step` varchar(20) NOT NULL,
  `page` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `averias_1`
--

INSERT INTO `averias_1` (`id`, `fecha`, `creation_date`, `num_machine`, `num_ope`, `turno`, `op_mantto`, `start_time`, `start_date`, `arrival_time`, `sub_time`, `canceled_time`, `opening_time`, `end_time`, `total_time`, `type_break`, `user_id`, `description`, `step`, `page`) VALUES
(1, '2021-06-13', '08-03-2021', 'A01', 55989, 'TARDE', 0, '21:33:33', 'Lunes, 8 deMarzo de 2021', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '', 4, NULL, '1', 'arrival'),
(2, '2021-06-13', '08-06-2021', 'A01', 55980, 'TARDE', 55970, '22:05:21', 'Martes, 8 deJunio de 2021', '00:00:00', '02:13:47', '00:19:08', '00:00:00', '00:00:00', '00:00:00', '', 4, NULL, '0', 'arrival'),
(4, '2021-06-13', '08-06-2021', 'A01', 55980, 'TARDE', 55970, '22:07:35', 'Martes, 8 deJunio de 2021', '23:24:56', '01:17:21', '00:00:00', '23:29:56', '23:35:24', '00:05:28', '2', 4, 'fgjfgn', '0', 'new'),
(5, '2021-06-13', '08-06-2021', 'A01', 55980, 'TARDE', 0, '22:08:45', 'Martes, 8 deJunio de 2021', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '', 4, NULL, '0', 'arrival'),
(6, '2021-06-13', '09-06-2021', 'A01', 55980, 'NOCHE', 55970, '00:22:49', 'Miércoles, 9 deJunio de 2021', '00:00:00', '00:00:05', '00:22:54', '00:00:00', '00:00:00', '00:00:00', '', 6, NULL, '0', 'arrival'),
(7, '2021-06-13', '09-06-2021', 'A01', 55980, 'NOCHE', 55970, '00:27:39', 'Miércoles, 9 deJunio de 2021', '00:00:00', '00:00:09', '12:27:48', '00:00:00', '00:00:00', '00:00:00', '', 6, NULL, '0', 'arrival'),
(8, '2021-06-13', '09-06-2021', 'A01', 55980, 'NOCHE', 55970, '00:33:14', 'Miércoles, 9 deJunio de 2021', '00:00:00', '00:12:49', '00:46:03', '00:00:00', '00:00:00', '00:00:00', '', 6, NULL, '0', 'arrival'),
(9, '2021-06-13', '2021-06-13', 'A01', 55980, 'NOCHE', 55970, '00:52:48', 'Miércoles, 9 deJunio de 2021', '00:00:00', '00:03:09', '12:55:57', '00:00:00', '00:00:00', '00:00:00', '', 6, NULL, '0', 'arrival'),
(10, '2021-07-21', '21-07-2021', 'A01', 55980, 'TARDE', 55970, '19:23:31', 'Miércoles, 21 deJulio de 2021', '19:24:10', '00:00:39', '00:00:00', '19:29:10', '19:30:21', '00:01:11', '4', 6, '', '0', 'new'),
(11, '2021-07-21', '21-07-2021', 'A01', 55980, 'TARDE', 55970, '19:33:53', 'Miércoles, 21 deJulio de 2021', '00:00:00', '00:01:07', '19:35:00', '00:00:00', '00:00:00', '00:00:00', '', 6, NULL, '0', 'arrival'),
(12, '2021-07-21', '21-07-2021', 'A01', 55980, 'TARDE', 55970, '19:35:10', 'Miércoles, 21 deJulio de 2021', '00:00:00', '00:00:08', '19:35:18', '00:00:00', '00:00:00', '00:00:00', '', 6, NULL, '0', 'arrival'),
(13, '2021-07-21', '21-07-2021', 'A01', 55980, 'TARDE', 55970, '19:35:29', 'Miércoles, 21 deJulio de 2021', '00:00:00', '00:00:05', '19:35:34', '00:00:00', '00:00:00', '00:00:00', '', 6, NULL, '0', 'arrival'),
(14, '2021-07-21', '21-07-2021', 'A01', 55980, 'TARDE', 55970, '19:36:21', 'Miércoles, 21 deJulio de 2021', '19:37:26', '00:01:05', '00:00:00', '19:42:26', '19:42:42', '00:00:16', '1', 6, 'hey ehy ', '0', 'new'),
(15, '2021-07-21', '21-07-2021', 'A01', 55980, 'TARDE', 55970, '19:42:54', 'Miércoles, 21 deJulio de 2021', '19:42:59', '00:00:05', '19:43:41', '00:00:00', '00:00:00', '00:00:00', '4', 6, NULL, '0', 'arrival_2'),
(16, '2021-07-21', '21-07-2021', 'A01', 55980, 'TARDE', 55970, '19:44:00', 'Miércoles, 21 deJulio de 2021', '00:00:00', '00:02:41', '19:46:41', '00:00:00', '00:00:00', '00:00:00', '', 6, NULL, '0', 'arrival');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `averias_1`
--
ALTER TABLE `averias_1`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `averias_1`
--
ALTER TABLE `averias_1`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
