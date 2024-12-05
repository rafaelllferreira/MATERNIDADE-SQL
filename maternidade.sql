-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/12/2024 às 00:35
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `maternidade`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `bebe`
--

CREATE TABLE `bebe` (
  `CODIGO` int(11) NOT NULL,
  `NOME` varchar(50) DEFAULT NULL,
  `PESO` float DEFAULT NULL,
  `ALTURA` float DEFAULT NULL,
  `DATA` date DEFAULT NULL,
  `CPF` int(11) DEFAULT NULL,
  `CODIGO_EQUIPE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipe_medica`
--

CREATE TABLE `equipe_medica` (
  `CODIGO_EQUIPE` int(11) NOT NULL,
  `NOME_EQUIPE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mae`
--

CREATE TABLE `mae` (
  `CPF` int(11) NOT NULL,
  `NOME` varchar(50) DEFAULT NULL,
  `ENDERECO` varchar(100) DEFAULT NULL,
  `TELEFONE` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `profissional`
--

CREATE TABLE `profissional` (
  `MATRICULA` int(11) NOT NULL,
  `NOME` varchar(20) DEFAULT NULL,
  `ESPECIALIDADE` varchar(20) DEFAULT NULL,
  `CRM` int(11) DEFAULT NULL,
  `TELEFONE` varchar(11) DEFAULT NULL,
  `CODIGO_EQUIPE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `bebe`
--
ALTER TABLE `bebe`
  ADD PRIMARY KEY (`CODIGO`),
  ADD KEY `CPF` (`CPF`),
  ADD KEY `CODIGO_EQUIPE` (`CODIGO_EQUIPE`);

--
-- Índices de tabela `equipe_medica`
--
ALTER TABLE `equipe_medica`
  ADD PRIMARY KEY (`CODIGO_EQUIPE`);

--
-- Índices de tabela `mae`
--
ALTER TABLE `mae`
  ADD PRIMARY KEY (`CPF`);

--
-- Índices de tabela `profissional`
--
ALTER TABLE `profissional`
  ADD PRIMARY KEY (`MATRICULA`),
  ADD KEY `CODIGO_EQUIPE` (`CODIGO_EQUIPE`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `bebe`
--
ALTER TABLE `bebe`
  ADD CONSTRAINT `bebe_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `mae` (`CPF`),
  ADD CONSTRAINT `bebe_ibfk_2` FOREIGN KEY (`CODIGO_EQUIPE`) REFERENCES `equipe_medica` (`CODIGO_EQUIPE`);

--
-- Restrições para tabelas `profissional`
--
ALTER TABLE `profissional`
  ADD CONSTRAINT `profissional_ibfk_1` FOREIGN KEY (`CODIGO_EQUIPE`) REFERENCES `equipe_medica` (`CODIGO_EQUIPE`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
