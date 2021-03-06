-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 07-10-2014 a las 01:24:19
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `retalapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gii_cruds`
--

CREATE TABLE IF NOT EXISTS `gii_cruds` (
`id` int(11) NOT NULL,
  `moduleName` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `controller` varchar(100) NOT NULL,
  `labelName` varchar(100) NOT NULL,
  `fontIcon` varchar(100) DEFAULT NULL,
  `template` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gii_models`
--

CREATE TABLE IF NOT EXISTS `gii_models` (
`id` int(11) NOT NULL,
  `tableName` varchar(100) NOT NULL,
  `modelClass` varchar(100) NOT NULL,
  `moduleName` varchar(100) NOT NULL,
  `template` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `home_home`
--

CREATE TABLE IF NOT EXISTS `home_home` (
`id` int(11) NOT NULL,
  `editor_text` text
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `home_home`
--

INSERT INTO `home_home` (`id`, `editor_text`) VALUES
(3, '{"data":[{"type":"heading","data":{"text":"Hello world!"}},{"type":"text","data":{"text":"This is a simple text of home\\n"}}]}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `settings_settings`
--

CREATE TABLE IF NOT EXISTS `settings_settings` (
`id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `keywords` text NOT NULL,
  `description` text NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `offline` tinyint(1) DEFAULT '0',
  `editor_offline_message` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `settings_settings`
--

INSERT INTO `settings_settings` (`id`, `title`, `keywords`, `description`, `admin_email`, `offline`, `editor_offline_message`) VALUES
(1, 'MY APP', 'Sitio, web', 'Sitio web de ...', 'admin@email.com', 0, '{"data":[{"type":"heading","data":{"text":"Coming Soon"}},{"type":"text","data":{"text":"Please be patient\\n"}}]}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `smpt_config`
--

CREATE TABLE IF NOT EXISTS `smpt_config` (
`id` int(11) NOT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `host_email_server` varchar(150) DEFAULT NULL,
  `port_email_server` int(4) DEFAULT NULL,
  `username_email_server` varchar(150) DEFAULT NULL,
  `password_email_server` varchar(150) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `smpt_config`
--

INSERT INTO `smpt_config` (`id`, `enabled`, `host_email_server`, `port_email_server`, `username_email_server`, `password_email_server`) VALUES
(1, 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_access_tokens`
--

CREATE TABLE IF NOT EXISTS `users_access_tokens` (
`id` int(11) NOT NULL,
  `acces_token` varchar(255) NOT NULL,
  `apps_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `acces_token_refresh` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_apps`
--

CREATE TABLE IF NOT EXISTS `users_apps` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `client_id` varchar(255) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `redirect_uri` varchar(255) DEFAULT NULL,
  `users_id` int(10) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_apps_scopes`
--

CREATE TABLE IF NOT EXISTS `users_apps_scopes` (
`id` int(11) NOT NULL,
  `apps_id` int(11) NOT NULL,
  `scopes_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_authassignment`
--

CREATE TABLE IF NOT EXISTS `users_authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_authassignment`
--

INSERT INTO `users_authassignment` (`itemname`, `userid`, `bizrule`, `data`) VALUES
('admin', '1', NULL, 'N;'),
('root', '3', NULL, 'N;'),
('subscriber', '2', NULL, 'N;');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_authitem`
--

CREATE TABLE IF NOT EXISTS `users_authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users_authitem`
--

INSERT INTO `users_authitem` (`name`, `type`, `description`, `bizrule`, `data`) VALUES
('admin', 2, 'Administrador con amplio dominio del sistema', NULL, 'N;'),
('editor', 2, 'Editor de contenido, con permisos restringidos', NULL, 'N;'),
('root', 2, 'Usuario todopoderoso =) para el developer y PM', NULL, 'N;'),
('subscriber', 2, 'Usuario registrado y principalmente enfocado a front (Cliente)', NULL, 'N;');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_authitemchild`
--

CREATE TABLE IF NOT EXISTS `users_authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_code_auth`
--

CREATE TABLE IF NOT EXISTS `users_code_auth` (
`id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_code_auth_apps_scopes`
--

CREATE TABLE IF NOT EXISTS `users_code_auth_apps_scopes` (
`id` int(11) NOT NULL,
  `apps_id` int(11) NOT NULL,
  `scopes_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_config`
--

CREATE TABLE IF NOT EXISTS `users_config` (
`id` int(11) NOT NULL,
  `labelMenu` varchar(100) DEFAULT NULL,
  `showMenuFromAdmin` tinyint(1) NOT NULL DEFAULT '1',
  `loginInRegister` tinyint(1) NOT NULL DEFAULT '0',
  `sendPassword` tinyint(1) NOT NULL DEFAULT '0',
  `enableOAuth` tinyint(1) NOT NULL DEFAULT '1',
  `allowBasicOAuth` tinyint(1) NOT NULL DEFAULT '0',
  `facebookLoginRegister` tinyint(1) NOT NULL DEFAULT '0',
  `facebookAppId` varchar(30) DEFAULT NULL,
  `facebookSecret` varchar(100) DEFAULT NULL,
  `twitterLoginRegister` tinyint(1) NOT NULL DEFAULT '0',
  `twitterAppId` varchar(30) DEFAULT NULL,
  `twitterSecret` varchar(100) DEFAULT NULL,
  `copyWelcomeEmail` text NOT NULL,
  `copyForgotEmail` text NOT NULL,
  `copySendPassword` text NOT NULL,
  `copySendPasswordForgot` text NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `users_config`
--

INSERT INTO `users_config` (`id`, `labelMenu`, `showMenuFromAdmin`, `loginInRegister`, `sendPassword`, `enableOAuth`, `allowBasicOAuth`, `facebookLoginRegister`, `facebookAppId`, `facebookSecret`, `twitterLoginRegister`, `twitterAppId`, `twitterSecret`, `copyWelcomeEmail`, `copyForgotEmail`, `copySendPassword`, `copySendPasswordForgot`) VALUES
(1, 'Usuarios', 1, 0, 0, 1, 0, 0, '', '', 0, '', '', '<p>\r\n	 Hola {{name}}<span style="background-color: initial;">! </span>\r\n</p>\r\n<p>\r\n	 <br>\r\n	  Ya casi terminamos el proceso de  registro solo falta confirmar tu correo\r\n</p>', '<p>\r\n	  Hola {{name}}! <br>\r\n	<br>\r\n	   Ya casi recuperas tu contraseña,  por favor sigue este enlace:\r\n</p>', '<p>\r\n	 Hola {{name}}! <br>\r\n	 <br>\r\n	  Esta es tu nueva contraseña:<br>\r\n	<strong>Usuario:</strong><em>{{email}}</em><br>\r\n	<strong>Password:</strong><em>{{password}}</em>\r\n</p>', '<p>\r\n	 Hola {{name}}! <br>\r\n	 <br>\r\n	  Bienvenido a {{appname}} tus datos de ingreso son:<br>\r\n	<strong>Usuario:</strong><em>{{email}}</em><br>\r\n	<strong>Password:</strong><em>{{password}}</em>\r\n</p>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_users`
--

CREATE TABLE IF NOT EXISTS `users_users` (
`id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `state_email` tinyint(1) NOT NULL DEFAULT '0',
  `img` varchar(255) DEFAULT NULL,
  `registered` datetime NOT NULL,
  `papelera` tinyint(1) NOT NULL DEFAULT '0',
  `phone` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `users_address_country_id` int(11) DEFAULT NULL,
  `users_address_state_id` int(11) DEFAULT NULL,
  `users_address_city_id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `card_identity` varchar(100) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `users_users`
--

INSERT INTO `users_users` (`id`, `password`, `email`, `name`, `lastname`, `username`, `state`, `state_email`, `img`, `registered`, `papelera`, `phone`, `mobile`, `users_address_country_id`, `users_address_state_id`, `users_address_city_id`, `address`, `birthdate`, `gender`, `card_identity`) VALUES
(1, 'd033e22ae348aeb5660fc2140aec35850c4da997', 'admin@email.com', 'Admin', 'Admin', 'admin', 1, 1, NULL, '2013-10-30 02:39:34', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '12dea96fec20593566ab75692c9949596833adc9', 'user@email.com', 'User', 'Site', 'user', 1, 1, NULL, '2014-05-30 15:04:47', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'dc76e9f0c0006e8f919e0c515c66dbba3982f785', 'root@email.com', 'Root', 'Root', 'root', 1, 1, NULL, '2014-05-30 15:04:47', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `gii_cruds`
--
ALTER TABLE `gii_cruds`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gii_models`
--
ALTER TABLE `gii_models`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `home_home`
--
ALTER TABLE `home_home`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `settings_settings`
--
ALTER TABLE `settings_settings`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `smpt_config`
--
ALTER TABLE `smpt_config`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_access_tokens`
--
ALTER TABLE `users_access_tokens`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_apps`
--
ALTER TABLE `users_apps`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_apps_scopes`
--
ALTER TABLE `users_apps_scopes`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_authassignment`
--
ALTER TABLE `users_authassignment`
 ADD PRIMARY KEY (`itemname`,`userid`);

--
-- Indices de la tabla `users_authitem`
--
ALTER TABLE `users_authitem`
 ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `users_authitemchild`
--
ALTER TABLE `users_authitemchild`
 ADD PRIMARY KEY (`parent`,`child`), ADD KEY `child` (`child`);

--
-- Indices de la tabla `users_code_auth`
--
ALTER TABLE `users_code_auth`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_code_auth_apps_scopes`
--
ALTER TABLE `users_code_auth_apps_scopes`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_config`
--
ALTER TABLE `users_config`
 ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users_users`
--
ALTER TABLE `users_users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `gii_cruds`
--
ALTER TABLE `gii_cruds`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT de la tabla `gii_models`
--
ALTER TABLE `gii_models`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `home_home`
--
ALTER TABLE `home_home`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `settings_settings`
--
ALTER TABLE `settings_settings`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `smpt_config`
--
ALTER TABLE `smpt_config`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `users_access_tokens`
--
ALTER TABLE `users_access_tokens`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT de la tabla `users_apps`
--
ALTER TABLE `users_apps`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `users_apps_scopes`
--
ALTER TABLE `users_apps_scopes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `users_code_auth`
--
ALTER TABLE `users_code_auth`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `users_code_auth_apps_scopes`
--
ALTER TABLE `users_code_auth_apps_scopes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `users_config`
--
ALTER TABLE `users_config`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `users_users`
--
ALTER TABLE `users_users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `users_authassignment`
--
ALTER TABLE `users_authassignment`
ADD CONSTRAINT `users_authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `users_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users_authitemchild`
--
ALTER TABLE `users_authitemchild`
ADD CONSTRAINT `users_authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `users_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `users_authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `users_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
