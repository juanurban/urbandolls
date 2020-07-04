-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2020 a las 05:54:04
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` text COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `fecha`) VALUES
(1, 'Blusas y camisas', '2020-04-22 20:50:00'),
(2, 'Chaquetas y buzos', '2020-04-22 20:50:12'),
(3, 'Vestidos', '2020-04-22 20:50:23'),
(4, 'Enterizos y conjuntos', '2020-04-22 20:50:31'),
(5, 'Pantalones', '2020-04-22 20:50:41'),
(6, 'Deportivos', '2020-04-22 20:50:50'),
(7, 'Faldas', '2020-04-22 20:50:58'),
(8, 'Shorts', '2020-04-22 20:51:06'),
(9, 'Accesorios', '2020-04-22 20:51:16'),
(10, 'Lencería', '2020-04-22 20:51:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` text COLLATE utf8_spanish_ci NOT NULL,
  `documento` int(11) NOT NULL,
  `email` text COLLATE utf8_spanish_ci NOT NULL,
  `telefono` text COLLATE utf8_spanish_ci NOT NULL,
  `direccion` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `compras` int(11) NOT NULL,
  `ultima_compra` datetime NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `documento`, `email`, `telefono`, `direccion`, `fecha_nacimiento`, `compras`, `ultima_compra`, `fecha`) VALUES
(3, 'Juan Villegas', 2147483647, 'juan@hotmail.com', '(300) 341-2345', 'Calle 23 # 45 - 56', '1980-11-02', 10, '2020-07-01 18:19:07', '2020-07-01 23:19:07'),
(4, 'Pedro Pérez', 2147483647, 'pedro@gmail.com', '(399) 876-5432', 'Calle 34 N33 -56', '1970-08-07', 13, '2020-07-01 22:40:57', '2020-07-02 03:40:57'),
(5, 'Miguel Murillo', 325235235, 'miguel@hotmail.com', '(254) 545-3446', 'calle 34 # 34 - 23', '1976-03-04', 32, '2017-12-26 17:27:13', '2017-12-27 04:38:13'),
(6, 'Margarita Londoño', 34565432, 'margarita@hotmail.com', '(344) 345-6678', 'Calle 45 # 34 - 56', '1976-11-30', 14, '2017-12-26 17:26:51', '2017-12-26 22:26:51'),
(7, 'Julian Ramirez', 786786545, 'julian@hotmail.com', '(675) 674-5453', 'Carrera 45 # 54 - 56', '1980-04-05', 14, '2017-12-26 17:26:28', '2017-12-26 22:26:28'),
(8, 'Stella Jaramillo', 65756735, 'stella@gmail.com', '(435) 346-3463', 'Carrera 34 # 45- 56', '1956-06-05', 9, '2017-12-26 17:25:55', '2017-12-26 22:25:55'),
(9, 'Eduardo López', 2147483647, 'eduardo@gmail.com', '(534) 634-6565', 'Carrera 67 # 45sur', '1978-03-04', 12, '2017-12-26 17:25:33', '2017-12-26 22:25:33'),
(10, 'Ximena Restrepo', 436346346, 'ximena@gmail.com', '(543) 463-4634', 'calle 45 # 23 - 45', '1956-03-04', 18, '2017-12-26 17:25:08', '2017-12-26 22:25:08'),
(11, 'David Guzman', 43634643, 'david@hotmail.com', '(354) 574-5634', 'carrera 45 # 45 ', '1967-05-04', 10, '2017-12-26 17:24:50', '2017-12-26 22:24:50'),
(12, 'Gonzalo Pérez', 436346346, 'gonzalo@yahoo.com', '(235) 346-3464', 'Carrera 34 # 56 - 34', '1967-08-09', 24, '2017-12-25 17:24:24', '2017-12-27 00:30:12');

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
(1, 1, '101', 'Body rosado estampado yes', 'vistas/img/productos/101/1011.png', 22, 25000, 45000, 2, '2020-05-11 19:59:02'),
(2, 1, '102', 'Croptop azul rayas verticales', 'vistas/img/productos/102/679.png', 12, 28000, 50000, 0, '2020-04-22 17:54:42'),
(3, 1, '103', 'Camisera mostaza rayas verticales', 'vistas/img/productos/103/649.png', 30, 26000, 55000, 0, '2020-04-22 17:54:57'),
(4, 1, '104', 'Camiseta fuscia estampado flamenco', 'vistas/img/productos/104/1041.png', 22, 22000, 40000, 0, '2020-04-19 19:31:21'),
(5, 1, '105', 'Blusa negra manga larga de encaje', 'vistas/img/productos/105/1051.png', 16, 26000, 50000, 0, '2020-04-19 19:31:21'),
(6, 1, '106', 'Blusa azul floral manga corta', 'vistas/img/productos/106/1061.png', 15, 20000, 40000, 0, '2020-04-19 19:31:21'),
(7, 2, '201', 'Buzo negro estampado barbie', 'vistas/img/productos/201/2011.png', 23, 28000, 52000, 0, '2020-04-19 19:31:21'),
(8, 2, '202', 'Cardigan rosado floral estampado ', 'vistas/img/productos/202/2021.png', 12, 25000, 58000, 0, '2020-04-19 19:31:21'),
(9, 3, '301', 'Vestidos negro puntos blancos', 'vistas/img/productos/301/3011.png', 12, 30000, 65000, 0, '2020-04-19 19:31:21'),
(10, 3, '302', 'Vestido blanco manga tres cuartos de encaje', 'vistas/img/productos/302/3021.png', 10, 28000, 62000, 0, '2020-04-19 19:31:21'),
(11, 4, '401', 'Enterizo rojo rayas verticlaes', 'vistas/img/productos/401/4011.png', 20, 35000, 70000, 0, '2020-04-19 19:31:21'),
(12, 4, '402', 'Enterizo jean efecto desgastado', 'vistas/img/productos/402/4021.png', 20, 40000, 85000, 0, '2020-04-19 19:31:21'),
(13, 5, '501', 'Jean escultor azul clásico', 'vistas/img/productos/501/5011.png', 25, 40000, 75000, 0, '2020-04-19 19:31:21'),
(14, 5, '502', 'Pantalón chino gris clásico', 'vistas/img/productos/502/5021.png', 15, 40000, 75000, 0, '2020-04-19 19:31:21'),
(15, 5, '503', 'Leggins efecto cuero', 'vistas/img/productos/503/5031.png', 14, 19000, 38000, 0, '2020-04-19 19:31:21'),
(16, 6, '601', 'Conjunto deportivo negro básico', 'vistas/img/productos/601/6011.png', 26, 68000, 90000, 0, '2020-04-19 19:31:21'),
(17, 6, '602', 'Conjunto deportivo gris básico', 'vistas/img/productos/602/6021.png', 26, 68000, 90000, 0, '2020-04-19 19:31:21'),
(18, 7, '701', 'Mini-falda gris lentejuelas', 'vistas/img/productos/701/7011.png', 29, 23000, 50000, 1, '2020-05-12 01:25:06'),
(19, 7, '702', 'Falda larga negra pretina dorada', 'vistas/img/productos/702/7021.png', 22, 26000, 50000, 1, '2020-05-12 01:25:06'),
(20, 8, '801', 'Short blanco rayas verticales negras', 'vistas/img/productos/801/8011.png', 13, 30000, 60000, 1, '2020-05-12 01:25:06'),
(21, 8, '802', 'Short palo rosa tirantes', 'vistas/img/productos/802/8021.png', 11, 28000, 58000, 3, '2020-05-12 16:05:10'),
(22, 9, '901', 'Bolso tela jean vintage', 'vistas/img/productos/901/9011.png', 0, 40000, 88000, 4, '2020-07-02 03:40:56'),
(23, 9, '902', 'Cartera cruzada vintage', 'vistas/img/productos/902/9021.png', 0, 25000, 50000, 4, '2020-07-02 03:40:56'),
(24, 9, '903', 'Collar manzana lentejuelas', 'vistas/img/productos/903/9031.png', 1, 10000, 20000, 4, '2020-07-02 03:40:56'),
(25, 10, '1001', 'Conjunto lencería azul oscuro encaje', 'vistas/img/productos/1001/10011.png', 4, 22000, 50000, 6, '2020-07-02 03:40:56'),
(26, 10, '1002', 'Conjunto lencería salmón encaje', 'vistas/img/productos/1002/10021.png', 1, 22000, 50000, 9, '2020-07-02 03:40:56'),
(27, 10, '1003', 'Conjunto lencería vinotinto encaje', 'vistas/img/productos/1003/450.png', 5, 22000, 50000, 5, '2020-07-02 03:40:56');

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
(60, 'juan camargo', 'juan', '$2a$07$asxx54ahjppf45sd87a5autw.4yNdImQJRLqgBgdz.SUvmpgr3Wau', 'Administrador', 'vistas/img/usuarios/juan/146.jpg', 1, '2020-07-01 22:40:20', '2020-07-02 03:40:20'),
(61, 'sofia perez', 'sofia', '$2a$07$asxx54ahjppf45sd87a5autw.4yNdImQJRLqgBgdz.SUvmpgr3Wau', 'Vendedor', 'vistas/img/usuarios/sofia/235.jpg', 1, '0000-00-00 00:00:00', '2020-07-01 23:18:06'),
(62, 'jorge cuesta', 'jorge', '$2a$07$asxx54ahjppf45sd87a5autw.4yNdImQJRLqgBgdz.SUvmpgr3Wau', 'Especial', 'vistas/img/usuarios/jorge/463.jpg', 1, '0000-00-00 00:00:00', '2020-07-01 23:18:06');

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
(39, 10001, 3, 60, '[{\"id\":\"27\",\"descripcion\":\"Conjunto lencería vinotinto encaje\",\"cantidad\":\"1\",\"stock\":\"6\",\"precio\":\"50000\",\"total\":\"50000\"},{\"id\":\"26\",\"descripcion\":\"Conjunto lencería salmón encaje\",\"cantidad\":\"1\",\"stock\":\"2\",\"precio\":\"50000\",\"total\":\"50000\"},{\"id\":\"25\",\"descripcion\":\"Conjunto lencería azul oscuro encaje\",\"cantidad\":\"1\",\"stock\":\"5\",\"precio\":\"50000\",\"total\":\"50000\"}]', 28500, 150000, 178500, 'Efectivo', '2020-07-01 23:19:07'),
(40, 10002, 4, 60, '[{\"id\":\"27\",\"descripcion\":\"Conjunto lencería vinotinto encaje\",\"cantidad\":\"1\",\"stock\":\"5\",\"precio\":\"50000\",\"total\":\"50000\"},{\"id\":\"26\",\"descripcion\":\"Conjunto lencería salmón encaje\",\"cantidad\":\"1\",\"stock\":\"1\",\"precio\":\"50000\",\"total\":\"50000\"},{\"id\":\"25\",\"descripcion\":\"Conjunto lencería azul oscuro encaje\",\"cantidad\":\"1\",\"stock\":\"4\",\"precio\":\"50000\",\"total\":\"50000\"},{\"id\":\"24\",\"descripcion\":\"Collar manzana lentejuelas\",\"cantidad\":\"1\",\"stock\":\"1\",\"precio\":\"20000\",\"total\":\"20000\"},{\"id\":\"23\",\"descripcion\":\"Cartera cruzada vintage\",\"cantidad\":\"1\",\"stock\":\"0\",\"precio\":\"50000\",\"total\":\"50000\"},{\"id\":\"22\",\"descripcion\":\"Bolso tela jean vintage\",\"cantidad\":\"1\",\"stock\":\"0\",\"precio\":\"88000\",\"total\":\"88000\"}]', 58520, 308000, 366520, 'Efectivo', '2020-07-02 03:40:57');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
