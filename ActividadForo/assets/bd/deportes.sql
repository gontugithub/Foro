-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-01-2024 a las 12:45:39
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `deportes`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportes_All` ()  SELECT *
FROM deportes
ORDER BY dte_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportes_BORRAR` (IN `id` INT)  DELETE FROM deportes WHERE dte_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportes_Buscar_ID` (IN `codigo` INT)  SELECT * FROM deportes WHERE dte_id = codigo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportes_Deportistas_Buscar_IDdta` (IN `idDta` INT)  SELECT *
FROM deportistas_deportes
WHERE dd_dta_id = idDta$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportes_Deportistas_Buscar_IDdte` (IN `idDte` INT)  SELECT *
FROM deportistas_deportes
WHERE dd_dte_id = idDte$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportes_Deportistas_INSERT` (IN `idDta` INT, IN `idDte` INT)  INSERT INTO deportistas_deportes VALUES(
    idDta,
    idDte)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportes_FILTRAR` (IN `filtro` VARCHAR(20))  SELECT *
FROM deportes
WHERE dte_nombre LIKE filtro$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportes_INSERTAR` (IN `nombre` VARCHAR(50))  INSERT INTO deportes VALUES (
    null,
    nombre)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportes_MODIFICAR` (IN `id` INT, IN `nombre` VARCHAR(50))  UPDATE deportes SET
	dte_nombre = nombre
WHERE dte_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportistas_All` ()  SELECT * 
FROM deportistas
ORDER BY dta_nombre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportistas_BORRAR` (IN `id` INT)  DELETE FROM deportistas WHERE dta_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportistas_Buscar_ID` (IN `codigo` INT)  SELECT * FROM deportistas WHERE dta_id = codigo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportistas_Deportes_All` ()  SELECT *
FROM deportistas_deportes
ORDER BY dd_dta_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportistas_FILTRAR` (IN `filtro` VARCHAR(20))  SELECT *
FROM deportistas
WHERE dta_nombre LIKE filtro$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportistas_INSERTAR` (IN `nombre` VARCHAR(50), IN `fnac` VARCHAR(10))  INSERT INTO deportistas VALUES(
    null,
    nombre,
    fnac)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Deportistas_MODIFICAR` (IN `id` INT, IN `nombre` VARCHAR(50), IN `fnac` VARCHAR(10))  UPDATE deportistas SET
	dta_nombre = nombre,
    dta_fnac = fnac
WHERE dta_id = id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportes`
--

CREATE TABLE `deportes` (
  `dte_id` int(11) NOT NULL,
  `dte_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `deportes`
--

INSERT INTO `deportes` (`dte_id`, `dte_nombre`) VALUES
(3, 'Bádminton'),
(2, 'Baloncesto'),
(9, 'Balonmano0'),
(7, 'Equitación'),
(1, 'Fútbol'),
(5, 'Golf'),
(6, 'Natación'),
(4, 'Pádel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportistas`
--

CREATE TABLE `deportistas` (
  `dta_id` int(11) NOT NULL,
  `dta_nombre` varchar(50) NOT NULL,
  `dta_fnac` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `deportistas`
--

INSERT INTO `deportistas` (`dta_id`, `dta_nombre`, `dta_fnac`) VALUES
(1, 'Osborne Whaplington', '2007-02-28'),
(2, 'Urbanus Philippson', '2020-01-24'),
(3, 'Dore Lundie', '1997-05-26'),
(4, 'Candace Carp', '1999-09-26'),
(5, 'Sherline Nixon', '2017-04-04'),
(6, 'Wilhelmina Brandom', '2020-04-27'),
(7, 'Archaimbaud Veschambre', '2017-09-13'),
(8, 'Alli Waite', '2001-06-19'),
(9, 'Twyla A\'field', '2000-09-21'),
(10, 'Binny Arber', '2002-03-17'),
(11, 'Jacki Bilfoot', '1997-03-23'),
(12, 'Dex Klimochkin', '2017-04-19'),
(13, 'Valaree Garman', '2015-05-20'),
(15, 'Town Sawkins', '2012-03-25'),
(16, 'Shauna Parramore', '2004-04-06'),
(17, 'Maritsa Di Napoli', '1993-12-26'),
(19, 'Sebastien Hatterslay', '2007-06-26'),
(24, 'Fey Kermath', '1991-11-12'),
(28, 'Chandler Simcox', '2015-02-10'),
(29, 'Dehlia Winsborrow', '2022-10-16'),
(32, 'Corey Mattingley', '1982-10-25'),
(33, 'Freida McCallam', '2016-05-29'),
(35, 'Leontyne Hans', '1999-03-21'),
(42, 'Clyde Haberjam', '2012-03-09'),
(44, 'Madelina Smurfit', '1984-05-13'),
(45, 'Poppy Romain', '1981-11-26'),
(46, 'Alexandro Belsher', '2017-03-06'),
(51, 'Lucía Sánchez Rosado', '1998-05-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportistas_deportes`
--

CREATE TABLE `deportistas_deportes` (
  `dd_dte_id` int(11) NOT NULL,
  `dd_dta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `deportistas_deportes`
--

INSERT INTO `deportistas_deportes` (`dd_dte_id`, `dd_dta_id`) VALUES
(1, 1),
(1, 9),
(1, 24),
(1, 29),
(1, 33),
(1, 35),
(1, 46),
(1, 51),
(2, 1),
(2, 3),
(2, 4),
(2, 5),
(2, 7),
(2, 10),
(2, 15),
(2, 17),
(2, 51),
(3, 2),
(3, 4),
(3, 8),
(3, 11),
(3, 12),
(3, 16),
(3, 19),
(3, 32),
(3, 45),
(3, 46),
(3, 51),
(4, 2),
(4, 3),
(4, 6),
(4, 10),
(4, 29),
(4, 44),
(4, 51),
(5, 6),
(5, 7),
(5, 28),
(5, 32),
(5, 44),
(5, 51),
(6, 1),
(6, 2),
(6, 3),
(6, 6),
(6, 10),
(6, 19),
(6, 42),
(6, 51),
(7, 4),
(7, 13),
(7, 19),
(7, 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usu_id` int(11) NOT NULL,
  `usu_alias` varchar(50) NOT NULL,
  `usu_password` varchar(50) NOT NULL,
  `usu_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usu_id`, `usu_alias`, `usu_password`, `usu_admin`) VALUES
(1, 'Administrador', '91f5167c34c400758115c2a6826ec2e3', 1),
(2, 'Usuario', 'f8032d5cae3de20fcec887f395ec9a6a', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `deportes`
--
ALTER TABLE `deportes`
  ADD PRIMARY KEY (`dte_id`),
  ADD UNIQUE KEY `dte_nombre` (`dte_nombre`);

--
-- Indices de la tabla `deportistas`
--
ALTER TABLE `deportistas`
  ADD PRIMARY KEY (`dta_id`),
  ADD UNIQUE KEY `dta_nombre` (`dta_nombre`);

--
-- Indices de la tabla `deportistas_deportes`
--
ALTER TABLE `deportistas_deportes`
  ADD PRIMARY KEY (`dd_dte_id`,`dd_dta_id`),
  ADD KEY `r-deportista` (`dd_dta_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `deportes`
--
ALTER TABLE `deportes`
  MODIFY `dte_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `deportistas`
--
ALTER TABLE `deportistas`
  MODIFY `dta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deportistas_deportes`
--
ALTER TABLE `deportistas_deportes`
  ADD CONSTRAINT `r-deporte` FOREIGN KEY (`dd_dte_id`) REFERENCES `deportes` (`dte_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `r-deportista` FOREIGN KEY (`dd_dta_id`) REFERENCES `deportistas` (`dta_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
