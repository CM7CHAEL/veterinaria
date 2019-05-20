-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 04-12-2017 a las 13:22:47
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `veterinaria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `car_cargos`
--

CREATE TABLE IF NOT EXISTS `car_cargos` (
  `car_id` int(11) NOT NULL,
  `car_nombre` varchar(45) NOT NULL COMMENT 'Nombre del cargo',
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cargos de los empleados';

--
-- Volcado de datos para la tabla `car_cargos`
--

INSERT INTO `car_cargos` (`car_id`, `car_nombre`) VALUES
(1, 'Admin'),
(2, 'Secretaria'),
(3, 'Doctor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cit_cita`
--

CREATE TABLE IF NOT EXISTS `cit_cita` (
  `cit_id` int(11) NOT NULL AUTO_INCREMENT,
  `cit_fecha` date NOT NULL COMMENT 'Fecha de la cita de la mascota',
  `cit_hora` time DEFAULT NULL COMMENT 'Hora de la cita',
  `cit_programacion` varchar(75) NOT NULL COMMENT 'Proceso programado para la cita',
  `estado` varchar(75) DEFAULT NULL COMMENT 'Observaciones para la cita',
  `doc_cit_id` int(11) NOT NULL,
  `infm_cit_id` int(11) NOT NULL,
  PRIMARY KEY (`cit_id`,`doc_cit_id`,`infm_cit_id`),
  KEY `fk_cit_cita_doc_doctores1_idx` (`doc_cit_id`),
  KEY `fk_cit_cita_infm_informacion_mascotas1_idx` (`infm_cit_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Citas de recibimiento mascotas' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cit_cita`
--

INSERT INTO `cit_cita` (`cit_id`, `cit_fecha`, `cit_hora`, `cit_programacion`, `estado`, `doc_cit_id`, `infm_cit_id`) VALUES
(1, '2013-11-28', NULL, 'Consulta general', 'Pendiente', 1, 1),
(2, '2013-01-28', NULL, 'Consulta general', 'Finalizada', 1, 1),
(3, '2013-12-28', NULL, 'Consulta general', 'Programada', 1, 1),
(4, '2012-12-28', NULL, 'Consulta general', 'Perdida', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dep_departamento`
--

CREATE TABLE IF NOT EXISTS `dep_departamento` (
  `dep_id` int(11) NOT NULL COMMENT 'ID de departamento',
  `dep_nombre` varchar(15) NOT NULL COMMENT 'Nombre del departamento',
  PRIMARY KEY (`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Departamentos del pais';

--
-- Volcado de datos para la tabla `dep_departamento`
--

INSERT INTO `dep_departamento` (`dep_id`, `dep_nombre`) VALUES
(1, 'San Salvador'),
(2, 'San Miguel'),
(3, 'San Vicente'),
(4, 'Santa Ana'),
(5, 'Sonsonate'),
(6, 'La Libertad'),
(7, 'La Paz'),
(8, 'La Union'),
(9, 'Cuscatlan'),
(10, 'Chalatenango'),
(11, 'Cabañas'),
(12, 'Usulutan'),
(13, 'Morazan'),
(14, 'Ahuachapan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `emp_empleados`
--

CREATE TABLE IF NOT EXISTS `emp_empleados` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de empleado',
  `emp_nombre1` varchar(20) NOT NULL COMMENT '1er nombre del empleado',
  `emp_apellido1` varchar(20) NOT NULL COMMENT '1er apellido del empleado',
  `emp_direccion` varchar(45) NOT NULL COMMENT 'Direccion particular del empleado',
  `emp_telcelular` char(9) DEFAULT NULL COMMENT 'Telefono celular del empleado',
  `emp_email` varchar(45) DEFAULT NULL COMMENT 'Correo electronico del empleado',
  `dep_emp_id` int(11) NOT NULL,
  `gen_genero_gen_id` int(11) NOT NULL,
  `esp_emp_id` int(11) NOT NULL,
  `car_emp_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`,`dep_emp_id`,`gen_genero_gen_id`,`esp_emp_id`,`car_emp_id`),
  KEY `fk_emp_empleados_dep_departamento1_idx` (`dep_emp_id`),
  KEY `fk_emp_empleados_gen_genero1_idx` (`gen_genero_gen_id`),
  KEY `fk_emp_empleados_esp_especializaciones1_idx` (`esp_emp_id`),
  KEY `fk_emp_empleados_car_cargos1_idx` (`car_emp_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos de los empleados de la veterinaria' AUTO_INCREMENT=19 ;

--
-- Volcado de datos para la tabla `emp_empleados`
--

INSERT INTO `emp_empleados` (`emp_id`, `emp_nombre1`, `emp_apellido1`, `emp_direccion`, `emp_telcelular`, `emp_email`, `dep_emp_id`, `gen_genero_gen_id`, `esp_emp_id`, `car_emp_id`) VALUES
(1, 'Hector', 'Mendez', 'San Martin, San Salvador', NULL, NULL, 1, 1, 1, 1),
(2, 'Jose', 'Martinez', 'Soyapando, San Salvador', NULL, NULL, 1, 1, 1, 2),
(3, 'Maria', 'Iraeta', 'Santa Tecla, San Salvador', NULL, NULL, 1, 2, 1, 3),
(4, 'Miguel', 'Iraeta', 'Santa Tecla, San Salvador', NULL, NULL, 1, 1, 1, 3),
(9, 'asdasd', 'asdasd', 'asdasd', '123123', 'asdas', 14, 2, 4, 3),
(10, 'asdasd', 'asdasd', 'asdasd', '123123', 'asdas', 14, 2, 4, 3),
(11, 'asdasd', 'asdasd', 'asdasd', '123123', 'asdas', 14, 2, 4, 3),
(13, 'sadasd', 'asdasd', 'asdasd', '3333', 'fafds', 14, 1, 4, 3),
(14, 'sdfsdf', 'asda', 'sdfsdf', '386383', '277', 14, 1, 4, 3),
(15, 'sdfsd', 'sdfsd', 'sdfsd', '27527', '72752', 14, 2, 4, 3),
(16, 'sdfsd', 'sdfsd', 'sdfsd', '27527', '72752', 14, 2, 4, 3),
(17, 'sdfsd', 'sdfsd', 'sdfsd', '27527', '72752', 14, 2, 4, 3),
(18, 'asdada', 'fsdf', 'asdasd', '234234', 'dfsdfs', 14, 1, 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `esm_estado_mascotas`
--

CREATE TABLE IF NOT EXISTS `esm_estado_mascotas` (
  `esm_id` int(11) NOT NULL COMMENT 'ID del estado de mascota',
  `esm_estado` varchar(20) NOT NULL COMMENT 'Estado de la mascota',
  PRIMARY KEY (`esm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Estado de las mascotas';

--
-- Volcado de datos para la tabla `esm_estado_mascotas`
--

INSERT INTO `esm_estado_mascotas` (`esm_id`, `esm_estado`) VALUES
(1, 'Enfermo'),
(2, 'Sano'),
(3, 'Fallecido'),
(4, 'Extraviado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `esp_especializaciones`
--

CREATE TABLE IF NOT EXISTS `esp_especializaciones` (
  `esp_id` int(11) NOT NULL,
  `esp_nombre` varchar(50) NOT NULL,
  `esp_descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripcion de la especialización',
  PRIMARY KEY (`esp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Especializaciones de un medico';

--
-- Volcado de datos para la tabla `esp_especializaciones`
--

INSERT INTO `esp_especializaciones` (`esp_id`, `esp_nombre`, `esp_descripcion`) VALUES
(1, 'Veterinaria general', 'Este se encarga de examinar la mayoria de especies.'),
(2, 'Veterinaria para especies grandes', 'Este se encarga de examinar animales de un tamaño grande por lo general no domestico.'),
(3, 'Veterinaria para especies pequeñas', 'Este se encarga de examinar animales de un tamaño pequeño por lo general domestico.'),
(4, 'Veterinaria para especies silvestres', 'Este se encarga de examinar animales no domestico por lo general exoticos.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fam_familia`
--

CREATE TABLE IF NOT EXISTS `fam_familia` (
  `fam_id` int(11) NOT NULL,
  `fam_nombre` varchar(25) NOT NULL COMMENT 'Nombre de la familia',
  `mas_fam_id` int(11) NOT NULL,
  PRIMARY KEY (`fam_id`,`mas_fam_id`),
  KEY `fk_fam_familia_mas_mascotas1_idx` (`mas_fam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tipo de familia de las mascotas';

--
-- Volcado de datos para la tabla `fam_familia`
--

INSERT INTO `fam_familia` (`fam_id`, `fam_nombre`, `mas_fam_id`) VALUES
(1, 'Lagartos', 3),
(2, 'Serpientes', 3),
(3, 'Tortugas', 3),
(4, 'Perros', 1),
(5, 'Gatos', 1),
(6, 'Ardillas', 1),
(7, 'Loros', 2),
(8, 'Pericos', 2),
(9, 'Patos', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gen_genero`
--

CREATE TABLE IF NOT EXISTS `gen_genero` (
  `gen_id` int(11) NOT NULL COMMENT 'ID de genero',
  `gen_nombre` char(1) NOT NULL COMMENT 'Nombre de genero',
  PRIMARY KEY (`gen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Definición de generos';

--
-- Volcado de datos para la tabla `gen_genero`
--

INSERT INTO `gen_genero` (`gen_id`, `gen_nombre`) VALUES
(1, 'M'),
(2, 'F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `infm_informacion_mascotas`
--

CREATE TABLE IF NOT EXISTS `infm_informacion_mascotas` (
  `infm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID de la mascota',
  `infm_nombre` varchar(15) NOT NULL COMMENT 'Nombre de la mascota',
  `infm_apellido1` varchar(15) DEFAULT NULL COMMENT '1er apellido de la mascota',
  `infm_apellido2` varchar(15) DEFAULT NULL COMMENT '2o apellido de la mascota',
  `infm_foto` varchar(45) DEFAULT NULL COMMENT 'Foto de la mascota',
  `infm_nacimiento` date DEFAULT NULL COMMENT 'Fecha de nacimiento de la mascota',
  `infm_descripcion` varchar(100) DEFAULT NULL COMMENT 'Descripcion de la mascota',
  `id_propietario` int(11) NOT NULL,
  `mas_infm_id` int(11) NOT NULL,
  `gen_infm_id` int(11) NOT NULL,
  `esm_infm_id` int(11) NOT NULL,
  `tps_infm_id` int(11) NOT NULL,
  `infm_fingreso` date NOT NULL COMMENT 'Fecha de ingreso de la mascota',
  `infm_fsalida` date DEFAULT NULL COMMENT 'Fecha de salida de la mascota',
  `fam_infm_id` int(11) NOT NULL,
  PRIMARY KEY (`infm_id`,`mas_infm_id`,`gen_infm_id`,`esm_infm_id`,`tps_infm_id`,`fam_infm_id`,`id_propietario`),
  KEY `fk_infm_informacion_mascotas_mas_mascotas1_idx` (`mas_infm_id`),
  KEY `fk_infm_informacion_mascotas_gen_genero1_idx` (`gen_infm_id`),
  KEY `fk_infm_informacion_mascotas_esm_estado_mascotas1_idx` (`esm_infm_id`),
  KEY `fk_infm_informacion_mascotas_tps_tipo_salida1_idx` (`tps_infm_id`),
  KEY `fk_infm_informacion_mascotas_fam_familia1_idx` (`fam_infm_id`),
  KEY `fk_infm_informacion_mascotas_id_propietario_idx` (`id_propietario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Datos de las mascotas' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `infm_informacion_mascotas`
--

INSERT INTO `infm_informacion_mascotas` (`infm_id`, `infm_nombre`, `infm_apellido1`, `infm_apellido2`, `infm_foto`, `infm_nacimiento`, `infm_descripcion`, `id_propietario`, `mas_infm_id`, `gen_infm_id`, `esm_infm_id`, `tps_infm_id`, `infm_fingreso`, `infm_fsalida`, `fam_infm_id`) VALUES
(1, 'perski', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, '2013-11-25', NULL, 1),
(2, 'doski', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, '2013-11-25', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mas_mascotas`
--

CREATE TABLE IF NOT EXISTS `mas_mascotas` (
  `mas_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del tipo de mascotas',
  `mas_tipo` varchar(20) NOT NULL COMMENT 'Tipo de mascotas posibles',
  PRIMARY KEY (`mas_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Tipo de mascotas registradas' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `mas_mascotas`
--

INSERT INTO `mas_mascotas` (`mas_id`, `mas_tipo`) VALUES
(1, 'Mamiferos'),
(2, 'Aves'),
(3, 'Reptiles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mun_municipio`
--

CREATE TABLE IF NOT EXISTS `mun_municipio` (
  `mun_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del municipio',
  `mun_nombre` varchar(50) NOT NULL,
  `dep_mun_id` int(11) NOT NULL,
  PRIMARY KEY (`mun_id`,`dep_mun_id`),
  KEY `fk_mun_municipio_dep_departamento_idx` (`dep_mun_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Municipio del pais' AUTO_INCREMENT=262 ;

--
-- Volcado de datos para la tabla `mun_municipio`
--

INSERT INTO `mun_municipio` (`mun_id`, `mun_nombre`, `dep_mun_id`) VALUES
(1, 'Apaneca', 14),
(2, 'Atiquizaya', 14),
(3, 'Concepción de Ataco', 14),
(4, 'El Refugio', 14),
(5, 'Guaymango', 14),
(6, 'Jujutla', 14),
(7, 'San Francisco Menéndez', 14),
(8, 'San Lorenzo', 14),
(9, 'San Pedro Puxtla', 14),
(10, 'Tacuba', 14),
(11, 'Turín', 14),
(12, 'Cinquera', 11),
(13, 'Villa Dolores', 11),
(14, 'Guacotecti ', 11),
(15, 'Ilobasco', 11),
(16, 'Jutiapa', 11),
(17, 'San Isidro', 11),
(18, 'Sensuntepeque', 11),
(19, 'Tejutepeque', 11),
(20, 'Victoria', 11),
(21, 'Agua Caliente', 10),
(22, 'Arcatao', 10),
(23, 'Azacualpa', 10),
(24, 'Chalatenango', 10),
(25, 'Citalá', 10),
(26, 'Comalapa', 10),
(27, 'Concepción Quezaltepeque', 10),
(28, 'Dulce Nombre de María', 10),
(29, 'El Carrizal', 10),
(30, 'El Paraíso', 10),
(31, 'La Laguna', 10),
(32, 'La Palma', 10),
(33, 'La Reina', 10),
(34, 'Las Vueltas', 10),
(35, 'Nombre de Jesús', 10),
(36, 'Nueva Concepción', 10),
(37, 'Nueva Trinidad', 10),
(38, 'Ojos de Agua', 10),
(39, 'Potonico', 10),
(40, 'San Antonio de la Cruz', 10),
(41, 'San Antonio Los Ranchos', 10),
(42, 'San Fernando', 10),
(43, 'San Francisco Lempa', 10),
(44, 'San Francisco Morazán', 10),
(45, 'San Ignacio', 10),
(46, 'San Isidro Labrador', 10),
(47, 'San José Cancasque', 10),
(48, 'San José Las Flores', 10),
(49, 'San Luis del Carmen', 10),
(50, 'San Miguel de Mercedes', 10),
(51, 'San Rafael', 10),
(52, 'Santa Rita', 10),
(53, 'Tejutla', 10),
(54, 'Candelaria', 9),
(55, 'Cojutepeque', 9),
(56, 'El Carmen', 9),
(57, 'El Rosario', 9),
(58, 'Monte San Juan', 9),
(59, 'Oratorio de Concepción', 9),
(60, 'San Bartolomé Perulapía', 9),
(61, 'San Cristóbal', 9),
(62, 'San José Guayabal', 9),
(63, 'San Pedro Perulapán', 9),
(64, 'San Rafael Cedros', 9),
(65, 'San Ramón', 9),
(66, 'Santa Cruz Analquito', 9),
(67, 'Santa Cruz Michapa', 9),
(68, 'Suchitoto', 9),
(69, 'Tenancingo', 9),
(70, 'Arambala', 13),
(71, 'Cacaopera', 13),
(72, 'Chilanga', 13),
(73, 'Corinto', 13),
(74, 'Delicias de Concepción', 13),
(75, 'El Divisadero', 13),
(76, 'El Rosario', 13),
(77, 'Gualococti', 13),
(78, 'Guatajiagua', 13),
(79, 'Joateca', 13),
(80, 'Jocoaitique', 13),
(81, 'Jocoro', 13),
(82, 'Lolotiquillo', 13),
(83, 'Meanguera', 13),
(84, 'Osicala', 13),
(85, 'Perquín', 13),
(86, 'San Carlos', 13),
(87, 'San Fernando', 13),
(88, 'San Francisco Gotera', 13),
(89, 'San Isidro', 13),
(90, 'San Simón', 13),
(91, 'Sensembra', 13),
(92, 'Sociedad', 13),
(93, 'Torola', 13),
(94, 'Yamabal', 13),
(95, 'Yoloaiquín', 13),
(96, 'Antiguo Cuscatlán', 6),
(97, 'Chiltiupán', 6),
(98, 'Ciudad Arce', 6),
(99, 'Colón', 6),
(100, 'Comasagua', 6),
(101, 'Huizúcar', 6),
(102, 'Jayaque', 6),
(103, 'Jicalapa', 6),
(104, 'La Libertad', 6),
(105, 'Santa Tecla', 6),
(106, 'Nuevo Cuscatlán', 6),
(107, 'San Juan Opico', 6),
(108, 'Quezaltepeque', 6),
(109, 'Sacacoyo', 6),
(110, 'San José Villanueva', 6),
(111, 'San Matías', 6),
(112, 'San Pablo Tacachico', 6),
(113, 'Talnique', 6),
(114, 'Tamanique', 6),
(115, 'Teotepeque', 6),
(116, 'Tepecoyo', 6),
(117, 'Zaragoza', 6),
(118, 'Cuyultitán', 7),
(119, 'Rosario de La Paz', 7),
(120, 'Jerusalén', 7),
(121, 'Mercedes La Ceiba', 7),
(122, 'Olocuilta', 7),
(123, 'Paraíso de Osorio', 7),
(124, 'San Antonio Masahuat', 7),
(125, 'San Emigdio', 7),
(126, 'San Francisco Chinameca', 7),
(127, 'San Juan Nonualco', 7),
(128, 'San Juan Talpa', 7),
(129, 'San Juan Tepezontes', 7),
(130, 'San Luis La Herradura', 7),
(131, 'San Luis Talpa', 7),
(132, 'San Miguel Tepezontes', 7),
(133, 'San Pedro Masahuat', 7),
(134, 'San Pedro Nonualco', 7),
(135, 'San Rafael Obrajuelo', 7),
(136, 'Santa María Ostuma', 7),
(137, 'Santiago Nonualco', 7),
(138, 'Tapalhuaca', 7),
(139, 'Zacatecoluca', 7),
(140, 'Anamorós', 8),
(141, 'Bolívar', 8),
(142, 'Concepción de Oriente', 8),
(143, 'Conchagua', 8),
(144, 'El Carmen', 8),
(145, 'El Sauce', 8),
(146, 'Intipucá', 8),
(147, 'La Unión', 8),
(148, 'Lilisque', 8),
(149, 'Meanguera del Golfo', 8),
(150, 'Nueva Esparta', 8),
(151, 'Pasaquina', 8),
(152, 'Polorós', 8),
(153, 'San Alejo', 8),
(154, 'San José', 8),
(155, 'Santa Rosa de Lima', 8),
(156, 'Yayantique', 8),
(157, 'Yucuaiquín', 8),
(158, 'Carolina', 2),
(159, 'Chapeltique', 2),
(160, 'Chinameca', 2),
(161, 'Chirilagua', 2),
(162, 'Ciudad Barrios', 2),
(163, 'Comacarán', 2),
(164, 'El Tránsito', 2),
(165, 'Lolotique', 2),
(166, 'Moncagua', 2),
(167, 'Nueva Guadalupe', 2),
(168, 'Nuevo Edén de San Juan', 2),
(169, 'Quelepa', 2),
(170, 'San Antonio del Mosco', 2),
(171, 'San Gerardo', 2),
(172, 'San Jorge', 2),
(173, 'San Luis de la Reina', 2),
(174, 'San Miguel', 2),
(175, 'San Rafael Oriente', 2),
(176, 'Sesori', 2),
(177, 'Uluazapa', 2),
(178, 'Aguilares', 1),
(179, 'Apopa', 1),
(180, 'Ayutuxtepeque', 1),
(181, 'Delgado', 1),
(182, 'Cuscatancingo', 1),
(183, 'El Paisnal', 1),
(184, 'Guazapa', 1),
(185, 'Ilopango', 1),
(186, 'Mejicanos', 1),
(187, 'Nejapa', 1),
(188, 'Panchimalco', 1),
(189, 'Rosario de Mora', 1),
(190, 'San Marcos', 1),
(191, 'San Martín', 1),
(192, 'San Salvador', 1),
(193, 'Santiago Texacuangos', 1),
(194, 'Santo Tomás', 1),
(195, 'Soyapango', 1),
(196, 'Tonacatepeque', 1),
(197, 'Apastepeque', 3),
(198, 'Guadalupe', 3),
(199, 'San Cayetano Istepeque', 3),
(200, 'San Esteban Catarina', 3),
(201, 'San Ildefonso', 3),
(202, 'San Lorenzo', 3),
(203, 'San Sebastián', 3),
(204, 'San Vicente', 3),
(205, 'Santa Clara', 3),
(206, 'Santo Domingo', 3),
(207, 'Tecoluca', 3),
(208, 'Tepetitán', 3),
(209, 'Verapaz', 3),
(210, 'Candelaria de la Frontera', 4),
(211, 'Chalchuapa', 4),
(212, 'Coatepeque', 4),
(213, 'El Congo', 4),
(214, 'El Porvenir', 4),
(215, 'Masahuat', 4),
(216, 'Metapán', 4),
(217, 'San Antonio Pajonal', 4),
(218, 'San Sebastián Salitrillo', 4),
(219, 'Santa Ana', 4),
(220, 'Santa Rosa Guachipilín', 4),
(221, 'Santiago de la Frontera', 4),
(222, 'Texistepeque', 4),
(223, 'Acajutla', 5),
(224, 'Armenia', 5),
(225, 'Caluco', 5),
(226, 'Cuisnahuat', 5),
(227, 'Izalco', 5),
(228, 'Juayúa', 5),
(229, 'Nahuizalco', 5),
(230, 'Nahulingo', 5),
(231, 'Salcoatitán', 5),
(232, 'San Antonio del Monte', 5),
(233, 'San Julián', 5),
(234, 'Santa Catarina Masahuat', 5),
(235, 'Santa Isabel Ishuatán', 5),
(236, 'Santo Domingo de Guzmán', 5),
(237, 'Sonsonate', 5),
(238, 'Sonzacate', 5),
(239, 'Alegría', 12),
(240, 'Berlín', 12),
(241, 'California', 12),
(242, 'Concepción Batres', 12),
(243, 'El Triunfo', 12),
(244, 'Ereguayquín', 12),
(245, 'Estanzuelas', 12),
(246, 'Jiquilisco', 12),
(247, 'Jucuapa', 12),
(248, 'Jucuarán', 12),
(249, 'Mercedes Umaña', 12),
(250, 'Nueva Granada', 12),
(251, 'Ozatlán', 12),
(252, 'Puerto El Triunfo', 12),
(253, 'San Agustín', 12),
(254, 'San Buenaventura', 12),
(255, 'San Dionisio', 12),
(256, 'San Francisco Javier', 12),
(257, 'Santa Elena', 12),
(258, 'Santa María', 12),
(259, 'Santiago de María', 12),
(260, 'Tecapán', 12),
(261, 'Usulután', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prop_propietarios`
--

CREATE TABLE IF NOT EXISTS `prop_propietarios` (
  `prop_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID del propietario',
  `prop_nombre1` varchar(20) NOT NULL COMMENT '1er nombre del propietario',
  `prop_apellido1` varchar(20) NOT NULL COMMENT '1er apellido del propietario',
  `prop_fnacimiento` date DEFAULT NULL,
  `prop_direccion` varchar(45) NOT NULL COMMENT 'Direccion del propietario',
  `prop_telcasa` char(9) NOT NULL COMMENT 'Telefono de casa del propietario',
  `prop_telcel` char(9) DEFAULT NULL COMMENT 'Telefono celular del propietario',
  `prop_teltrabajo` char(9) DEFAULT NULL COMMENT 'Telefono de trabajo del propietario',
  `prop_email` varchar(45) DEFAULT NULL COMMENT 'Correo electronico del propietario',
  `prop_nit` char(20) NOT NULL COMMENT 'NIT del propietario',
  `prop_regfiscal` char(8) DEFAULT NULL COMMENT 'Registro fiscal del propietario',
  `gen_genero_gen_id` int(11) NOT NULL,
  PRIMARY KEY (`prop_id`,`gen_genero_gen_id`),
  KEY `fk_prop_propietarios_gen_genero1_idx` (`gen_genero_gen_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Propietarios de las mascotas' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `prop_propietarios`
--

INSERT INTO `prop_propietarios` (`prop_id`, `prop_nombre1`, `prop_apellido1`, `prop_fnacimiento`, `prop_direccion`, `prop_telcasa`, `prop_telcel`, `prop_teltrabajo`, `prop_email`, `prop_nit`, `prop_regfiscal`, `gen_genero_gen_id`) VALUES
(1, 'Jose', 'Burgo', '1987-10-14', 'Santa Tecla, San Salvador', '2342-4532', NULL, NULL, NULL, '123-21333213-1222', NULL, 1),
(2, 'asdasd', 'asasd', '1987-10-14', 'asdasdas', '51951', NULL, NULL, NULL, '91551', NULL, 1),
(3, 'asdsd', 'asdasd', '1987-10-14', 'asdasd', '33333', NULL, NULL, NULL, '333', NULL, 1),
(4, 'micasaas', 'asdasd', '1987-10-14', '151651', '51651', NULL, NULL, NULL, '6515', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tps_tipo_salida`
--

CREATE TABLE IF NOT EXISTS `tps_tipo_salida` (
  `tps_id` int(11) NOT NULL,
  `tps_descripcion` varchar(30) NOT NULL COMMENT 'Descripción del tipo de salida',
  PRIMARY KEY (`tps_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tipo de salida';

--
-- Volcado de datos para la tabla `tps_tipo_salida`
--

INSERT INTO `tps_tipo_salida` (`tps_id`, `tps_descripcion`) VALUES
(1, 'Tratamiento'),
(2, 'Alta'),
(3, 'Cuidado Intensivo'),
(4, 'Control');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `access` varchar(50) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`userid`, `username`, `password`, `access`) VALUES
(1, 'admin', 'admin', 'Admin');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cit_cita`
--
ALTER TABLE `cit_cita`
  ADD CONSTRAINT `fk_cit_cita_doc_doctores1` FOREIGN KEY (`doc_cit_id`) REFERENCES `emp_empleados` (`emp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cit_cita_infm_informacion_mascotas1` FOREIGN KEY (`infm_cit_id`) REFERENCES `infm_informacion_mascotas` (`infm_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `emp_empleados`
--
ALTER TABLE `emp_empleados`
  ADD CONSTRAINT `fk_emp_empleados_car_cargos1` FOREIGN KEY (`car_emp_id`) REFERENCES `car_cargos` (`car_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emp_empleados_dep_departamento1` FOREIGN KEY (`dep_emp_id`) REFERENCES `dep_departamento` (`dep_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emp_empleados_esp_especializaciones1` FOREIGN KEY (`esp_emp_id`) REFERENCES `esp_especializaciones` (`esp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emp_empleados_gen_genero1` FOREIGN KEY (`gen_genero_gen_id`) REFERENCES `gen_genero` (`gen_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fam_familia`
--
ALTER TABLE `fam_familia`
  ADD CONSTRAINT `fk_fam_familia_mas_mascotas1` FOREIGN KEY (`mas_fam_id`) REFERENCES `mas_mascotas` (`mas_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `infm_informacion_mascotas`
--
ALTER TABLE `infm_informacion_mascotas`
  ADD CONSTRAINT `fk_infm_informacion_mascotas_esm_estado_mascotas1` FOREIGN KEY (`esm_infm_id`) REFERENCES `esm_estado_mascotas` (`esm_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_infm_informacion_mascotas_fam_familia1` FOREIGN KEY (`fam_infm_id`) REFERENCES `fam_familia` (`fam_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_infm_informacion_mascotas_gen_genero1` FOREIGN KEY (`gen_infm_id`) REFERENCES `gen_genero` (`gen_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_infm_informacion_mascotas_id_propietario` FOREIGN KEY (`id_propietario`) REFERENCES `prop_propietarios` (`prop_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_infm_informacion_mascotas_mas_mascotas1` FOREIGN KEY (`mas_infm_id`) REFERENCES `mas_mascotas` (`mas_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_infm_informacion_mascotas_tps_tipo_salida1` FOREIGN KEY (`tps_infm_id`) REFERENCES `tps_tipo_salida` (`tps_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mun_municipio`
--
ALTER TABLE `mun_municipio`
  ADD CONSTRAINT `fk_mun_municipio_dep_departamento` FOREIGN KEY (`dep_mun_id`) REFERENCES `dep_departamento` (`dep_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prop_propietarios`
--
ALTER TABLE `prop_propietarios`
  ADD CONSTRAINT `fk_prop_propietarios_gen_genero1` FOREIGN KEY (`gen_genero_gen_id`) REFERENCES `gen_genero` (`gen_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
