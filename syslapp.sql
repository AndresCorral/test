-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-01-2019 a las 19:35:17
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `syslapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `Nit` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Nombre` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Imagen` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla de la información de las empresas';

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`Nit`, `Nombre`, `Telefono`, `Direccion`, `Email`, `Imagen`) VALUES
('1987777652-1', 'Posotobon', '3112343212', 'calle 22 # 7-20', 'paca1063@hotmail.com', '/Security/Empresas/Active/Postobon/Postobon.png'),
('2514561622-17', 'CocaCola', '3104785623', 'Cll 81 B sur Granada', 'cocacola@empresas.com.co', '/Security/Empresas/Active/CocaCola/CocaCola.png'),
('38262653265-32', 'Bavaria', '3135869841', 'Cr 8 B: San Jose', 'bavariasas@gmail.com', '/Security/Empresas/Active/Bavaria/Bavaria.png'),
('5014171512-36', 'Tigo', '3059862563', 'Cll 32 B # 15 - 31 Alto ', 'tigo@gmail.com.co', '/Security/Empresas/Active/Tigo/Tigo.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `Cedula` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Nombres` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Apellidos` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `Telefono` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `Direccion` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `Email` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `Image` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `Usuario` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla de los Perfiles de Usuario';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `privilegios`
--

CREATE TABLE `privilegios` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla de la información de los roles del sistema';

--
-- Volcado de datos para la tabla `privilegios`
--

INSERT INTO `privilegios` (`Id`, `Nombre`) VALUES
(1, 'Cliente Final'),
(2, 'Operario de Campo'),
(3, 'Programador'),
(4, 'Auxiliar de Laboratorio'),
(5, 'Coordinador'),
(6, 'Bacteriologo'),
(7, 'Quimico'),
(8, 'Director'),
(9, 'Administrador'),
(10, 'SuperAdmin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Usuario` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `Password` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `IdPrivilegio` int(11) NOT NULL,
  `Estado` enum('ACTIVO','INACTIVO','','') COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla de la información de los usuarios del sistema';

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Usuario`, `Password`, `IdPrivilegio`, `Estado`) VALUES
('JhonPaul', '12345qwert', 10, 'ACTIVO'),
('Lucho94', 'Lucho94', 10, 'ACTIVO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`Nit`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`Cedula`),
  ADD KEY `Usuario` (`Usuario`);

--
-- Indices de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Usuario`),
  ADD KEY `IdPrivilegio` (`IdPrivilegio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `privilegios`
--
ALTER TABLE `privilegios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD CONSTRAINT `perfiles_ibfk_1` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`Usuario`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`IdPrivilegio`) REFERENCES `privilegios` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
