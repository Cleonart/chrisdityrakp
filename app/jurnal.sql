-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2020 at 03:25 PM
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
-- Table structure for table `artikel_daftar`
--

CREATE TABLE `artikel_daftar` (
  `artikel_id` int(10) NOT NULL,
  `artikel_judul` varchar(200) NOT NULL,
  `artikel_halaman` varchar(100) NOT NULL,
  `artikel_keyword` varchar(100) DEFAULT NULL,
  `artikel_filepath` varchar(100) NOT NULL,
  `artikel_jurnal_id` int(20) NOT NULL,
  `jurnal_edisi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artikel_daftar`
--

INSERT INTO `artikel_daftar` (`artikel_id`, `artikel_judul`, `artikel_halaman`, `artikel_keyword`, `artikel_filepath`, `artikel_jurnal_id`, `jurnal_edisi_id`) VALUES
(2010160101, 'The Persistent Love in Charlotte Bronte\'s Jane Eyre', '1-13', 'Persistent,Love', 'https://ejournal.unikadelasalle.ac.id/lasallian/article/view/44', 201, 20101601),
(2010160102, 'Hubungan Status Gizi dengan Kejadian ISPA pada Balita di Wilayah Kerja Puskesmas Kendahe Kabupaten Sangihe', '64-67', 'Acute respiratory infections,Nutritional status,Toddlers', 'https://ejournal.unikadelasalle.ac.id/lasallian/article/view/107', 201, 20101601),
(2010160201, 'Pengaruh Bar Terhadap Kunjungan Tamu di Hotel IBIS Manado', '97-101', 'Bar,Guest visit,Service quality', 'https://ejournal.unikadelasalle.ac.id/lasallian/article/view/103', 201, 20101602),
(2010160202, 'Ekspolorasi Pengalaman Penderita Hipertensi Terhadap Kepatuhan Minum Obat di Wilayah Kerja Puskesmas Lansot Kota Tomohon', '93-96', 'Hypertension,Hypertension Treatment,Medication Adherence', 'https://ejournal.unikadelasalle.ac.id/lasallian/article/view/102', 201, 20101602),
(2020160101, 'Perbandingan Quality of Service Protokol Komunikasi Data pada Sistem Deteksi Asap Rokok Berbasis Internet of Things', '19-24', NULL, 'https://ejournal.unikadelasalle.ac.id/realtech/article/view/129', 202, 20201601);

-- --------------------------------------------------------

--
-- Table structure for table `artikel_penulis`
--

CREATE TABLE `artikel_penulis` (
  `artikel_id` int(15) NOT NULL,
  `id_artikel_penulis` int(10) NOT NULL,
  `nama_artikel_penulis` varchar(50) NOT NULL,
  `status_artikel_penulis` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `artikel_penulis`
--

INSERT INTO `artikel_penulis` (`artikel_id`, `id_artikel_penulis`, `nama_artikel_penulis`, `status_artikel_penulis`) VALUES
(2020160101, 301003, 'Junaidy Budi Sanger', 3),
(2020160101, 301004, 'Pether V B Romony', 1),
(2020160101, 301005, 'Lanny Sitanayah', 2),
(2010160102, 302002, 'Natalia E Rakinaung', 1),
(2010160202, 302004, 'Fierlly T B Wolff', 2),
(2010160101, 306002, 'Oktavianus Semuel', 1);

-- --------------------------------------------------------

--
-- Table structure for table `fakultas`
--

CREATE TABLE `fakultas` (
  `fakultas_id` int(10) NOT NULL,
  `fakultas_nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fakultas`
--

INSERT INTO `fakultas` (`fakultas_id`, `fakultas_nama`) VALUES
(1, 'Universitas'),
(2, 'Teknik'),
(3, 'Keperawatan'),
(4, 'Ekonomi'),
(5, 'Hukum'),
(6, 'Pertanian'),
(7, 'Pariwisata'),
(8, 'Pendidikan');

-- --------------------------------------------------------

--
-- Table structure for table `jurnal`
--

CREATE TABLE `jurnal` (
  `jurnal_id` int(10) NOT NULL,
  `jurnal_nama` varchar(20) NOT NULL,
  `jurnal_editorial_id` int(11) NOT NULL,
  `jurnal_institusi` varchar(20) NOT NULL,
  `jurnal_status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurnal`
--

INSERT INTO `jurnal` (`jurnal_id`, `jurnal_nama`, `jurnal_editorial_id`, `jurnal_institusi`, `jurnal_status`) VALUES
(201, 'Lasallian', 101001, 'Universitas', 1),
(202, 'RealTech', 101002, 'Teknik', 1),
(203, 'Innovative', 101003, 'Ekonomi', 1),
(207, 'Bapontar', 101007, 'Pariwisata', 0);

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
(201, 20101601, 16, 1, 2019, '2019-02-28'),
(201, 20101602, 16, 2, 2019, '2019-09-30'),
(202, 20201601, 16, 1, 2020, '2020-04-30');

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
(101002, 'is', 'Immanuela Saputro', 'imma123', 2),
(101003, 'ls', 'Loureine Sumual', 'loureine', 2),
(101007, 'Abc', 'Aaaannn', 'jung', 2),
(101999, 'jbs', 'Junaidy Budi Sanger', 'jbs123', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artikel_daftar`
--
ALTER TABLE `artikel_daftar`
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
