-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-07-2021 a las 03:02:08
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
-- Estructura de tabla para la tabla `averias_canceladas`
--

CREATE TABLE `averias_canceladas` (
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
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `averias_canceladas`
--

INSERT INTO `averias_canceladas` (`id`, `creation_date`, `num_machine`, `num_ope`, `turno`, `op_mantto`, `start_time`, `start_date`, `arrival_time`, `sub_time`, `canceled_time`, `opening_time`, `end_time`, `total_time`, `type_break`, `user_id`) VALUES
(0, '21-07-2021', 'A01', 55980, 'TARDE', 55970, '19:42:54', 'Miércoles, 21 deJulio de 2021', '19:42:59', '00:00:05', '19:43:41', '00:00:00', '00:00:00', '00:00:42', '4', 6);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
