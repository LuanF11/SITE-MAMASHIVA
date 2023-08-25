-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Ago-2023 às 01:50
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mama_shiva`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `duvidas`
--

CREATE TABLE `duvidas` (
  `duvida_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `duvida_assunto` varchar(128) NOT NULL,
  `duvida_mensagem` varchar(1024) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `fk_usuario_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `duvidas`
--

INSERT INTO `duvidas` (`duvida_id`, `duvida_assunto`, `duvida_mensagem`, `createdAt`, `updatedAt`, `fk_usuario_id`) VALUES
('ecdf3119-037b-4003-b443-e1bdcbc07843', 'Teste de criação de dúvida', 'Testando a criação de dúvida via postman. Aparentemente, precisa ter no mínimo 64 caractéres de comprimento.', '2023-08-12 13:44:38', '2023-08-12 13:44:38', '0ee5d34f-b62f-45f9-89cb-55de3f4a1f20');

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `endereco_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `endereco_rua` varchar(128) NOT NULL,
  `endereco_numero` smallint(5) UNSIGNED NOT NULL,
  `endereco_bairro` varchar(32) NOT NULL,
  `endereco_cidade` varchar(64) NOT NULL,
  `endereco_estado` varchar(64) NOT NULL,
  `fk_usuario_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `enderecos`
--

INSERT INTO `enderecos` (`endereco_id`, `endereco_rua`, `endereco_numero`, `endereco_bairro`, `endereco_cidade`, `endereco_estado`, `fk_usuario_id`, `createdAt`, `updatedAt`) VALUES
('3cf769f7-bb9e-4c31-98d1-024ef65efe1d', 'Teste', 69, 'de criação', 'do endereço', 'POST', '0ee5d34f-b62f-45f9-89cb-55de3f4a1f20', '2023-08-12 14:09:34', '2023-08-12 14:09:34');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pratos`
--

CREATE TABLE `pratos` (
  `prato_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `prato_nome` varchar(128) NOT NULL,
  `prato_categoria` enum('ENTRADA','PRINCIPAL','BEBIDA','SOBREMESA') NOT NULL,
  `prato_descricao` varchar(256) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reservas`
--

CREATE TABLE `reservas` (
  `reserva_data` datetime NOT NULL,
  `reserva_horario` enum('07:00','08:00','09:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00') NOT NULL,
  `fk_usuario_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `reservas`
--

INSERT INTO `reservas` (`reserva_data`, `reserva_horario`, `fk_usuario_id`, `createdAt`, `updatedAt`) VALUES
('2023-12-08 00:00:00', '07:00', '0ee5d34f-b62f-45f9-89cb-55de3f4a1f20', '2023-08-12 14:50:56', '2023-08-12 14:50:56'),
('2024-12-08 00:00:00', '07:00', '0ee5d34f-b62f-45f9-89cb-55de3f4a1f20', '2023-08-12 15:06:47', '2023-08-12 15:06:47'),
('2024-12-08 00:00:00', '08:00', '0ee5d34f-b62f-45f9-89cb-55de3f4a1f20', '2023-08-12 15:06:59', '2023-08-12 15:06:59');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `usuario_cpf` char(11) NOT NULL,
  `usuario_nome` varchar(128) NOT NULL,
  `usuario_email` varchar(128) NOT NULL,
  `usuario_senha` varchar(256) NOT NULL,
  `usuario_telefone` varchar(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `usuario_cpf`, `usuario_nome`, `usuario_email`, `usuario_senha`, `usuario_telefone`, `createdAt`, `updatedAt`) VALUES
('0ee5d34f-b62f-45f9-89cb-55de3f4a1f20', '08538732312', 'create', 'create@create.com', '$2b$10$ihdybaVW860vzwRSjuw01O3btRI414LrHTjNSTx8/hwoYN6OZpP/y', '22222222222', '2023-08-12 10:14:36', '2023-08-12 10:14:36'),
('1009f29e-42dd-11ee-923f-5cc9d397497c', '06864954398', 'Teste', 'teste2@teste.com', '$2b$10$hR0DFCwQ/F7FKjSkoIEble/vcMbwsoF1Z5/rdDHaGqRUTNII3u5La', '88999999999', '2023-08-25 02:18:56', '2023-08-25 02:18:56'),
('665ac226-390e-11ee-92fe-5a5cbda0e8ac', '08538732323', 'teste', 'teste@teste.com', '$2b$10$t7sMY06XflM1ok5t4Z9.9OGI0s9rVQJoSiT7r9H69YDQQ2q/dh/56', '11111111111', '2023-08-12 14:46:37', '2023-08-12 10:49:50'),
('c21fc2dd-bddb-42c1-aa5d-47a31aa2cb89', '08538732311', 'update', 'update@update.com', '$2b$10$tZqOdNP4dsC1Il6/vUHT2OZc1qGHb8zn/qtNffi7UNlY.U6hoMoZC', '22222222222', '2023-08-12 10:25:23', '2023-08-12 10:26:15');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `duvidas`
--
ALTER TABLE `duvidas`
  ADD PRIMARY KEY (`duvida_id`),
  ADD KEY `fk_usuario_id` (`fk_usuario_id`);

--
-- Índices para tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`endereco_id`),
  ADD KEY `fk_usuario_id` (`fk_usuario_id`);

--
-- Índices para tabela `pratos`
--
ALTER TABLE `pratos`
  ADD PRIMARY KEY (`prato_id`);

--
-- Índices para tabela `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`reserva_data`,`reserva_horario`),
  ADD KEY `fk_usuario_id` (`fk_usuario_id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `usuario_cpf` (`usuario_cpf`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `duvidas`
--
ALTER TABLE `duvidas`
  ADD CONSTRAINT `duvidas_ibfk_1` FOREIGN KEY (`fk_usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limitadores para a tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`fk_usuario_id`) REFERENCES `usuarios` (`usuario_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limitadores para a tabela `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`fk_usuario_id`) REFERENCES `usuarios` (`usuario_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
