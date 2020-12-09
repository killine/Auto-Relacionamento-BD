-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09-Dez-2020 às 05:57
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola2`
--
CREATE DATABASE IF NOT EXISTS `escola2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `escola2`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `idCargo` int(11) NOT NULL,
  `cargo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`idCargo`, `cargo`) VALUES
(1, 'professor'),
(2, 'codPed'),
(3, 'codBib'),
(4, 'codInfo'),
(5, 'codEm'),
(6, 'Diretor'),
(7, 'codRh');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargofun`
--

CREATE TABLE `cargofun` (
  `idfun` int(11) NOT NULL,
  `idCargo` int(11) NOT NULL,
  `dataEntrada` date NOT NULL,
  `dataSaida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargofun`
--

INSERT INTO `cargofun` (`idfun`, `idCargo`, `dataEntrada`, `dataSaida`) VALUES
(1, 1, '0000-00-00', NULL),
(1, 5, '2012-07-18', '2016-07-18'),
(1, 2, '2017-05-19', '0000-00-00'),
(3, 1, '2010-12-02', NULL),
(3, 7, '2019-03-20', NULL),
(3, 5, '2019-03-20', NULL),
(3, 3, '2015-05-15', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `idfun` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `dataEntrada` date NOT NULL,
  `dataSaida` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`idfun`, `nome`, `dataEntrada`, `dataSaida`) VALUES
(1, 'Amanda', '2005-05-15', NULL),
(2, 'Anderson', '2006-06-16', NULL),
(3, 'Agda', '2012-12-12', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`idCargo`);

--
-- Índices para tabela `cargofun`
--
ALTER TABLE `cargofun`
  ADD KEY `idfun` (`idfun`),
  ADD KEY `idCargo` (`idCargo`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`idfun`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cargo`
--
ALTER TABLE `cargo`
  MODIFY `idCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `idfun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cargofun`
--
ALTER TABLE `cargofun`
  ADD CONSTRAINT `cargofun_ibfk_1` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cargofun_ibfk_2` FOREIGN KEY (`idfun`) REFERENCES `funcionario` (`idfun`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
