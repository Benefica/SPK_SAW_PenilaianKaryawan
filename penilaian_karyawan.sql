-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Des 2023 pada 03.53
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penilaian_karyawan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `akun`
--

CREATE TABLE `akun` (
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `role` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `akun`
--

INSERT INTO `akun` (`username`, `password`, `role`) VALUES
('admin', 'admin123', 'admin'),
('admin1', 'admin1', 'admin'),
('manajer', 'manajer123', 'manajer');

-- --------------------------------------------------------

--
-- Struktur dari tabel `bobot_kriteria`
--

CREATE TABLE `bobot_kriteria` (
  `id` int(1) NOT NULL,
  `kriteria_1` int(11) NOT NULL,
  `kriteria_2` int(11) NOT NULL,
  `kriteria_3` int(11) NOT NULL,
  `kriteria_4` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bobot_kriteria`
--

INSERT INTO `bobot_kriteria` (`id`, `kriteria_1`, `kriteria_2`, `kriteria_3`, `kriteria_4`) VALUES
(1, 50, 20, 20, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_karyawan`
--

CREATE TABLE `data_karyawan` (
  `id_karyawan` varchar(10) NOT NULL,
  `nama_karyawan` varchar(50) NOT NULL,
  `kontak` varchar(15) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `data_karyawan`
--

INSERT INTO `data_karyawan` (`id_karyawan`, `nama_karyawan`, `kontak`, `alamat`) VALUES
('KRY001', 'Budianto', '08123321312', 'Depok Jabar');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil_perhitungan`
--

CREATE TABLE `hasil_perhitungan` (
  `alternatif` varchar(5) NOT NULL,
  `nama_karyawan` varchar(50) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `hasil_perhitungan`
--

INSERT INTO `hasil_perhitungan` (`alternatif`, `nama_karyawan`, `nilai`) VALUES
('A1', 'Budianto', 100),
('A2', 'Budianto', 95),
('A3', 'Budianto', 96.6667),
('A4', 'Budianto', 88.3333),
('A5', 'Budianto', 96.6667),
('A6', 'Budianto', 88.3333),
('A7', 'Budianto', 96.6667);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian_alternatif`
--

CREATE TABLE `penilaian_alternatif` (
  `id_karyawan` varchar(10) NOT NULL,
  `nama_karyawan` varchar(50) NOT NULL,
  `alternatif` varchar(5) NOT NULL,
  `c1` int(11) NOT NULL,
  `c2` int(11) NOT NULL,
  `c3` int(11) NOT NULL,
  `c4` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penilaian_alternatif`
--

INSERT INTO `penilaian_alternatif` (`id_karyawan`, `nama_karyawan`, `alternatif`, `c1`, `c2`, `c3`, `c4`) VALUES
('KRY001', 'Budianto', 'A1', 100, 75, 80, 60),
('KRY001', 'Budianto', 'A2', 100, 75, 60, 60),
('KRY001', 'Budianto', 'A3', 100, 75, 80, 40),
('KRY001', 'Budianto', 'A4', 100, 75, 60, 20),
('KRY001', 'Budianto', 'A5', 100, 75, 80, 40),
('KRY001', 'Budianto', 'A6', 100, 75, 60, 20),
('KRY001', 'Budianto', 'A7', 100, 75, 80, 40);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `data_karyawan`
--
ALTER TABLE `data_karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indeks untuk tabel `hasil_perhitungan`
--
ALTER TABLE `hasil_perhitungan`
  ADD PRIMARY KEY (`alternatif`);

--
-- Indeks untuk tabel `penilaian_alternatif`
--
ALTER TABLE `penilaian_alternatif`
  ADD PRIMARY KEY (`alternatif`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
