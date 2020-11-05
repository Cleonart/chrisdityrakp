-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2020 at 07:11 PM
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
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `dosen_id` int(30) NOT NULL,
  `fakultas_id` int(20) NOT NULL,
  `dosen_nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`dosen_id`, `fakultas_id`, `dosen_nama`) VALUES
(17013008, 1, 'Thomas Ch. Suwanto'),
(17013045, 1, 'Steven Pandelaki');

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

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `pengguna_id` int(10) NOT NULL,
  `dosen_id` int(20) NOT NULL,
  `pengguna_nama` varchar(50) NOT NULL,
  `pengguna_sandi` varchar(10) NOT NULL,
  `pengguna_status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `publikasi`
--

CREATE TABLE `publikasi` (
  `publikasi_id` int(10) NOT NULL,
  `jurnal_id` int(10) NOT NULL,
  `dosen_id` int(10) NOT NULL,
  `publikasi_status` int(10) NOT NULL,
  `publikasi_jurnal` varchar(30) NOT NULL,
  `publikasi_judul_jurnal` varchar(30) NOT NULL,
  `publikasi_volume_jurnal` varchar(20) NOT NULL,
  `publikasi_nomor_jurnal` varchar(20) NOT NULL,
  `publikasi_tahun_jurnal` date NOT NULL,
  `publikasi_dokumen` varchar(10) NOT NULL,
  `publikasi_tanggal` date NOT NULL,
  `publikasi_tanggal_ubah` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publikasi`
--

INSERT INTO `publikasi` (`publikasi_id`, `jurnal_id`, `dosen_id`, `publikasi_status`, `publikasi_jurnal`, `publikasi_judul_jurnal`, `publikasi_volume_jurnal`, `publikasi_nomor_jurnal`, `publikasi_tahun_jurnal`, `publikasi_dokumen`, `publikasi_tanggal`, `publikasi_tanggal_ubah`) VALUES
(1905, 1005, 17013008, 1, 'Realtech', 'Aplikasi Manajemen Jurnal', '29', '1', '2020-05-10', '', '2021-01-29', '2020-11-19');

-- --------------------------------------------------------

--
-- Table structure for table `publikasi_penulis`
--

CREATE TABLE `publikasi_penulis` (
  `id_publikasi_penulis` int(10) NOT NULL,
  `publikasi_id` int(10) NOT NULL,
  `dosen_id` int(10) NOT NULL,
  `publikasi_penulis_nama` varchar(30) NOT NULL,
  `publikasi_penulis_ke` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publikasi_penulis`
--

INSERT INTO `publikasi_penulis` (`id_publikasi_penulis`, `publikasi_id`, `dosen_id`, `publikasi_penulis_nama`, `publikasi_penulis_ke`) VALUES
(510, 1905, 17013008, 'Thomas Ch. Suwanto', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`dosen_id`);

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
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`pengguna_id`);

--
-- Indexes for table `publikasi`
--
ALTER TABLE `publikasi`
  ADD PRIMARY KEY (`publikasi_id`);

--
-- Indexes for table `publikasi_penulis`
--
ALTER TABLE `publikasi_penulis`
  ADD PRIMARY KEY (`id_publikasi_penulis`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
