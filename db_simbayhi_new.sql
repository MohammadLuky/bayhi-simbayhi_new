-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Nov 2024 pada 09.06
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_simbayhi_new`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `simbayhi_data_akun_induk`
--

CREATE TABLE `simbayhi_data_akun_induk` (
  `id_akun_induk` int(11) NOT NULL,
  `nama_akun` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `simbayhi_data_akun_induk`
--

INSERT INTO `simbayhi_data_akun_induk` (`id_akun_induk`, `nama_akun`) VALUES
(1, 'AKTIVA'),
(2, 'PASIVA/KEWAJIBAN'),
(3, 'MODAL'),
(4, 'PENDAPATAN'),
(5, 'BIAYA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `simbayhi_data_nomor_subakun`
--

CREATE TABLE `simbayhi_data_nomor_subakun` (
  `id_nomor_subakun` int(11) NOT NULL,
  `nomor_subakun` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `simbayhi_data_nomor_subakun`
--

INSERT INTO `simbayhi_data_nomor_subakun` (`id_nomor_subakun`, `nomor_subakun`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `simbayhi_data_subakun_induk`
--

CREATE TABLE `simbayhi_data_subakun_induk` (
  `id_subakun_induk` int(11) NOT NULL,
  `akun_induk_id` int(11) NOT NULL,
  `kode_subakun` varchar(20) NOT NULL,
  `nomor_subakun_id` int(11) NOT NULL,
  `nama_subakun` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `simbayhi_role_user`
--

CREATE TABLE `simbayhi_role_user` (
  `id_role` int(11) NOT NULL,
  `nama_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `simbayhi_role_user`
--

INSERT INTO `simbayhi_role_user` (`id_role`, `nama_role`) VALUES
(1, 'Administrator'),
(2, 'Akuntan'),
(3, 'Kasir'),
(4, 'Kabag. Keuangan'),
(5, 'Admin Unit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `simbayhi_unit`
--

CREATE TABLE `simbayhi_unit` (
  `id_unit` int(11) NOT NULL,
  `nama_unit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `simbayhi_users`
--

CREATE TABLE `simbayhi_users` (
  `id_users` int(11) NOT NULL,
  `nama_pengguna` varchar(50) NOT NULL,
  `unit_kerja_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `pass_tampil` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_aktif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `simbayhi_users`
--

INSERT INTO `simbayhi_users` (`id_users`, `nama_pengguna`, `unit_kerja_id`, `username`, `password`, `pass_tampil`, `role_id`, `user_aktif`) VALUES
(8777667, 'Administrator IT Edit', 0, '8777667', '$2y$10$H1R3W22DursoweDiO6xpp.ssuBOYCoqb7EMYct2PFTOG24xWG7Y.C', '8777667', 1, 1),
(78787878, 'Staff Yayasan', 0, '78787878', '$2y$10$2IDfLzrYHpshSp11Sq1DNOzgOGO3bq5GOL3Fj8Ybbj6sWD35i4k5y', '78787878', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `simbayhi_data_akun_induk`
--
ALTER TABLE `simbayhi_data_akun_induk`
  ADD PRIMARY KEY (`id_akun_induk`);

--
-- Indeks untuk tabel `simbayhi_data_nomor_subakun`
--
ALTER TABLE `simbayhi_data_nomor_subakun`
  ADD PRIMARY KEY (`id_nomor_subakun`);

--
-- Indeks untuk tabel `simbayhi_data_subakun_induk`
--
ALTER TABLE `simbayhi_data_subakun_induk`
  ADD PRIMARY KEY (`id_subakun_induk`);

--
-- Indeks untuk tabel `simbayhi_role_user`
--
ALTER TABLE `simbayhi_role_user`
  ADD PRIMARY KEY (`id_role`);

--
-- Indeks untuk tabel `simbayhi_unit`
--
ALTER TABLE `simbayhi_unit`
  ADD PRIMARY KEY (`id_unit`);

--
-- Indeks untuk tabel `simbayhi_users`
--
ALTER TABLE `simbayhi_users`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `simbayhi_data_akun_induk`
--
ALTER TABLE `simbayhi_data_akun_induk`
  MODIFY `id_akun_induk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `simbayhi_data_nomor_subakun`
--
ALTER TABLE `simbayhi_data_nomor_subakun`
  MODIFY `id_nomor_subakun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `simbayhi_data_subakun_induk`
--
ALTER TABLE `simbayhi_data_subakun_induk`
  MODIFY `id_subakun_induk` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `simbayhi_unit`
--
ALTER TABLE `simbayhi_unit`
  MODIFY `id_unit` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `simbayhi_users`
--
ALTER TABLE `simbayhi_users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78787879;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
