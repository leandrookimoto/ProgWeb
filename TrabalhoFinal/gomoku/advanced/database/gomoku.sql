-- phpMyAdmin SQL Dump
-- version 4.6.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 22, 2016 at 02:20 AM
-- Server version: 5.6.22
-- PHP Version: 5.5.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gomoku`
--

-- --------------------------------------------------------

--
-- Table structure for table `curso`
--

CREATE TABLE `curso` (
  `id` int(11) NOT NULL,
  `nome` char(45) NOT NULL,
  `sigla` char(4) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `curso`
--

INSERT INTO `curso` (`id`, `nome`, `sigla`, `descricao`) VALUES
(1, 'Sistemas de Informação', 'IE15', 'O curso de Bacharelado em Sistemas de Informação é resultado de um processo de consolidação do ensino e pesquisa em Ciência da Computação no norte do país, estando em consonância com as diretrizes estabelecidas pelo Ministério da Educação, Cultura e Desporto - MEC, também atendendo à Nova lei de Diretrizes e Bases da Educação Brasileira.'),
(2, 'Ciência da Computação', 'IE08', 'O curso de Bacharelado em Ciência da Computação é resultado de um processo de consolidação do ensino e pesquisa em Ciência da Computação no norte do país, estando em consonância com as diretrizes estabelecidas pelo Ministério da Educação - MEC, também atendendo à Nova lei de Diretrizes e Bases da Educação Brasileira.');

-- --------------------------------------------------------

--
-- Table structure for table `jogada`
--

CREATE TABLE `jogada` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_partida` int(11) DEFAULT NULL,
  `data_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `linha` int(2) DEFAULT NULL,
  `coluna` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jogada`
--

INSERT INTO `jogada` (`id`, `id_user`, `id_partida`, `data_hora`, `linha`, `coluna`) VALUES
(1, 4, 10, NULL, 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1473455738),
('m130524_201442_init', 1473455744);

-- --------------------------------------------------------

--
-- Table structure for table `partida`
--

CREATE TABLE `partida` (
  `id` int(11) NOT NULL,
  `id_user_1` int(11) DEFAULT NULL,
  `id_user_2` int(11) DEFAULT NULL,
  `vencedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `partida`
--

INSERT INTO `partida` (`id`, `id_user_1`, `id_user_2`, `vencedor`) VALUES
(10, 4, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pontuacao` int(11) DEFAULT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `id_curso` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `pontuacao`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `id_curso`) VALUES
(1, 'leandrookimoto', NULL, '58heJua9HFG9663Gx4BCIKbjvZ6m0QpA', '$2y$13$DTCwqPkDsrlFqp/FtFHu0uuq9D.VSj2.fNPQDB1eSXj2HOybBqcsO', NULL, 'leandrookimoto@gmail.com', 10, 1474037613, 1474037613, 2),
(2, 'Larissa', NULL, 'Ktw2lOmwgWnWlgJr26v04XCnsNsKg-IX', '$2y$13$q.JuVLj.DFRxM7s2qwnpqOV93DcFr/4YBvypr3Y1qf7N5zSWVRkAG', NULL, 'larissa@gmail.com', 10, 1474048550, 1474048550, 1),
(3, 'Marco', NULL, 'HmwWPawMMwklSE9NpIFFT_bK1BM3WuSQ', '$2y$13$oYOZpfGUdyu8ezq9TF4uXuYXty/ySiKQtyqUY5mzttOtT5Wgh4Duu', NULL, 'marco@gmail.com', 10, 1474048578, 1474048578, 1),
(4, 'andreokimoto', NULL, '3qZaEzxo3ro7lbNJRiP_NOoO4iFDhsK5', '$2y$13$M001BxbTfmWGsbpzgM1pDeTHpUAOqmCwOFaIxz2C688D5d1wiGIFm', NULL, 'andreokimoto@gmail.com', 10, 1474478562, 1474478562, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `a` (`nome`);

--
-- Indexes for table `jogada`
--
ALTER TABLE `jogada`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user_fk` (`id_user`),
  ADD KEY `id_partida_fk` (`id_partida`);

--
-- Indexes for table `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vencedor_fk` (`vencedor`) USING BTREE,
  ADD KEY `id_user_2_fk` (`id_user_2`) USING BTREE,
  ADD KEY `id_user_1_fk` (`id_user_1`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `password_reset_token` (`password_reset_token`),
  ADD KEY `id_curso_fk` (`id_curso`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `curso`
--
ALTER TABLE `curso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `jogada`
--
ALTER TABLE `jogada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `partida`
--
ALTER TABLE `partida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `jogada`
--
ALTER TABLE `jogada`
  ADD CONSTRAINT `id_partida` FOREIGN KEY (`id_partida`) REFERENCES `partida` (`id`),
  ADD CONSTRAINT `id_user_fk` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `partida`
--
ALTER TABLE `partida`
  ADD CONSTRAINT `id_user_1_fk` FOREIGN KEY (`id_user_1`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `id_user_2_fk` FOREIGN KEY (`id_user_2`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `vencedor_fk` FOREIGN KEY (`vencedor`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `id_curso_fk` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
