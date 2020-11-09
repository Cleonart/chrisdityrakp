-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2020 at 02:22 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jurnal`
--

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `artikel_id` int(10) NOT NULL,
  `artikel_judul` varchar(500) NOT NULL,
  `artikel_abstract` varchar(1500) NOT NULL,
  `artikel_keyword` varchar(100) DEFAULT NULL,
  `artikel_filepath` varchar(100) NOT NULL,
  `artikel_jurnal_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`artikel_id`, `artikel_judul`, `artikel_abstract`, `artikel_keyword`, `artikel_filepath`, `artikel_jurnal_id`) VALUES
(202016001, 'PERBANDINGAN QUALITY OF SERVICE PROTOKOL KOMUNIKASI DATA PADA SISTEM DETEKSI ASAP ROKOK BERBASIS INT', 'Asap rokok adalah salah satu asap beracun yang berbahaya bagi kesehatan manusia dari sisi biologis maupun sisi kimiawi. Pada penelitian ini, penulis mengimplementasikan\r\nsebuah sistem deteksi asap rokok berbasis The Internet of Things menggunakan sensor MQ135, Arduino board dan NodeMCU. Kemudian, penulis melakukan perbandingan Quality of Service dari dua protokol komunikasi data, yaitu Transmission Control Protocol dan User Datagram Protocol pada sistem tersebut. Parameter Quality of Service dibandingkan saat proses pengiriman data adalah delay dan data loss. Untuk setiap protokol, simulasi dilakukan selama 1 jam dengan pengiriman data setiap 5 detik, 10 detik, sampai 1 menit. Hasil yang diperoleh adalah data loss dengan Transmission Control Protocol lebih rendah dari pada data loss dengan User Datagram Protocol, sedangkan delay dengan User Datagram Protocol lebih rendah dari pada delay dengan Transmission Control Protocol.', NULL, 'https://ejournal.unikadelasalle.ac.id/realtech/article/view/129', 202);

-- --------------------------------------------------------

--
-- Table structure for table `artikel_penulis`
--

CREATE TABLE `artikel_penulis` (
  `id_artikel` int(10) NOT NULL,
  `id_artikel_penulis` int(10) NOT NULL,
  `nama_artikel_penulis` varchar(50) NOT NULL,
  `status_artikel_penulis` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artikel_penulis`
--

INSERT INTO `artikel_penulis` (`id_artikel`, `id_artikel_penulis`, `nama_artikel_penulis`, `status_artikel_penulis`) VALUES
(202016001, 301003, 'Junaidy Budi Sanger, S.Kom., M.Kom', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `fakultas_id` int(10) NOT NULL,
  `fakultas_nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`fakultas_id`, `fakultas_nama`) VALUES
(1, 'Teknik'),
(2, 'Keperawatan');

-- --------------------------------------------------------

--
-- Table structure for table `jurnal`
--

CREATE TABLE `jurnal` (
  `jurnal_id` int(10) NOT NULL,
  `jurnal_nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurnal`
--

INSERT INTO `jurnal` (`jurnal_id`, `jurnal_nama`) VALUES
(201, 'Lasallian'),
(202, 'RealTech');

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_edisi`
--

CREATE TABLE `jurnal_edisi` (
  `jurnal_id` int(10) NOT NULL,
  `jurnal_edisi_id` int(10) NOT NULL,
  `jurnal_edisi_volume` int(10) NOT NULL,
  `jurnal_edisi_nomor` int(10) NOT NULL,
  `jurnal_edisi_tahun` year(4) NOT NULL,
  `jurnal_edisi_publish` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurnal_edisi`
--

INSERT INTO `jurnal_edisi` (`jurnal_id`, `jurnal_edisi_id`, `jurnal_edisi_volume`, `jurnal_edisi_nomor`, `jurnal_edisi_tahun`, `jurnal_edisi_publish`) VALUES
(202, 202016, 16, 1, 2020, '2020-04-30');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `pengguna_id` int(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `pengguna_nama` varchar(50) NOT NULL,
  `pengguna_sandi` varchar(10) NOT NULL,
  `pengguna_status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`pengguna_id`, `username`, `pengguna_nama`, `pengguna_sandi`, `pengguna_status`) VALUES
(101001, 'jbs', 'Junaidy Budi Sanger', 'jbs123', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`artikel_id`);

--
-- Indexes for table `artikel_penulis`
--
ALTER TABLE `artikel_penulis`
  ADD PRIMARY KEY (`id_artikel_penulis`);

--
-- Indexes for table `fakultas`
--
ALTER TABLE `fakultas`
  ADD PRIMARY KEY (`fakultas_id`);

--
-- Indexes for table `jurnal`
--
ALTER TABLE `jurnal`
  ADD PRIMARY KEY (`jurnal_id`);

--
-- Indexes for table `jurnal_edisi`
--
ALTER TABLE `jurnal_edisi`
  ADD PRIMARY KEY (`jurnal_edisi_id`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`pengguna_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
