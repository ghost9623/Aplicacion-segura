-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-08-2020 a las 09:09:47
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `registro`
--
CREATE DATABASE IF NOT EXISTS `registro` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `registro`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `insertar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar` (IN `sp_usu` VARCHAR(50), IN `sp_contra` VARCHAR(50), `sp_nombre` VARCHAR(50), IN `sp_Papellido` VARCHAR(50), IN `sp_Aapellido` VARCHAR(50), IN `sp_ciudad` INT)  BEGIN

INSERT INTO `usuario`(`idusu`, `usu`, `contra`, `nombre`, `Papellido`, `Aapellido`, `ciudad`) VALUES (null,sp_usu,sp_contra,sp_nombre,sp_Papellido,sp_Aapellido,sp_ciudad);
END$$

DROP PROCEDURE IF EXISTS `insertar1`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar1` (IN `sp_usu` VARCHAR(50), IN `sp_contra` VARCHAR(50), `sp_nombre` VARCHAR(50), IN `sp_Papellido` VARCHAR(50), IN `sp_Aapellido` VARCHAR(50), IN `sp_ciudad` INT)  BEGIN

INSERT INTO `usuario`(`idusu`, `usu`, `contra`, `nombre`, `Papellido`, `Aapellido`, `ciudad`) VALUES (null,sp_usu,sha('sp_contra'),sp_nombre,sp_Papellido,sp_Aapellido,sp_ciudad);
END$$

DROP PROCEDURE IF EXISTS `selec`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `selec` (IN `sp_nombre` VARCHAR(50))  BEGIN
SELECT `usu`, `nombre`, `Papellido`, `Aapellido` FROM `usuario` WHERE nombre =sp_nombre;
END$$

DROP PROCEDURE IF EXISTS `sp_actualizar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar` (IN `id` INT, IN `sp_usu` VARCHAR(50), IN `sp_contra` VARCHAR(50))  BEGIN

UPDATE `usuario` SET `usu`=sp_usu,`contra`=sha('sp_contra') WHERE idusu=id;
END$$

DROP PROCEDURE IF EXISTS `sp_eliminar`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar` (IN `sp_nombre` VARCHAR(50))  BEGIN

DELETE FROM `usuario` WHERE nombre=sp_nombre;

END$$

DROP PROCEDURE IF EXISTS `sp_selecid`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_selecid` (IN `sp_nombre` VARCHAR(50))  BEGIN

SELECT `idusu` FROM `usuario` WHERE nombre=sp_nombre;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--
-- Creación: 05-08-2020 a las 02:20:27
--

DROP TABLE IF EXISTS `ciudad`;
CREATE TABLE `ciudad` (
  `idcuid` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `poblacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- RELACIONES PARA LA TABLA `ciudad`:
--

--
-- Volcado de datos para la tabla `ciudad`
--

INSERT INTO `ciudad` (`idcuid`, `nombre`, `poblacion`) VALUES
(1, 'chihuahua', 809232),
(2, 'Juarez', 1321000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--
-- Creación: 05-08-2020 a las 02:22:21
-- Última actualización: 08-08-2020 a las 07:05:06
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `idusu` int(11) NOT NULL,
  `usu` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `contra` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Papellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Aapellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- RELACIONES PARA LA TABLA `usuario`:
--   `ciudad`
--       `ciudad` -> `idcuid`
--

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusu`, `usu`, `contra`, `nombre`, `Papellido`, `Aapellido`, `ciudad`) VALUES
(1, 'le022', 'a41c0d815b69890744da797abb34bdaeafaad545', 'Juan', 'Perez', 'Ortiz', 1),
(2, 'mario22', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'Mario', 'Perez', 'Ortiz', 2),
(17, 'leo24', 'a41c0d815b69890744da797abb34bdaeafaad545', 'aldo', 'lopez', 'ortiz', 1),
(41, 'ana24', 'a41c0d815b69890744da797abb34bdaeafaad545', 'Ana Claudia', 'ortiz', 'lopez', 2),
(42, 'luis23', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', 'luis', 'alvarez', 'ramirez', 2),
(44, 'leo25', 'a41c0d815b69890744da797abb34bdaeafaad545', 'leonardo', 'ramirez', 'paes', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`idcuid`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusu`),
  ADD KEY `ciudad` (`ciudad`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `idcuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`idcuid`);


--
-- Metadatos
--
USE `phpmyadmin`;

--
-- Metadatos para la tabla ciudad
--

--
-- Metadatos para la tabla usuario
--

--
-- Metadatos para la base de datos registro
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
