-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-06-2020 a las 16:25:45
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pos`
--
CREATE DATABASE IF NOT EXISTS `pos` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `pos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `fecha`) VALUES
(7, 'EQUIPOS AROMATIZADORES', '2020-06-04 01:57:56'),
(8, 'AROMATIZACIÓN AMBIENTAL', '2020-06-04 01:58:23'),
(9, 'AROMATIZADOR TEXTIL', '2020-06-04 01:58:55'),
(10, 'DIFUSORES AROMÁTICOS', '2020-06-04 02:00:34'),
(11, 'ACEITES ESENCIALES', '2020-06-04 02:00:56'),
(12, 'COSMETICS MILANO', '2020-06-04 02:01:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `documento` int(11) DEFAULT NULL,
  `email` text COLLATE utf8_spanish_ci NOT NULL,
  `telefono` text COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_nacimiento` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `compras` int(11) DEFAULT NULL,
  `ultima_compra` datetime DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `documento`, `email`, `telefono`, `direccion`, `fecha_nacimiento`, `compras`, `ultima_compra`, `fecha`) VALUES
(13, 'José Arancibia', 28123456, 'josearancibia@gmail.com', '(261) 667-6952', 'B° Procrear Manzana M casa 6b, Maipú', '28/11/1978', 2, '2020-06-14 00:13:33', '2020-06-16 02:42:52'),
(14, 'Anabel Pascualeto', 30654321, 'anabelpascualeto@gmail.com', '(261) 471-0986', 'B° Procrear Manzana M casa 6b, Maipú', '05/11/1982', 8, '2020-06-11 16:06:21', '2020-06-16 02:58:53'),
(15, 'Alberto Duin', 14783477, 'albertoduin@gmail.com', '(261) 571-3420', 'Paraguay 1883, Godoy Cruz', '18/08/1962', 3, '2020-06-10 21:12:32', '2020-06-11 02:12:32'),
(16, 'Liliana Berrios', 17545827, 'lilianaberrios@gmail.com', '(261) 571-3420', 'Paraguay 1883, Godoy Cruz', '18/01/1966', 13, '2020-06-10 21:16:14', '2020-06-11 02:16:14'),
(17, 'Diego Chaparro', 20456852, 'diegochaparro@gmail.com', '(261) 125-4542', 'San Martín 1452, departamento 3a, Godoy Cruz', '22/02/1974', 7, '2020-06-10 21:13:21', '2020-06-11 02:13:21'),
(18, 'Sebastián Arce', 31569753, 'sebaarce85@gmail.com', '(261) 458-3295', 'Bandera de Los Andes 153, Guaymallen', '23/03/1985', 12, '2020-06-10 21:18:08', '2020-06-11 02:18:08'),
(19, 'Dana Lopéz', 33147958, 'danalopez@yahoo.com', '(261) 475-1762', 'Pasteur 1852, Guaymallen', '14/06/1988', 15, '2020-06-11 15:58:32', '2020-06-16 02:44:54'),
(20, 'Ariel Lembo', 29754338, 'ariellembo@hotmail.com', '(261) 584-6922', 'Adolfo Calle 1290, Guaymallen', '15/05/1981', 18, '2020-06-10 21:18:58', '2020-06-11 02:18:58'),
(21, 'Melisa Rodriguez', 29415611, 'melisarodriguez@gmail.com', '(261) 254-7889', 'Colombia 1746, Godoy Cruz', '07/05/1983', 16, '2020-06-15 21:42:12', '2020-06-16 02:42:12'),
(22, 'Silvina Gutierrez', 26845147, 'silvinagutierrez@hotmail.com', '(261) 478-5258', 'Boulogne Sur Mer 627, Capital Mendoza', '06/02/1979', 18, '2020-06-11 13:56:02', '2020-06-11 18:56:02'),
(23, 'Rodrigo Duin', 33258369, 'rodrigoduin@gmial.com', '(261) 249-4456', 'Paraguay 1886, Godoy Cruz.', '04/06/1988', NULL, NULL, '2020-06-14 03:30:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `codigo` text COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` text COLLATE utf8_spanish_ci NOT NULL,
  `imagen` text COLLATE utf8_spanish_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `precio_compra` float NOT NULL,
  `precio_venta` float NOT NULL,
  `ventas` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `id_categoria`, `codigo`, `descripcion`, `imagen`, `stock`, `precio_compra`, `precio_venta`, `ventas`, `fecha`) VALUES
(62, 7, '1001', 'AROMATIZADOR DIGITAL', 'vistas/img/productos/1001/233.jpg', 18, 500, 700, 2, '2020-06-11 02:16:13'),
(63, 7, '1002', 'AROMATIZADOR ANALÓGICO', 'vistas/img/productos/1002/443.jpg', 10, 400, 560, 0, '2020-06-04 13:17:40'),
(64, 7, '1003', 'PACK PREMIUM', 'vistas/img/productos/1003/728.jpg', 15, 550, 770, 1, '2020-06-11 02:16:14'),
(65, 8, '2001', 'AMOUR', 'vistas/img/productos/2001/996.jpg', 8, 120, 168, 0, '2020-06-04 13:19:39'),
(66, 8, '2002', 'ANGEL', 'vistas/img/productos/2002/396.jpg', 19, 120, 168, 1, '2020-06-11 18:56:02'),
(67, 8, '2003', 'APOLO', 'vistas/img/productos/2003/689.jpg', 12, 120, 168, 0, '2020-06-04 13:21:15'),
(68, 8, '2004', 'APPLE', 'vistas/img/productos/2004/149.jpg', 9, 120, 168, 0, '2020-06-04 13:22:09'),
(69, 8, '2005', 'CAPPUCCINO', 'vistas/img/productos/2005/869.jpg', 20, 120, 168, 0, '2020-06-04 13:22:54'),
(70, 8, '2006', 'CITRONELLA', 'vistas/img/productos/2006/962.jpg', 7, 120, 168, 0, '2020-06-04 13:23:47'),
(71, 8, '2007', 'CITRUS', 'vistas/img/productos/2007/708.jpg', 22, 120, 168, 0, '2020-06-04 13:25:03'),
(72, 8, '2008', 'COCO VAI', 'vistas/img/productos/2008/147.jpg', 17, 120, 168, 3, '2020-06-11 02:16:14'),
(73, 8, '2009', 'DUVET', 'vistas/img/productos/2009/253.jpg', 30, 120, 168, 0, '2020-06-04 13:26:16'),
(74, 8, '2010', 'ETIQUETA', 'vistas/img/productos/2010/278.jpg', 10, 120, 168, 0, '2020-06-04 13:26:53'),
(75, 8, '2011', 'FANTASÍA', 'vistas/img/productos/2011/583.jpg', 18, 120, 168, 0, '2020-06-04 13:28:04'),
(76, 8, '2012', 'FAREN', 'vistas/img/productos/2012/597.jpg', 11, 120, 168, 0, '2020-06-04 13:28:50'),
(77, 8, '2013', 'HAWAI', 'vistas/img/productos/2013/712.jpg', 16, 120, 168, 4, '2020-06-11 02:16:14'),
(78, 8, '2014', 'GUARANÁ', 'vistas/img/productos/2014/636.jpg', 20, 120, 168, 0, '2020-06-04 13:30:25'),
(79, 8, '2015', 'INDIANA', 'vistas/img/productos/2015/503.jpg', 16, 120, 168, 0, '2020-06-04 13:31:17'),
(80, 8, '2016', 'INVICTO', 'vistas/img/productos/2016/548.jpg', 14, 120, 168, 0, '2020-06-04 13:31:55'),
(81, 8, '2017', 'BAMBOO', 'vistas/img/productos/2017/560.jpg', 32, 120, 168, 8, '2020-06-16 02:42:12'),
(82, 8, '2018', 'BEBÉ', 'vistas/img/productos/2018/195.jpg', 28, 120, 168, 0, '2020-06-09 14:21:47'),
(83, 8, '2019', 'BLUE', 'vistas/img/productos/2019/262.jpg', 39, 120, 168, 0, '2020-06-11 17:54:22'),
(84, 8, '2020', 'BUBBLEGUM', 'vistas/img/productos/2020/586.jpg', 30, 120, 168, 0, '2020-06-09 14:20:34'),
(85, 8, '2021', 'CONY', 'vistas/img/productos/2021/264.jpg', 14, 120, 168, 0, '2020-06-09 14:20:01'),
(86, 8, '2022', 'DAMASCO', 'vistas/img/productos/2022/462.jpg', 14, 120, 168, 0, '2020-06-09 14:19:27'),
(87, 8, '2023', 'DANIEL', 'vistas/img/productos/2023/428.jpg', 33, 120, 168, 0, '2020-06-09 14:18:56'),
(88, 8, '2024', 'DOLCE', 'vistas/img/productos/2024/136.jpg', 34, 120, 168, 2, '2020-06-11 18:56:02'),
(89, 8, '2025', 'FLORES BLANCAS', 'vistas/img/productos/2025/848.jpg', 30, 120, 168, 0, '2020-06-09 14:17:26'),
(90, 8, '2026', 'FLOWERS', 'vistas/img/productos/2026/600.jpg', 30, 120, 168, 0, '2020-06-09 14:16:41'),
(91, 8, '2027', 'FRESH', 'vistas/img/productos/2027/461.jpg', 22, 120, 168, 0, '2020-06-09 14:15:41'),
(92, 8, '2028', 'GREEN', 'vistas/img/productos/2028/413.jpg', 24, 120, 168, 0, '2020-06-09 14:14:55'),
(93, 8, '2029', 'JAZMÍN', 'vistas/img/productos/2029/645.jpg', 9, 120, 168, 0, '2020-06-09 14:13:57'),
(94, 8, '2030', 'JAZZ', 'vistas/img/productos/2030/892.jpg', 12, 120, 168, 0, '2020-06-09 14:12:23'),
(95, 8, '2031', 'KSK', 'vistas/img/productos/2031/341.jpg', 39, 120, 168, 0, '2020-06-09 14:11:39'),
(96, 8, '2032', 'LADY', 'vistas/img/productos/2032/151.jpg', 14, 120, 168, 0, '2020-06-09 14:10:57'),
(97, 8, '2033', 'LAVANDA', 'vistas/img/productos/2033/616.jpg', 37, 120, 168, 0, '2020-06-09 14:10:19'),
(98, 8, '2034', 'LIMÓN', 'vistas/img/productos/2034/818.jpg', 28, 120, 168, 0, '2020-06-09 14:09:36'),
(99, 8, '2035', 'LINAH', 'vistas/img/productos/2035/155.jpg', 36, 120, 168, 0, '2020-06-09 14:09:03'),
(100, 8, '2036', 'LOLA', 'vistas/img/productos/2036/149.jpg', 25, 120, 168, 0, '2020-06-09 14:08:18'),
(101, 8, '2037', 'MARINO', 'vistas/img/productos/2037/728.jpg', 30, 120, 168, 0, '2020-06-09 14:07:31'),
(102, 8, '2038', 'MELÓN', 'vistas/img/productos/2038/161.jpg', 36, 120, 168, 0, '2020-06-09 14:05:58'),
(103, 8, '2039', 'MIEL Y LIMÓN', 'vistas/img/productos/2039/912.jpg', 14, 120, 168, 0, '2020-06-09 14:05:27'),
(104, 8, '2040', 'MITO', 'vistas/img/productos/2040/398.jpg', 28, 120, 168, 0, '2020-06-09 14:04:29'),
(105, 8, '2041', 'ORIENTE', 'vistas/img/productos/2041/919.jpg', 32, 120, 168, 3, '2020-06-11 02:16:14'),
(106, 8, '2042', 'PACIFIC', 'vistas/img/productos/2042/469.jpg', 30, 120, 168, 0, '2020-06-09 14:03:17'),
(107, 8, '2043', 'PAPAYA', 'vistas/img/productos/2043/925.jpg', 0, 120, 168, 0, '2020-06-09 14:02:06'),
(108, 8, '2044', 'PARÍS', 'vistas/img/productos/2044/135.jpg', 14, 120, 168, 0, '2020-06-09 14:01:22'),
(109, 8, '2045', 'PRAGA', 'vistas/img/productos/2045/907.jpg', 30, 120, 168, 0, '2020-06-09 13:59:46'),
(110, 8, '2046', 'PRUNELLA', 'vistas/img/productos/2046/470.jpg', 30, 120, 168, 0, '2020-06-09 13:58:40'),
(111, 8, '2047', 'ROCÍO', 'vistas/img/productos/2047/385.jpg', 0, 120, 168, 0, '2020-06-09 13:57:55'),
(112, 8, '2048', 'ROSAS', 'vistas/img/productos/2048/698.jpg', 14, 120, 168, 0, '2020-06-09 13:57:20'),
(113, 8, '2049', 'LONDON', 'vistas/img/productos/2049/792.jpg', 26, 120, 168, 0, '2020-06-09 13:56:19'),
(114, 8, '2050', 'MANDARINA', 'vistas/img/productos/2050/130.jpg', 25, 120, 168, 0, '2020-06-09 13:55:45'),
(115, 8, '2051', 'MANZANA CANELA', 'vistas/img/productos/2051/567.jpg', 9, 120, 168, 0, '2020-06-09 13:55:11'),
(116, 8, '2052', 'MARACUYÁ', 'vistas/img/productos/2052/953.jpg', 20, 120, 168, 0, '2020-06-09 13:54:17'),
(117, 8, '2053', 'MYSTIC', 'vistas/img/productos/2053/729.jpg', 20, 120, 168, 0, '2020-06-09 13:53:43'),
(118, 8, '2054', 'NINA', 'vistas/img/productos/2054/205.jpg', 16, 120, 168, 0, '2020-06-09 13:53:05'),
(119, 8, '2055', 'ONE MILLION', 'vistas/img/productos/2055/349.jpg', 15, 120, 168, 0, '2020-06-09 13:52:26'),
(120, 8, '2056', 'ORANGE', 'vistas/img/productos/2056/122.jpg', 25, 120, 168, 0, '2020-06-09 13:51:42'),
(121, 8, '2057', 'PATIO', 'vistas/img/productos/2057/629.jpg', 0, 120, 168, 0, '2020-06-09 13:51:07'),
(122, 8, '2058', 'PERAS Y FLORES', 'vistas/img/productos/2058/356.jpg', 30, 120, 168, 0, '2020-06-09 13:50:19'),
(123, 8, '2059', 'PINK', 'vistas/img/productos/2059/372.jpg', 4, 120, 168, 0, '2020-06-09 14:00:04'),
(124, 8, '2060', 'PITANGA', 'vistas/img/productos/2060/297.jpg', 24, 120, 168, 0, '2020-06-09 13:49:23'),
(125, 8, '2061', 'SWEET', 'vistas/img/productos/2061/729.jpg', 20, 120, 168, 0, '2020-06-09 13:48:55'),
(126, 8, '2062', 'TILO', 'vistas/img/productos/2062/746.jpg', 8, 120, 168, 0, '2020-06-09 13:48:28'),
(127, 8, '2063', 'TROPICAL', 'vistas/img/productos/2063/477.jpg', 12, 120, 168, 0, '2020-06-09 13:48:01'),
(128, 8, '2064', 'UVA', 'vistas/img/productos/2064/547.jpg', 17, 120, 168, 0, '2020-06-09 13:47:24'),
(129, 8, '2065', 'VAINILLA', 'vistas/img/productos/2065/157.jpg', 20, 120, 168, 0, '2020-06-09 13:46:48'),
(130, 8, '2066', 'VERBENA', 'vistas/img/productos/2066/960.jpg', 20, 120, 168, 0, '2020-06-09 13:45:39'),
(131, 8, '2067', 'VIOLETAS', 'vistas/img/productos/2067/471.jpg', 9, 120, 168, 0, '2020-06-09 13:54:33'),
(132, 9, '3001', 'AMOUR', 'vistas/img/productos/3001/560.jpg', 25, 120, 168, 0, '2020-06-09 14:41:04'),
(133, 9, '3002', 'ANGEL', 'vistas/img/productos/3002/383.jpg', 16, 120, 168, 0, '2020-06-09 14:42:08'),
(134, 9, '3003', 'APOLO', 'vistas/img/productos/3003/230.jpg', 30, 120, 168, 0, '2020-06-09 14:42:55'),
(135, 9, '3004', 'APPLE', 'vistas/img/productos/3004/207.jpg', 30, 120, 168, 0, '2020-06-09 14:43:43'),
(136, 9, '3005', 'CITRUS', 'vistas/img/productos/3005/818.jpg', 24, 120, 168, 0, '2020-06-09 14:44:38'),
(137, 9, '3006', 'COCO VAI', 'vistas/img/productos/3006/206.jpg', 29, 120, 168, 0, '2020-06-09 14:45:42'),
(138, 9, '3007', 'CONY', 'vistas/img/productos/3007/629.jpg', 36, 120, 168, 0, '2020-06-09 14:46:35'),
(139, 9, '3008', 'DANIEL', 'vistas/img/productos/3008/629.jpg', 19, 120, 168, 0, '2020-06-09 14:47:33'),
(140, 9, '3009', 'FLOWERS', 'vistas/img/productos/3009/615.jpg', 26, 90, 126, 0, '2020-06-09 14:48:52'),
(141, 9, '3010', 'GREEN', 'vistas/img/productos/3010/675.jpg', 37, 100, 140, 0, '2020-06-09 14:49:36'),
(142, 9, '3011', 'GUARANÁ', 'vistas/img/productos/3011/807.jpg', 29, 110, 154, 0, '2020-06-09 14:50:37'),
(143, 9, '3012', 'HAWAI', 'vistas/img/productos/3012/117.jpg', 14, 100, 140, 0, '2020-06-09 14:51:28'),
(144, 9, '3013', 'LADY', 'vistas/img/productos/3013/772.jpg', 10, 100, 140, 0, '2020-06-09 14:52:36'),
(145, 9, '3014', 'LAVANDA', 'vistas/img/productos/3014/188.jpg', 30, 110, 154, 0, '2020-06-09 14:53:25'),
(146, 9, '3015', 'LIMÓN', 'vistas/img/productos/3015/568.jpg', 34, 110, 154, 0, '2020-06-09 14:54:18'),
(147, 9, '3016', 'LINAH', 'vistas/img/productos/3016/863.jpg', 34, 120, 168, 0, '2020-06-09 14:55:14'),
(148, 9, '3017', 'BAMBOO', 'vistas/img/productos/3017/566.jpg', 25, 110, 154, 0, '2020-06-09 14:56:22'),
(149, 9, '3018', 'BEBÉ', 'vistas/img/productos/3018/583.jpg', 30, 125, 175, 0, '2020-06-09 14:59:34'),
(150, 9, '3019', 'BLUE', 'vistas/img/productos/3019/663.jpg', 19, 119, 166.6, 0, '2020-06-09 14:58:14'),
(151, 9, '3020', 'BUBBLEGUM', 'vistas/img/productos/3020/592.jpg', 33, 130, 182, 0, '2020-06-09 14:59:07'),
(152, 9, '3021', 'DUVET', 'vistas/img/productos/3021/444.jpg', 26, 140, 196, 0, '2020-06-09 15:00:23'),
(153, 9, '3022', 'ETIQUETA', 'vistas/img/productos/3022/905.jpg', 26, 95, 133, 0, '2020-06-09 15:01:10'),
(154, 9, '3023', 'FAREN', 'vistas/img/productos/3023/879.jpg', 29, 115, 161, 0, '2020-06-09 15:01:58'),
(155, 9, '3024', 'FLORES BLANCAS', 'vistas/img/productos/3024/167.jpg', 27, 110, 154, 0, '2020-06-09 15:02:52'),
(156, 9, '3025', 'INDIANA', 'vistas/img/productos/3025/658.jpg', 14, 126, 176.4, 0, '2020-06-09 15:04:50'),
(157, 9, '3026', 'INVICTO', 'vistas/img/productos/3026/202.png', 30, 133, 186.2, 0, '2020-06-09 16:14:42'),
(158, 9, '3027', 'JAZMÍN', 'vistas/img/productos/3027/629.png', 36, 90, 126, 0, '2020-06-11 17:54:22'),
(159, 9, '3028', 'KSK', 'vistas/img/productos/3028/753.png', 36, 100, 140, 0, '2020-06-11 17:54:22'),
(160, 9, '3029', 'LOLA', 'vistas/img/productos/3029/261.jpg', 33, 111, 155.4, 0, '2020-06-11 17:54:22'),
(161, 9, '3030', 'MAN', 'vistas/img/productos/3030/210.jpg', 39, 110, 154, 0, '2020-06-09 15:10:56'),
(162, 9, '3031', 'ONE MILLION', 'vistas/img/productos/3031/827.jpg', 27, 120, 168, 0, '2020-06-09 15:11:49'),
(163, 9, '3032', 'PAPAYA', 'vistas/img/productos/3032/110.jpg', 26, 112, 156.8, 0, '2020-06-09 16:01:30'),
(164, 9, '3033', 'PATIO', 'vistas/img/productos/3033/333.jpg', 10, 103, 144.2, 0, '2020-06-09 16:02:20'),
(165, 9, '3034', 'PINK', 'vistas/img/productos/3034/851.jpg', 14, 150, 210, 0, '2020-06-09 16:03:17'),
(166, 9, '3035', 'POLO', 'vistas/img/productos/3035/609.jpg', 29, 120, 168, 0, '2020-06-09 16:03:59'),
(167, 9, '3036', 'ROCÍO', 'vistas/img/productos/3036/986.jpg', 40, 130, 182, 0, '2020-06-09 16:04:48'),
(168, 9, '3037', 'ROSAS', 'vistas/img/productos/3037/722.jpg', 26, 135, 189, 0, '2020-06-09 16:06:06'),
(169, 9, '3038', 'TROPICAL', 'vistas/img/productos/3038/630.jpg', 26, 120, 168, 0, '2020-06-09 16:06:56'),
(170, 9, '3039', 'UVA', 'vistas/img/productos/3039/468.jpg', 29, 125, 175, 0, '2020-06-09 16:07:49'),
(171, 9, '3040', 'VAINILLA', 'vistas/img/productos/3040/178.jpg', 34, 110, 154, 0, '2020-06-11 17:54:22'),
(172, 9, '3041', 'VIOLETAS', 'vistas/img/productos/3041/353.jpg', 36, 120, 168, 0, '2020-06-09 16:09:33'),
(173, 10, '4001', 'AMOUR', 'vistas/img/productos/4001/448.jpg', 30, 90, 126, 0, '2020-06-09 16:19:13'),
(174, 10, '4002', 'APPLE', 'vistas/img/productos/4002/652.jpg', 30, 100, 140, 0, '2020-06-09 16:20:37'),
(175, 10, '4003', 'BAMBOO', 'vistas/img/productos/4003/408.jpg', 25, 120, 168, 0, '2020-06-09 16:22:27'),
(176, 10, '4004', 'BEBÉ', 'vistas/img/productos/4004/933.jpg', 30, 120, 168, 0, '2020-06-09 16:51:37'),
(177, 10, '4005', 'COCO VAI', 'vistas/img/productos/4005/485.jpg', 27, 110, 154, 4, '2020-06-16 02:42:12'),
(178, 10, '4006', 'CONY', 'vistas/img/productos/4006/543.jpg', 30, 140, 196, 0, '2020-06-09 16:53:36'),
(179, 10, '4007', 'DAMASCO', 'vistas/img/productos/4007/582.jpg', 10, 110, 154, 0, '2020-06-09 16:54:38'),
(180, 10, '4008', 'DOLCE', 'vistas/img/productos/4008/136.jpg', 26, 130, 182, 0, '2020-06-09 16:55:43'),
(181, 10, '4009', 'HAWAI', 'vistas/img/productos/4009/270.jpg', 30, 150, 210, 0, '2020-06-09 16:56:37'),
(182, 10, '4010', 'INDIANA', 'vistas/img/productos/4010/732.jpg', 30, 140, 196, 0, '2020-06-09 16:57:42'),
(183, 10, '4011', 'JAZMÍN', 'vistas/img/productos/4011/479.jpg', 30, 110, 154, 0, '2020-06-09 16:58:26'),
(184, 10, '4012', 'JAZZ', 'vistas/img/productos/4012/565.jpg', 20, 150, 210, 0, '2020-06-09 17:06:47'),
(185, 10, '4013', 'LOLA', 'vistas/img/productos/4013/370.jpg', 25, 125, 175, 0, '2020-06-09 17:07:54'),
(186, 10, '4014', 'LONDON', 'vistas/img/productos/4014/558.jpg', 22, 130, 182, 4, '2020-06-11 02:11:29'),
(187, 10, '4015', 'MANZANA CANELA', 'vistas/img/productos/4015/421.jpg', 13, 120, 168, 0, '2020-06-09 17:09:57'),
(188, 10, '4016', 'MARACUYÁ', 'vistas/img/productos/4016/148.jpg', 10, 140, 196, 0, '2020-06-09 17:13:51'),
(189, 10, '4017', 'BUBBLEGUM', 'vistas/img/productos/4017/528.jpg', 30, 120, 168, 0, '2020-06-09 17:15:17'),
(190, 10, '4018', 'CAPPUCCINO', 'vistas/img/productos/4018/511.jpg', 30, 130, 182, 0, '2020-06-09 17:16:15'),
(191, 10, '4019', 'CITRONELLA', 'vistas/img/productos/4019/928.jpg', 30, 130, 182, 0, '2020-06-09 17:17:20'),
(192, 10, '4020', 'CITRUS', 'vistas/img/productos/4020/457.jpg', 36, 120, 168, 0, '2020-06-09 17:18:29'),
(193, 10, '4021', 'FLORES BLANCAS', 'vistas/img/productos/4021/433.jpg', 32, 120, 168, 0, '2020-06-09 17:19:25'),
(194, 10, '4022', 'FLOWERS', 'vistas/img/productos/4022/817.jpg', 32, 130, 182, 4, '2020-06-11 02:11:28'),
(195, 10, '4023', 'GREEN', 'vistas/img/productos/4023/921.jpg', 32, 130, 182, 0, '2020-06-09 17:21:15'),
(196, 10, '4024', 'GUARANÁ', 'vistas/img/productos/4024/658.jpg', 34, 130, 182, 0, '2020-06-09 17:22:13'),
(197, 10, '4025', 'KSK', 'vistas/img/productos/4025/656.jpg', 11, 110, 154, 0, '2020-06-09 17:23:10'),
(198, 10, '4026', 'LAVANDA', 'vistas/img/productos/4026/785.jpg', 36, 130, 182, 0, '2020-06-09 17:24:02'),
(199, 10, '4027', 'LIMÓN', 'vistas/img/productos/4027/580.jpg', 37, 140, 196, 0, '2020-06-09 17:25:34'),
(200, 10, '4028', 'LINAH', 'vistas/img/productos/4028/225.jpg', 37, 100, 140, 3, '2020-06-11 02:11:28'),
(201, 10, '4029', 'MARINO', 'vistas/img/productos/4029/827.jpg', 37, 140, 196, 0, '2020-06-09 17:27:30'),
(202, 10, '4030', 'MELÓN', 'vistas/img/productos/4030/104.jpg', 12, 120, 168, 0, '2020-06-09 17:28:28'),
(203, 10, '4031', 'MIEL Y LIMÓN', 'vistas/img/productos/4031/942.jpg', 35, 130, 182, 0, '2020-06-09 17:29:40'),
(204, 10, '4032', 'NINA', 'vistas/img/productos/4032/520.jpg', 36, 130, 182, 0, '2020-06-09 17:30:21'),
(205, 10, '4033', 'ORANGE', 'vistas/img/productos/4033/818.jpg', 30, 140, 196, 0, '2020-06-09 17:43:43'),
(206, 10, '4034', 'ORIENTE', 'vistas/img/productos/4034/103.jpg', 36, 130, 182, 0, '2020-06-09 17:47:27'),
(207, 10, '4035', 'PAPAYA', 'vistas/img/productos/4035/896.jpg', 35, 140, 196, 0, '2020-06-09 17:49:03'),
(208, 10, '4036', 'PARÍS', 'vistas/img/productos/4036/366.jpg', 36, 130, 182, 0, '2020-06-09 18:04:11'),
(209, 10, '4037', 'PATIO', 'vistas/img/productos/4037/597.jpg', 38, 120, 168, 0, '2020-06-09 18:05:01'),
(210, 10, '4038', 'PERAS Y FLORES', 'vistas/img/productos/4038/952.jpg', 13, 140, 196, 0, '2020-06-09 18:06:39'),
(211, 10, '4039', 'PINK', 'vistas/img/productos/4039/404.jpg', 45, 150, 210, 0, '2020-06-09 18:07:29'),
(212, 10, '4040', 'PRAGA', 'vistas/img/productos/4040/467.jpg', 34, 120, 168, 0, '2020-06-09 18:08:21'),
(213, 10, '4041', 'SWEET', 'vistas/img/productos/4041/324.jpg', 11, 100, 140, 0, '2020-06-09 18:09:24'),
(214, 10, '4042', 'TROPICAL', 'vistas/img/productos/4042/961.jpg', 35, 150, 210, 0, '2020-06-09 18:10:14'),
(215, 10, '4043', 'UVA', 'vistas/img/productos/4043/623.jpg', 28, 100, 140, 0, '2020-06-09 18:11:12'),
(216, 10, '4044', 'VAINILLA', 'vistas/img/productos/4044/323.jpg', 39, 120, 168, 0, '2020-06-09 18:12:04'),
(217, 10, '4045', 'VERBENA', 'vistas/img/productos/4045/183.jpg', 35, 160, 224, 3, '2020-06-11 02:02:57'),
(218, 10, '4046', 'VIOLETAS', 'vistas/img/productos/4046/461.jpg', 29, 130, 182, 0, '2020-06-09 18:13:35'),
(219, 11, '5001', 'BAMBOO', 'vistas/img/productos/5001/787.jpg', 26, 200, 280, 4, '2020-06-16 02:42:12'),
(220, 11, '5002', 'COCO VAI', 'vistas/img/productos/5002/839.jpg', 29, 220, 308, 7, '2020-06-11 02:13:20'),
(221, 11, '5003', 'FLORES BLANCAS', 'vistas/img/productos/5003/660.jpg', 29, 230, 322, 8, '2020-06-11 18:58:32'),
(222, 11, '5004', 'GREEN', 'vistas/img/productos/5004/919.jpg', 42, 200, 280, 0, '2020-06-09 18:24:34'),
(223, 11, '5005', 'JAZMÍN', 'vistas/img/productos/5005/158.jpg', 26, 240, 336, 0, '2020-06-09 18:25:23'),
(224, 11, '5006', 'LAVANDA', 'vistas/img/productos/5006/100.jpg', 10, 300, 420, 0, '2020-06-09 18:26:15'),
(225, 11, '5007', 'LIMÓN', 'vistas/img/productos/5007/809.jpg', 27, 270, 378, 10, '2020-06-11 02:18:58'),
(226, 11, '5008', 'LINAH', 'vistas/img/productos/5008/147.jpg', 35, 210, 294, 0, '2020-06-09 18:29:51'),
(227, 11, '5009', 'MANZANA CANELA', 'vistas/img/productos/5009/268.jpg', 39, 260, 364, 0, '2020-06-09 18:30:33'),
(228, 11, '5010', 'MIEL Y LIMÓN', 'vistas/img/productos/5010/642.jpg', 28, 280, 392, 0, '2020-06-09 18:31:38'),
(229, 11, '5011', 'ORANGE', 'vistas/img/productos/5011/547.jpg', 26, 260, 364, 0, '2020-06-09 18:32:26'),
(230, 11, '5012', 'ORIENTE', 'vistas/img/productos/5012/466.jpg', 41, 210, 294, 2, '2020-06-11 18:58:31'),
(231, 11, '5013', 'PAPAYA', 'vistas/img/productos/5013/568.jpg', 45, 260, 364, 0, '2020-06-09 18:35:55'),
(232, 11, '5014', 'VAINILLA', 'vistas/img/productos/5014/995.jpg', 25, 250, 350, 0, '2020-06-09 18:36:43'),
(233, 12, '6001', 'AGUA MICELAR', 'vistas/img/productos/6001/164.jpg', 8, 350, 490, 2, '2020-06-11 02:02:57'),
(234, 12, '6002', 'CREMA HUMECTANTE FLOWERS', 'vistas/img/productos/6002/662.jpg', 30, 400, 560, 0, '2020-06-09 18:39:21'),
(235, 12, '6003', 'CREMA HUMECTANTE SUMMER', 'vistas/img/productos/6003/228.jpg', 20, 450, 630, 0, '2020-06-09 18:40:11'),
(236, 12, '6004', 'CREMA HUMECTANTE ROMANTIC VENICE', 'vistas/img/productos/6004/129.jpg', 30, 450, 630, 0, '2020-06-09 18:41:28'),
(237, 12, '6005', 'CREMA HUMECTANTE PURE SEDUCTION', 'vistas/img/productos/6005/909.jpg', 30, 450, 630, 0, '2020-06-09 18:42:30'),
(238, 12, '6006', 'CREMA HUMECTANTE FUNNY GIRL', 'vistas/img/productos/6006/439.jpg', 30, 450, 630, 0, '2020-06-09 18:43:44'),
(239, 12, '6007', 'CREMA HUMECTANTE CAPTIVANT', 'vistas/img/productos/6007/519.jpg', 30, 450, 630, 0, '2020-06-09 18:44:52'),
(240, 12, '6008', 'BODY SPLASH FLOWERS', 'vistas/img/productos/6008/500.jpg', 30, 600, 840, 0, '2020-06-09 18:46:39'),
(241, 12, '6009', 'BODY SPLASH MIAMI SUMMER', 'vistas/img/productos/6009/848.jpg', 35, 600, 840, 0, '2020-06-09 18:47:27'),
(242, 12, '6010', 'BODY SPLASH ROMANTIC VENICE', 'vistas/img/productos/6010/957.jpg', 32, 580, 812, 0, '2020-06-09 18:48:23'),
(243, 12, '6011', 'BODY SPLASH PURE SEDUCTION', 'vistas/img/productos/6011/284.jpg', 35, 610, 854, 0, '2020-06-16 02:42:52'),
(244, 12, '6012', 'BODY SPLASH FUNNY GIRL', 'vistas/img/productos/6012/401.jpg', 35, 650, 910, 0, '2020-06-09 18:53:04'),
(245, 12, '6013', 'BODY SPLASH CAPTIVANT', 'vistas/img/productos/6013/805.jpg', 36, 620, 868, 0, '2020-06-09 18:53:49'),
(246, 12, '6014', 'JABÓN LÍQUIDO COCO', 'vistas/img/productos/6014/974.jpg', 36, 80, 112, 4, '2020-06-16 02:42:12'),
(247, 12, '6015', 'JABÓN LÍQUIDO MANZANA', 'vistas/img/productos/6015/765.jpg', 50, 80, 112, 0, '2020-06-09 18:56:16'),
(248, 12, '6016', 'JABÓN LÍQUIDO CITRICO', 'vistas/img/productos/6016/143.jpg', 30, 90, 126, 0, '2020-06-16 02:42:52'),
(249, 12, '6017', 'JABÓN LÍQUIDO DAMASCO', 'vistas/img/productos/6017/570.jpg', 15, 120, 168, 0, '2020-06-14 03:45:57'),
(250, 12, '6018', 'JABÓN LÍQUIDO RELAX', 'vistas/img/productos/6018/669.jpg', 10, 80, 112, 0, '2020-06-09 18:59:05'),
(251, 12, '6019', 'JABÓN LÍQUIDO CREMOSO', 'vistas/img/productos/6019/195.jpg', 30, 90, 126, 0, '2020-06-09 18:59:42'),
(252, 12, '6020', 'DOY PACK MANZANA', 'vistas/img/productos/6020/436.jpg', 36, 50, 70, 0, '2020-06-14 03:45:57'),
(253, 12, '6021', 'DOY PACK CITRICO', 'vistas/img/productos/6021/514.jpg', 30, 50, 70, 0, '2020-06-16 02:58:53'),
(254, 12, '6022', 'DOY PACK CREMOSO', 'vistas/img/productos/6022/299.jpg', 29, 50, 70, 24, '2020-06-11 19:06:21'),
(255, 12, '6023', 'DOY PACK COCO', 'vistas/img/productos/6023/775.jpg', 28, 50, 70, 2, '2020-06-11 02:16:53'),
(256, 12, '6024', 'DOY PACK RELAX', 'vistas/img/productos/6024/146.jpg', 26, 50, 70, 0, '2020-06-09 19:14:10'),
(257, 12, '6025', 'DOY PACK DAMASCO', 'vistas/img/productos/6025/431.jpg', 23, 50, 70, 7, '2020-06-16 02:44:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `usuario` text COLLATE utf8_spanish_ci NOT NULL,
  `password` text COLLATE utf8_spanish_ci NOT NULL,
  `perfil` text COLLATE utf8_spanish_ci NOT NULL,
  `foto` text COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  `ultimo_login` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `usuario`, `password`, `perfil`, `foto`, `estado`, `ultimo_login`, `fecha`) VALUES
(60, 'David Roco', 'david', '$2a$07$asxx54ahjppf45sd87a5auduOWfv6GWl2Tj.lDxlnrnd8w8iw1uY2', 'Administrador', 'vistas/img/usuarios/david/551.png', 1, '2020-06-15 19:51:35', '2020-06-15 22:51:35'),
(61, 'Jeremías', 'jere', '$2a$07$asxx54ahjppf45sd87a5auduOWfv6GWl2Tj.lDxlnrnd8w8iw1uY2', 'Inventario', 'vistas/img/usuarios/jere/616.jpg', 1, '2020-06-15 10:12:55', '2020-06-15 13:12:55'),
(63, 'Ana Lucía', 'ana', '$2a$07$asxx54ahjppf45sd87a5auduOWfv6GWl2Tj.lDxlnrnd8w8iw1uY2', 'Vendedor', 'vistas/img/usuarios/ana/929.png', 0, '2020-06-12 18:43:16', '2020-06-15 22:31:25'),
(64, 'Claudia Duin', 'claudia', '$2a$07$asxx54ahjppf45sd87a5auduOWfv6GWl2Tj.lDxlnrnd8w8iw1uY2', 'Vendedor', 'vistas/img/usuarios/claudia/728.png', 1, '2020-06-10 21:01:54', '2020-06-11 02:01:54'),
(65, 'Profesor', 'profesor', '$2a$07$asxx54ahjppf45sd87a5aubp27ZqOfo4KS9ThVp5PCa.gHeBvVcSq', 'Administrador', 'vistas/img/usuarios/profesor/481.jpg', 1, '2020-06-03 20:26:02', '2020-06-04 01:26:02'),
(66, 'Francisco', 'fran', '$2a$07$asxx54ahjppf45sd87a5auduOWfv6GWl2Tj.lDxlnrnd8w8iw1uY2', 'Vendedor', 'vistas/img/usuarios/fran/214.png', 1, '2020-06-15 19:34:39', '2020-06-15 22:34:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `codigo` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_vendedor` int(11) NOT NULL,
  `productos` text COLLATE utf8_spanish_ci NOT NULL,
  `impuesto` float NOT NULL,
  `neto` float NOT NULL,
  `total` float NOT NULL,
  `metodo_pago` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `codigo`, `id_cliente`, `id_vendedor`, `productos`, `impuesto`, `neto`, `total`, `metodo_pago`, `fecha`) VALUES
(38, 10001, 14, 64, '[{\"id\":\"233\",\"descripcion\":\"AGUA MICELAR\",\"cantidad\":\"2\",\"stock\":\"8\",\"precio\":\"490\",\"total\":\"980\"},{\"id\":\"217\",\"descripcion\":\"VERBENA\",\"cantidad\":\"3\",\"stock\":\"35\",\"precio\":\"224\",\"total\":\"672\"}]', 165.2, 1652, 1817.2, 'Efectivo', '2020-05-06 02:02:58'),
(40, 10003, 21, 66, '[{\"id\":\"219\",\"descripcion\":\"BAMBOO\",\"cantidad\":\"4\",\"stock\":\"26\",\"precio\":\"280\",\"total\":\"1120\"},{\"id\":\"81\",\"descripcion\":\"BAMBOO\",\"cantidad\":\"4\",\"stock\":\"28\",\"precio\":\"168\",\"total\":\"672\"},{\"id\":\"246\",\"descripcion\":\"JABÓN LÍQUIDO COCO\",\"cantidad\":\"4\",\"stock\":\"36\",\"precio\":\"112\",\"total\":\"448\"},{\"id\":\"177\",\"descripcion\":\"COCO VAI\",\"cantidad\":\"4\",\"stock\":\"27\",\"precio\":\"154\",\"total\":\"616\"}]', 599.76, 2856, 3455.76, 'Efectivo', '2020-06-13 14:53:27'),
(41, 10004, 19, 66, '[{\"id\":\"200\",\"descripcion\":\"LINAH\",\"cantidad\":\"3\",\"stock\":\"37\",\"precio\":\"140\",\"total\":\"420\"},{\"id\":\"194\",\"descripcion\":\"FLOWERS\",\"cantidad\":\"4\",\"stock\":\"32\",\"precio\":\"182\",\"total\":\"728\"},{\"id\":\"186\",\"descripcion\":\"LONDON\",\"cantidad\":\"4\",\"stock\":\"22\",\"precio\":\"182\",\"total\":\"728\"}]', 393.96, 1876, 2269.96, 'Efectivo', '2020-06-13 14:53:33'),
(42, 10005, 15, 66, '[{\"id\":\"257\",\"descripcion\":\"DOY PACK DAMASCO\",\"cantidad\":\"3\",\"stock\":\"27\",\"precio\":\"70\",\"total\":\"210\"}]', 42, 210, 252, 'Efectivo', '2020-06-13 14:53:38'),
(43, 10006, 17, 66, '[{\"id\":\"220\",\"descripcion\":\"COCO VAI\",\"cantidad\":\"7\",\"stock\":\"29\",\"precio\":\"308\",\"total\":\"2156\"}]', 431.2, 2156, 2587.2, 'Efectivo', '2020-06-13 14:53:45'),
(44, 10007, 16, 63, '[{\"id\":\"62\",\"descripcion\":\"AROMATIZADOR DIGITAL\",\"cantidad\":\"2\",\"stock\":\"18\",\"precio\":\"700\",\"total\":\"1400\"},{\"id\":\"64\",\"descripcion\":\"PACK PREMIUM\",\"cantidad\":\"1\",\"stock\":\"15\",\"precio\":\"770\",\"total\":\"770\"},{\"id\":\"72\",\"descripcion\":\"COCO VAI\",\"cantidad\":\"3\",\"stock\":\"17\",\"precio\":\"168\",\"total\":\"504\"},{\"id\":\"77\",\"descripcion\":\"HAWAI\",\"cantidad\":\"4\",\"stock\":\"16\",\"precio\":\"168\",\"total\":\"672\"},{\"id\":\"105\",\"descripcion\":\"ORIENTE\",\"cantidad\":\"3\",\"stock\":\"32\",\"precio\":\"168\",\"total\":\"504\"}]', 385, 3850, 4235, 'Efectivo', '2020-06-11 02:16:14'),
(45, 10008, 22, 63, '[{\"id\":\"255\",\"descripcion\":\"DOY PACK COCO\",\"cantidad\":\"2\",\"stock\":\"28\",\"precio\":\"70\",\"total\":\"140\"},{\"id\":\"254\",\"descripcion\":\"DOY PACK CREMOSO\",\"cantidad\":\"13\",\"stock\":\"40\",\"precio\":\"70\",\"total\":\"910\"}]', 210, 1050, 1260, 'Efectivo', '2020-06-11 02:16:53'),
(46, 10009, 18, 63, '[{\"id\":\"254\",\"descripcion\":\"DOY PACK CREMOSO\",\"cantidad\":\"8\",\"stock\":\"32\",\"precio\":\"70\",\"total\":\"560\"},{\"id\":\"81\",\"descripcion\":\"BAMBOO\",\"cantidad\":\"4\",\"stock\":\"24\",\"precio\":\"168\",\"total\":\"672\"}]', 246.4, 1232, 1478.4, 'Efectivo', '2020-04-11 02:18:08'),
(47, 10010, 20, 63, '[{\"id\":\"257\",\"descripcion\":\"DOY PACK DAMASCO\",\"cantidad\":\"2\",\"stock\":\"25\",\"precio\":\"70\",\"total\":\"140\"},{\"id\":\"221\",\"descripcion\":\"FLORES BLANCAS\",\"cantidad\":\"6\",\"stock\":\"31\",\"precio\":\"322\",\"total\":\"1932\"},{\"id\":\"225\",\"descripcion\":\"LIMÓN\",\"cantidad\":\"10\",\"stock\":\"27\",\"precio\":\"378\",\"total\":\"3780\"}]', 585.2, 5852, 6437.2, 'Efectivo', '2020-05-11 02:18:58'),
(49, 10012, 22, 63, '[{\"id\":\"66\",\"descripcion\":\"ANGEL\",\"cantidad\":\"1\",\"stock\":\"19\",\"precio\":\"168\",\"total\":\"168\"},{\"id\":\"88\",\"descripcion\":\"DOLCE\",\"cantidad\":\"2\",\"stock\":\"34\",\"precio\":\"168\",\"total\":\"336\"}]', 0, 504, 504, 'Efectivo', '2020-06-11 18:56:02'),
(50, 10013, 19, 63, '[{\"id\":\"230\",\"descripcion\":\"ORIENTE\",\"cantidad\":\"2\",\"stock\":\"41\",\"precio\":\"294\",\"total\":\"588\"},{\"id\":\"221\",\"descripcion\":\"FLORES BLANCAS\",\"cantidad\":\"2\",\"stock\":\"29\",\"precio\":\"322\",\"total\":\"644\"}]', 0, 1232, 1232, 'Efectivo', '2020-06-11 18:58:32'),
(51, 10014, 14, 63, '[{\"id\":\"254\",\"descripcion\":\"DOY PACK CREMOSO\",\"cantidad\":\"3\",\"stock\":\"29\",\"precio\":\"70\",\"total\":\"210\"}]', 0, 210, 210, 'Efectivo', '2020-06-11 19:06:21'),
(53, 10016, 13, 66, '[{\"id\":\"257\",\"descripcion\":\"DOY PACK DAMASCO\",\"cantidad\":\"2\",\"stock\":\"23\",\"precio\":\"70\",\"total\":\"140\"}]', 0, 140, 140, 'Efectivo', '2020-06-14 03:13:33');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=259;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
