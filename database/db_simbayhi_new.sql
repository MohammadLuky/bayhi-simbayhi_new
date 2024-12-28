-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Des 2024 pada 06.56
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
-- Struktur dari tabel `simbayhi_data_santri`
--

CREATE TABLE `simbayhi_data_santri` (
  `id_data_santri` bigint(20) NOT NULL,
  `nama_santri` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `kelas_santri` varchar(10) NOT NULL,
  `jenjang_santri` varchar(100) NOT NULL,
  `program_santri` varchar(50) NOT NULL,
  `tahun_masuk` int(11) NOT NULL,
  `status_santri` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `simbayhi_data_santri`
--

INSERT INTO `simbayhi_data_santri` (`id_data_santri`, `nama_santri`, `jenis_kelamin`, `kelas_santri`, `jenjang_santri`, `program_santri`, `tahun_masuk`, `status_santri`) VALUES
(80, 'Coba Santri', 'Laki-Laki', 'XII_2', 'SMA', '', 0, 1),
(19016451530, 'MARIYAH ROSYID', 'Perempuan', 'XII_3', 'SMA', '', 0, 1),
(23035342287, 'MUHAMMAD YAZID ZAIDHANI', 'Laki-Laki', 'XI_1', 'SMA', '', 0, 1),
(24017512485, 'KHAIRUNNISA NAILAH EL-HUSNA ', 'Perempuan', 'VIID', 'SMP', '', 0, 1),
(24019842557, 'Raditya Caesar putra pradana', 'Laki-laki', 'VIIB', 'SMP', '', 0, 1),
(24027792458, 'MOCH. FIKO NUR FADILLAH', 'Laki-Laki', 'X_DKV', 'SMK', '', 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `simbayhi_data_subakun_induk`
--

CREATE TABLE `simbayhi_data_subakun_induk` (
  `id_subakun_induk` bigint(20) NOT NULL,
  `akun_induk_id` int(11) NOT NULL,
  `subakun_id` bigint(20) NOT NULL,
  `subakun_jadi_induk` int(11) NOT NULL,
  `nomor_subakun_id` int(11) NOT NULL,
  `kode_subakun` varchar(20) NOT NULL,
  `nama_subakun` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `simbayhi_data_subakun_induk`
--

INSERT INTO `simbayhi_data_subakun_induk` (`id_subakun_induk`, `akun_induk_id`, `subakun_id`, `subakun_jadi_induk`, `nomor_subakun_id`, `kode_subakun`, `nama_subakun`) VALUES
(11, 1, 0, 1, 1, '1.1', 'ASET LANCAR'),
(12, 1, 0, 0, 1, '1.2', 'INVESTASI JANGKA PANJANG'),
(13, 1, 0, 1, 1, '1.3', 'ASET TETAP'),
(14, 1, 0, 1, 1, '1.4', 'AKUMULASI PENYUSUTAN'),
(21, 2, 0, 1, 1, '2.1', 'KEWAJIBAN LANCAR'),
(31, 3, 0, 1, 1, '3.1', 'MODAL SENDIRI'),
(32, 3, 0, 1, 1, '3.2', 'BANTUAN PEMERINTAH'),
(33, 3, 0, 1, 1, '3.3', 'LABA TAHUN BERJALAN'),
(41, 4, 0, 1, 1, '4.1', 'PENDAPATAN PENYELENGGARAAN PENDIDIKAN'),
(42, 4, 0, 1, 1, '4.2', 'PENDAPATAN DI LUAR PENYELENGGARA PENDIDIKAN'),
(43, 4, 0, 1, 1, '4.3', 'PENDAPATAN LAIN -LAIN'),
(51, 5, 0, 1, 1, '5.1', 'BELANJA PEGAWAI'),
(52, 5, 0, 1, 1, '5.2', 'BELANJA BARANG'),
(53, 5, 0, 1, 1, '5.3', 'BELANJA OPERASIONAL'),
(54, 5, 0, 1, 1, '5.4', 'BELANJA MODAL'),
(55, 5, 0, 1, 1, '5.5', 'BELANJA PEMELIHARAAN'),
(56, 5, 0, 1, 1, '5.6', 'BIAYA LAIN-LAIN'),
(57, 5, 0, 0, 1, '5.7', 'JARIYAH PESANTREN'),
(58, 5, 0, 1, 1, '5.8', 'BELANJA PROGRAM'),
(111, 1, 11, 1, 2, '1.1.1', 'KAS DAN SETARA KAS'),
(112, 1, 11, 1, 2, '1.1.2', 'INVESTASI LANCAR'),
(113, 1, 11, 1, 2, '1.1.3', 'PIUTANG'),
(114, 1, 11, 1, 2, '1.1.4', 'DEPOSITO'),
(131, 1, 13, 0, 2, '1.3.1', 'TANAH'),
(132, 1, 13, 1, 2, '1.3.2', 'BANGUNAN'),
(133, 1, 13, 0, 2, '1.3.3', 'MEBELAIR'),
(134, 1, 13, 1, 2, '1.3.4', 'KENDARAAN'),
(135, 1, 13, 1, 2, '1.3.5', 'INVENTARIS YAYASAN'),
(136, 1, 13, 0, 2, '1.3.6', 'INVENTARIS SMP'),
(137, 1, 13, 0, 2, '1.3.7', 'INVENTARIS SMK'),
(138, 1, 13, 0, 2, '1.3.8', 'INVENTARIS SMA'),
(139, 1, 13, 0, 2, '1.3.9', 'INVENTARIS PONDOK'),
(141, 1, 14, 0, 2, '1.4.1', 'Akumulasi Penyusutan Tanah'),
(142, 1, 14, 0, 2, '1.4.2', 'Akumulasi Penyusutan Bangunan'),
(143, 1, 14, 0, 2, '1.4.3', 'Akumulasi Penyusutan Meubelair'),
(144, 1, 14, 1, 2, '1.4.4', 'AKUMULASI PENYUSUTAN KENDARAAN'),
(145, 1, 14, 0, 2, '1.4.5', 'Akumulasi Penyusutan Inventaris Yayasan'),
(146, 1, 14, 0, 2, '1.4.6', 'Akumulasi Penyusutan Inventaris SMP'),
(147, 1, 14, 0, 2, '1.4.7', 'Akumulasi Penyusutan Inventaris SMK'),
(148, 1, 14, 0, 2, '1.4.8', 'Akumulasi Penyusutan Inventaris Ponpes'),
(211, 2, 21, 1, 2, '2.1.1', 'HUTANG LANCAR'),
(311, 3, 31, 0, 2, '3.1.1', 'MODAL SENDIRI'),
(321, 3, 32, 0, 2, '3.2.1', 'DANA SEKOLAH BERBASIS PESANTREN (SBP)'),
(322, 3, 32, 0, 2, '3.2.2', 'DANA RUANG KELAS BARU (RKB)'),
(323, 3, 32, 0, 2, '3.2.3', 'DANA BOS APBN SMP'),
(324, 3, 32, 0, 2, '3.2.4', 'DANA BOS APBD SMP'),
(325, 3, 32, 0, 2, '3.2.5', 'DANA BOS APBN SMK'),
(326, 3, 32, 0, 2, '3.2.6', 'DANA BOS APBD SMK'),
(327, 3, 32, 0, 2, '3.2.7', 'DANA BOS APBN SMA'),
(328, 3, 32, 0, 2, '3.2.8', 'DANA BOS APBD SMA'),
(329, 3, 32, 0, 2, '3.2.9', 'PENGADAAN LAB DAN ALAT PENDIDIKAN'),
(331, 3, 33, 0, 2, '3.3.1', 'IKHTISAR LABA / RUGI'),
(411, 4, 41, 1, 2, '4.1.1', 'SMP'),
(412, 4, 41, 0, 2, '4.1.2', 'SMK'),
(413, 4, 41, 1, 2, '4.1.3', 'SMA'),
(421, 4, 42, 1, 2, '4.2.1', 'BAGI HASIL BANK'),
(511, 5, 51, 0, 2, '5.1.1', 'BELANJA PEGAWAI YAYASAN'),
(512, 5, 51, 0, 2, '5.1.2', 'BELANJA PEGAWAI PONPES'),
(513, 5, 51, 0, 2, '5.1.3', 'BELANJA PEGAWAI SMP'),
(514, 5, 51, 0, 2, '5.1.4', 'BELANJA PEGAWAI SMK'),
(515, 5, 51, 0, 2, '5.1.5', 'BELANJA PEGAWAI SMA'),
(516, 5, 51, 0, 2, '5.1.6', 'BELANJA PEGAWAI MADIN'),
(517, 5, 51, 0, 2, '5.1.7', 'BELANJA PEGAWAI MASJID'),
(518, 5, 51, 1, 2, '5.1.8', 'TUNJANGAN KINERJA'),
(519, 5, 51, 0, 2, '5.1.9', 'BELANJA PEGAWAI UNIT UMUM'),
(521, 5, 52, 1, 2, '5.2.1', 'BELANJA BARANG'),
(531, 5, 53, 1, 2, '5.3.1', 'BELANJA OPERASIONAL'),
(2112, 2, 211, 0, 3, '2.1.1.2', 'HUTANG MOBIL HIACE'),
(3210, 3, 32, 0, 2, '3.2.10', 'DANA PENGHIJAUAN'),
(3211, 3, 32, 0, 2, '3.2.11', 'DANA BANTUAN SMK KOMUNITAS'),
(3212, 3, 32, 0, 2, '3.2.12', 'DANA PUSKESTREN'),
(3213, 3, 32, 0, 2, '3.2.13', 'DANA BANTUAN SMK MINI'),
(3214, 3, 32, 0, 2, '3.2.14', 'BANTUAN PERPUSTAKAAN'),
(3215, 3, 32, 0, 2, '3.2.15', 'DANA BOS APBD MADIN'),
(3216, 3, 32, 0, 2, '3.2.16', 'DANA BANTUAN PEMBANGUNAN REK BNI 23'),
(3217, 3, 32, 0, 2, '3.2.17', 'DANA BANTUAN PEMPROV'),
(3218, 3, 32, 0, 2, '3.2.18', 'DANA BANTUAN BUMN'),
(3219, 3, 32, 0, 2, '3.2.19', 'DANA BANTUAN BALAI LATIHAN KERJA KOMUNITAS (BLKK)'),
(4301, 4, 43, 0, 2, '4.3.01', 'PENDAPATAN LAIN - LAIN YAYASAN'),
(4302, 4, 43, 0, 2, '4.3.02', 'PENDAPATAN BANK SAMPAH'),
(4303, 4, 43, 0, 2, '4.3.03', 'PENDAPATAN PENAMPUNGAN RAPID TEST'),
(5401, 5, 54, 0, 2, '5.4.01', 'SARANA PRASARANA YAYASAN'),
(5402, 5, 54, 0, 2, '5.4.02', 'SARANA PRASARANA SMK'),
(5403, 5, 54, 0, 2, '5.4.03', 'SARANA PRASARANA SMP'),
(5404, 5, 54, 0, 2, '5.4.04', 'SARANA PRASARANA PESANTREN'),
(5405, 5, 54, 0, 2, '5.4.05', 'SARANA PRASARANA SMA'),
(5501, 5, 55, 0, 2, '5.5.01', 'PEMELIHARAAN GEDUNG'),
(5502, 5, 55, 0, 2, '5.5.02', 'PEMELIHARAAN KENDARAAN'),
(5503, 5, 55, 0, 2, '5.5.03', 'PEMELIHARAAN ALAT KANTOR'),
(5504, 5, 55, 0, 2, '5.5.04', 'PERBAIKAN INSTALASI LISTRIK'),
(5505, 5, 55, 0, 2, '5.5.05', 'PEMELIHARAAN MEBELAIR'),
(5601, 5, 56, 0, 2, '5.6.01', 'PENAMBAHAN SERAGAM KARYAWAN'),
(5602, 5, 56, 0, 2, '5.6.02', 'NILAMSA'),
(5603, 5, 56, 0, 2, '5.6.03', 'TALI ASIH'),
(5604, 5, 56, 0, 2, '5.6.04', 'BIAYA  ADMINISTRASI BANK'),
(5605, 5, 56, 0, 2, '5.6.05', 'BIAYA PAJAK BANK'),
(5606, 5, 56, 0, 2, '5.6.06', 'JARIYAH PESANTREN'),
(5607, 5, 56, 0, 2, '5.6.07', 'BEBAN BUNGA MOBIL'),
(5608, 5, 56, 0, 2, '5.6.08', 'BEBAN OPERASIONAL SMP NON RAPB'),
(5609, 5, 56, 0, 2, '5.6.09', 'BEBAN OPERASIONAL SMK NON RAPB'),
(5610, 5, 56, 0, 2, '5.6.10', 'BEBAN OPERASIONAL YAYASAN NON RAPB'),
(5611, 5, 56, 0, 2, '5.6.11', 'PROGRAM PENGHIJAUAN'),
(5612, 5, 56, 0, 2, '5.6.12', 'BELANJA BUKU PERPUSTAKAAN'),
(5613, 5, 56, 0, 2, '5.6.13', 'BEBAN OPERASIONAL PONPES NON RAPB'),
(5614, 5, 56, 0, 2, '5.6.14', 'BIAYA LAIN-LAIN'),
(5615, 5, 56, 0, 2, '5.6.15', 'Ba. Penyusutan Bangunan'),
(5616, 5, 56, 0, 2, '5.6.16', 'Ba. Penyusutan Avanza'),
(5617, 5, 56, 0, 2, '5.6.17', 'Ba. Penyusutan Inventaris Yayasan'),
(5618, 5, 56, 0, 2, '5.6.18', 'Ba. Penyusutan Inventaris SMK'),
(5619, 5, 56, 0, 2, '5.6.19', 'Ba. Penyusutan Inventaris SMP'),
(5620, 5, 56, 0, 2, '5.6.20', 'Ba. Penyusutan Inventaris Ponpes'),
(5621, 5, 56, 0, 2, '5.6.21', 'Ba. Penyusutan Inventaris Mebelair'),
(5622, 5, 56, 0, 2, '5.6.22', 'BIAYA PAJAK KENDARAAN'),
(5623, 5, 56, 0, 2, '5.6.23', 'BIAYA DANA TAKTIS'),
(5624, 5, 56, 0, 2, '5.6.24', 'BEBAN OPERASIONAL SMA NON RAPB'),
(5625, 5, 56, 0, 2, '5.6.25', 'BEBAN PAJAK BUMI DAN BANGUNAN'),
(5626, 5, 56, 0, 2, '5.6.26', 'BEBAN KERUGIAN PIUTANG'),
(5801, 5, 58, 0, 2, '5.8.01', 'OSIS'),
(5802, 5, 58, 0, 2, '5.8.02', 'Tes Psikologi Siswa'),
(5803, 5, 58, 0, 2, '5.8.03', 'PENDAMPINGAN PESANTREN'),
(5804, 5, 58, 0, 2, '5.8.04', 'SMK MINI'),
(5805, 5, 58, 0, 2, '5.8.05', 'LITBANG'),
(5806, 5, 58, 0, 2, '5.8.06', 'UNIT PSB'),
(5807, 5, 58, 0, 2, '5.8.07', 'SISTEM INFORMASI MANAJEMEN'),
(5808, 5, 58, 0, 2, '5.8.08', 'HRD'),
(5809, 5, 58, 0, 2, '5.8.09', 'MADIN'),
(5810, 5, 58, 0, 2, '5.8.10', 'PELATIHAN BALAI LATIHAN KERJA KOMUNITAS'),
(5811, 5, 58, 0, 2, '5.8.11', 'PENCEGAHAN DAMPAK COVID 19'),
(11101, 1, 111, 0, 3, '1.1.1.01', 'SPP TUNAI'),
(11102, 1, 111, 0, 3, '1.1.1.02', 'KAS KESEKRETARIATAN'),
(11103, 1, 111, 0, 3, '1.1.1.03', 'KAS PEMELIHARAAN'),
(11104, 1, 111, 0, 3, '1.1.1.04', 'KAS BELANJA MODAL'),
(11105, 1, 111, 0, 3, '1.1.1.05', 'SILPA YAYASAN'),
(11106, 1, 111, 0, 3, '1.1.1.06', 'SILPA SMP'),
(11107, 1, 111, 0, 3, '1.1.1.07', 'SILPA SMK & SMA'),
(11108, 1, 111, 0, 3, '1.1.1.08', 'SILPA PONPES'),
(11109, 1, 111, 0, 3, '1.1.1.09', 'SILPA MADIN'),
(11110, 1, 111, 0, 3, '1.1.1.10', 'SILPA MASJID'),
(11111, 1, 111, 0, 3, '1.1.1.11', 'BANK SYARIAH MANDIRI'),
(11112, 1, 111, 0, 3, '1.1.1.12', 'BANK MUAMALAT'),
(11113, 1, 111, 0, 3, '1.1.1.13', 'SILPA UNIT KESEHATAN'),
(11114, 1, 111, 0, 3, '1.1.1.14', 'BRI SYARIAH'),
(11115, 1, 111, 0, 3, '1.1.1.15', 'BANK SYARIAH MANDIRI (7887878778)'),
(11116, 1, 111, 0, 3, '1.1.1.16', 'KAS PENAMPUNGAN'),
(11117, 1, 111, 0, 3, '1.1.1.17', 'BNI SYARIAH 23'),
(11118, 1, 111, 0, 3, '1.1.1.18', 'BNI SYARIAH 24'),
(11119, 1, 111, 0, 3, '1.1.1.19', 'MEGA SYARIAH'),
(11120, 1, 111, 0, 3, '1.1.1.20', 'REGISTRASI DAN FORMULIR TUNAI'),
(11121, 1, 111, 0, 3, '1.1.1.21', 'SILPA OSIS'),
(11122, 1, 111, 0, 3, '1.1.1.22', 'BTN SYARIAH 7821000088'),
(11123, 1, 111, 0, 3, '1.1.1.23', 'BANK JATIM'),
(11124, 1, 111, 0, 3, '1.1.1.24', 'BANK BTN SYARIAH 7821000386'),
(11125, 1, 111, 0, 3, '1.1.1.25', 'BANK BSM 7172363665 (BLKK)'),
(11126, 1, 111, 0, 3, '1.1.1.26', 'BANK JATIM 7232000657'),
(11128, 1, 111, 0, 3, '1.1.1.28', 'BTNS VIRTUAL ACCOUNT'),
(11130, 1, 111, 0, 3, '1.1.1.30', 'BANK MANDIRI 1440020052020'),
(11201, 1, 112, 0, 3, '1.1.2.01', 'INVESTASI UNIT USAHA KOPERASI'),
(11301, 1, 113, 0, 3, '1.1.3.01', 'PIUTANG SPP SMP 2011/2012'),
(11302, 1, 113, 0, 3, '1.1.3.02', 'PIUTANG SPP SMP 2012/2013'),
(11303, 1, 113, 0, 3, '1.1.3.03', 'PIUTANG SPP SMP 2013/2014'),
(11304, 1, 113, 0, 3, '1.1.3.04', 'PIUTANG SPP SMK 2013/2014'),
(11305, 1, 113, 0, 3, '1.1.3.05', 'PIUTANG SELISIH KAS BUKU ERLANGGA 2012/2013'),
(11306, 1, 113, 1, 3, '1.1.3.06', 'PIUTANG OPERASIONAL'),
(11307, 1, 113, 1, 3, '1.1.3.07', 'BIAYA DIBAYAR DIMUKA'),
(11308, 1, 113, 0, 3, '1.1.3.08', 'PIUTANG SELISIH KAS SILPA 2013/2014'),
(11309, 1, 113, 0, 3, '1.1.3.09', 'PIUTANG KARYAWAN'),
(11310, 1, 113, 1, 3, '1.1.3.10', 'PIUTANG SILPA'),
(11311, 1, 113, 0, 3, '1.1.3.11', 'PIUTANG SPP TUNAI'),
(11312, 1, 113, 0, 3, '1.1.3.12', 'PIUTANG KARYAWAN'),
(11325, 1, 113, 0, 3, '1.1.3.25', 'SPPA OSIS'),
(11401, 1, 114, 0, 3, '1.1.4.01', 'BANK SYARIAH MANDIRI (113770858)'),
(11402, 1, 114, 0, 3, '1.1.4.02', 'BNI SYARIAH (769509456)'),
(11403, 1, 114, 0, 3, '1.1.4.03', 'BNI SYARIAH (769512131)'),
(11404, 1, 114, 0, 3, '1.1.4.04', 'BNI SYARIAH (612456378)'),
(11405, 1, 114, 0, 3, '1.1.4.05', 'BNI SYARIAH (612455658)'),
(11406, 1, 114, 0, 3, '1.1.4.06', 'BNI SYARIAH (612455319)'),
(11407, 1, 114, 0, 3, '1.1.4.07', 'BNI SYARIAH (612454803)'),
(11408, 1, 114, 0, 3, '1.1.4.08', 'BTN SYARIAH (7823001101)'),
(11409, 1, 114, 0, 3, '1.1.4.09', 'BNI SYARIAH (948203583)'),
(11410, 1, 114, 0, 3, '1.1.4.10', 'BANK SYARIAH MANDIRI (113868826)'),
(13201, 1, 132, 0, 3, '1.3.2.01', 'BANGUNAN ASRAMA PUTRA'),
(13202, 1, 132, 0, 3, '1.3.2.02', 'BANGUNAN ASRAMA PUTRI'),
(13203, 1, 132, 0, 3, '1.3.2.03', 'BANGUNAN LOUNDRY'),
(13204, 1, 132, 0, 3, '1.3.2.04', 'BANGUNAN MASJID PUTRA'),
(13205, 1, 132, 0, 3, '1.3.2.05', 'BANGUNAN MASJID PUTRI'),
(13206, 1, 132, 0, 3, '1.3.2.06', 'BANGUNAN FOOD COURT'),
(13207, 1, 132, 0, 3, '1.3.2.07', 'BANGUNAN SMP'),
(13208, 1, 132, 0, 3, '1.3.2.08', 'BANGUNAN SMA'),
(13209, 1, 132, 0, 3, '1.3.2.09', 'BISYAROH TUKANG MASJID & ASRAMA'),
(13210, 1, 132, 0, 3, '1.3.2.10', 'BISYAROH TUKANG LAIN-LAIN'),
(13211, 1, 132, 0, 3, '1.3.2.11', 'BANGUNAN ASRAMA PUTRA G'),
(13212, 1, 132, 0, 3, '1.3.2.12', 'BANGUNAN ASRAMA PUTRI H'),
(13213, 1, 132, 0, 3, '1.3.2.13', 'BANGUNAN ASRAMA PUTRA C'),
(13214, 1, 132, 0, 3, '1.3.2.14', 'BANGUNAN ASRAMA PUTRI D'),
(13215, 1, 132, 0, 3, '1.3.2.15', 'BANGUNAN ASRAMA PUTRA E'),
(13216, 1, 132, 0, 3, '1.3.2.16', 'BANGUNAN ASRAMA PUTRI F'),
(13217, 1, 132, 0, 3, '1.3.2.17', 'BANGUNAN RUMAH SAMPAH / TRASH HOUSE'),
(13218, 1, 132, 0, 3, '1.3.2.18', 'BANGUNAN UMMART'),
(13219, 1, 132, 0, 3, '1.3.2.19', 'BANGUNAN KLINIK'),
(13220, 1, 132, 0, 3, '1.3.2.20', 'BANGUNAN GAZEBO'),
(13221, 1, 132, 0, 3, '1.3.2.21', 'BANGUNAN TANDON PUTRA'),
(13222, 1, 132, 0, 3, '1.3.2.22', 'BANGUNAN TANDON PUTRI'),
(13223, 1, 132, 0, 3, '1.3.2.23', 'BANGUNAN RUANG KELAS BARU'),
(13224, 1, 132, 0, 3, '1.3.2.24', 'RUMAH GENSET TIMUR'),
(13225, 1, 132, 0, 3, '1.3.2.25', 'RUMAH GENSET BARAT'),
(13226, 1, 132, 0, 3, '1.3.2.26', 'TEMPAT PARKIR'),
(13227, 1, 132, 0, 3, '1.3.2.27', 'BANGUNAN BLKK (BALAI LATIHAN KERJA KOMUNITAS)'),
(13228, 1, 132, 0, 3, '1.3.2.28', 'BANGUNAN RUMAH KAYU'),
(13229, 1, 132, 0, 3, '1.3.2.29', 'BANGUNAN KOLAM RENANG'),
(13230, 1, 132, 0, 3, '1.3.2.30', 'BANGUNAN GEDUNG SERBA GUNA'),
(13231, 1, 132, 0, 3, '1.3.2.31', 'BANGUNAN DAPUR'),
(13232, 1, 132, 0, 3, '1.3.2.32', 'BANGUNAN JEMURAN PUTRA'),
(13233, 1, 132, 0, 3, '1.3.2.33', 'BANGUNAN JEMURAN PUTRI'),
(13401, 1, 134, 0, 3, '1.3.4.01', 'AVANZA'),
(13402, 1, 134, 0, 3, '1.3.4.02', 'HIACE'),
(13403, 1, 134, 0, 3, '1.3.4.03', 'INNOVA'),
(13404, 1, 134, 0, 3, '1.3.4.04', 'LUXIO'),
(13405, 1, 134, 0, 3, '1.3.4.05', 'HIACE PREMIO'),
(13406, 1, 134, 0, 3, '1.3.4.06', 'MOBIL AMBULANCE'),
(13501, 1, 135, 0, 3, '1.3.5.01', 'GENSET'),
(14401, 1, 144, 0, 3, '1.4.4.01', 'Avanza'),
(21101, 2, 211, 0, 3, '2.1.1.01', 'HUTANG MOBL AVANZA'),
(21102, 2, 211, 0, 3, '2.1.1.02', 'SPP LEBIH DIBAYAR'),
(21103, 2, 211, 0, 3, '2.1.1.03', 'SUMBANGAN MASJID'),
(21104, 2, 211, 0, 3, '2.1.1.04', 'SUMBANGAN PEMBANGUNAN'),
(21105, 2, 211, 0, 3, '2.1.1.05', 'SUMBANGAN QURBAN'),
(21106, 2, 211, 0, 3, '2.1.1.06', 'BIAYA REGISTRASI SANTRI BARU'),
(21107, 2, 211, 0, 3, '2.1.1.07', 'SPP TRANSFER TANPA NAMA'),
(21108, 2, 211, 0, 3, '2.1.1.08', 'TITIPAN PEMBAYARAN SPP'),
(21109, 2, 211, 0, 3, '2.1.1.09', 'HUTANG MOBIL HIACE'),
(21110, 2, 211, 0, 3, '2.1.1.10', 'HUTANG LAIN - LAIN'),
(21111, 2, 211, 0, 3, '2.1.1.11', 'TITIPAN DANA LAIN-LAIN'),
(21112, 2, 211, 0, 3, '2.1.1.12', 'SUMBANGAN MASJID PUTRI'),
(21113, 2, 211, 0, 3, '2.1.1.13', 'SELISIH LEBIH PENERIMAAN SPP TUNAI'),
(21114, 2, 211, 0, 3, '2.1.1.14', 'HUTANG PADA PIHAK KETIGA'),
(41101, 4, 411, 0, 3, '4.1.1.01', 'PENDAFTARAN SMP'),
(41102, 4, 411, 0, 3, '4.1.1.02', 'SPP SMP'),
(41103, 4, 411, 0, 3, '4.1.1.03', 'BIAYA KEGIATAN TAHUNAN SMP'),
(41104, 4, 411, 0, 3, '4.1.1.04', 'BIAYA PENGEMBANGAN PENDIDIKAN SMP'),
(41105, 4, 411, 0, 3, '4.1.1.05', 'SUMBANGAN PEMBANGUNAN PESANTREN SMP'),
(41201, 4, 411, 0, 3, '4.1.2.01', 'PENDAFTARAN SMK'),
(41202, 4, 411, 0, 3, '4.1.2.02', 'SPP SMK'),
(41203, 4, 411, 0, 3, '4.1.2.03', 'BIAYA KEGIATAN TAHUNAN SMK'),
(41204, 4, 411, 0, 3, '4.1.2.04', 'BIAYA PENGEMBANGAN PENDIDIKAN SMK'),
(41205, 4, 411, 0, 3, '4.1.2.05', 'SUMBANGAN PEMBANGUNAN PESANTREN SMK'),
(41206, 4, 411, 0, 3, '4.1.2.06', 'SERAGAM SMK'),
(41301, 4, 413, 0, 3, '4.1.3.01', 'PENDAFTARAN SMA'),
(41302, 4, 413, 0, 3, '4.1.3.02', 'SPP SMA'),
(41303, 4, 413, 0, 3, '4.1.3.03', 'BIAYA KEGIATAN TAHUNAN SMA'),
(41304, 4, 413, 0, 3, '4.1.3.04', 'BIAYA PENGEMBANGAN PENDIDIKAN SMA'),
(41305, 4, 413, 0, 3, '4.1.3.05', 'SUMBANGAN PEMBANGUNAN PESANTREN SMA'),
(41306, 4, 413, 0, 3, '4.1.3.06', 'SERAGAM SMA'),
(42101, 4, 421, 0, 3, '4.2.1.01', 'BAGI HASIL BANK SYARIAH MANDIRI'),
(42102, 4, 421, 0, 3, '4.2.1.02', 'BAGI HASIL BSM 78'),
(42103, 4, 421, 0, 3, '4.2.1.03', 'BAGI HASIL BNI SYARIAH 23 DAN 24'),
(42104, 4, 421, 0, 3, '4.2.1.04', 'BAGI HASIL BRI SYARIAH'),
(42105, 4, 421, 0, 3, '4.2.1.05', 'BAGI HASIL BTN SYARIAH'),
(42106, 4, 421, 0, 3, '4.2.1.06', 'BAGI HASIL DEPOSITO'),
(42107, 4, 421, 0, 3, '4.2.1.07', 'BAGI HASIL BANK MEGA SYARIAH'),
(51801, 5, 518, 0, 3, '5.1.8.01', 'TUNJANGAN KINERJA SMP'),
(51802, 5, 518, 0, 3, '5.1.8.02', 'TUNJANGAN KINERJA SMK'),
(51803, 5, 518, 0, 3, '5.1.8.03', 'TUNJANGAN KINERJA YAYASAN'),
(51804, 5, 518, 0, 3, '5.1.8.04', 'TUNJANGAN BERAS'),
(51805, 5, 518, 0, 3, '5.1.8.05', 'BPJS'),
(51806, 5, 518, 0, 3, '5.1.8.06', 'THR YAYASAN'),
(51807, 5, 518, 0, 3, '5.1.8.07', 'THR SMP'),
(51808, 5, 518, 0, 3, '5.1.8.08', 'THR SMK & SMA'),
(51809, 5, 518, 0, 3, '5.1.8.09', 'THR PONPES'),
(51810, 5, 518, 0, 3, '5.1.8.10', 'THR MADIN'),
(51811, 5, 518, 0, 3, '5.1.8.11', 'BPJS KETENAGAKERJAAN'),
(51812, 5, 518, 0, 3, '5.1.8.12', 'TUNJANGAN KINERJA SMA'),
(52101, 5, 521, 0, 3, '5.2.1.01', 'ATK'),
(52102, 5, 521, 0, 3, '5.2.1.02', 'ALAT DAN BAHAN KEBERSIHAN'),
(52103, 5, 521, 0, 3, '5.2.1.03', 'ALAT PERLENGKAPAN'),
(52104, 5, 521, 0, 3, '5.2.1.04', 'PANTRY (MAMIN & RAPAT)'),
(52105, 5, 521, 0, 3, '5.2.1.05', 'BELANJA SERAGAM KARYAWAN'),
(52106, 5, 521, 0, 3, '5.2.1.06', 'SERAGAM MUSRIF'),
(52107, 5, 521, 0, 3, '5.2.1.07', 'BUKU PEGANGAN SISWA'),
(52108, 5, 521, 0, 3, '5.2.1.08', 'BUKU PEGANGAN GURU'),
(52109, 5, 521, 0, 3, '5.2.1.09', 'UKS/ OBAT-OBATAN'),
(52110, 5, 521, 0, 3, '5.2.1.10', 'TRANSPORT OPERASIONAL'),
(52111, 5, 521, 0, 3, '5.2.1.11', 'SERAGAM SISWA SMP & SMK/SMA'),
(52112, 5, 521, 0, 3, '5.2.1.12', 'LKS SISWA'),
(52113, 5, 521, 0, 3, '5.2.1.13', 'ADMINISTRASI GURU'),
(52114, 5, 521, 0, 3, '5.2.1.14', 'ADMINISTRASI SISWA'),
(52115, 5, 521, 0, 3, '5.2.1.15', 'HP KEPALA MANTIQOH'),
(52116, 5, 521, 0, 3, '5.2.1.16', 'GALON SANTRI'),
(52117, 5, 521, 0, 3, '5.2.1.17', 'SERAGAM PESANTREN'),
(52118, 5, 521, 0, 3, '5.2.1.18', 'KONSUMSI RAPAT'),
(52119, 5, 521, 0, 3, '5.2.1.19', 'KONSUMSI TAMU'),
(53101, 5, 531, 0, 3, '5.3.1.01', 'PERJALANAN DINAS'),
(53102, 5, 531, 0, 3, '5.3.1.02', 'HARLAH'),
(53103, 5, 531, 0, 3, '5.3.1.03', 'SOSIALISASI'),
(53104, 5, 531, 0, 3, '5.3.1.04', 'EVENT'),
(53105, 5, 531, 0, 3, '5.3.1.05', 'STUDI BANDING'),
(53106, 5, 531, 0, 3, '5.3.1.06', 'NEXT'),
(53107, 5, 531, 0, 3, '5.3.1.07', 'PELATIHAN'),
(53108, 5, 531, 0, 3, '5.3.1.08', 'PERSIAPAN KMB'),
(53109, 5, 531, 0, 3, '5.3.1.09', 'PEMBUATAN SILABUS'),
(53110, 5, 531, 0, 3, '5.3.1.10', 'PEMBUATAN RPP'),
(53111, 5, 531, 0, 3, '5.3.1.11', 'TEACHING AID'),
(53112, 5, 531, 0, 3, '5.3.1.12', 'PRAKTIKUM IPA, SBK & PRAKARYA'),
(53113, 5, 531, 0, 3, '5.3.1.13', 'ULANGAN HARIAN'),
(53114, 5, 531, 0, 3, '5.3.1.14', 'UJIAN ENGAH SEMESTER'),
(53115, 5, 531, 0, 3, '5.3.1.15', 'UJIAN AKHIR SEMESTER'),
(53116, 5, 531, 0, 3, '5.3.1.16', 'PROGRAM KELAS IX'),
(53117, 5, 531, 0, 3, '5.3.1.17', 'TRY OUT'),
(53118, 5, 531, 0, 3, '5.3.1.18', 'BIMBEL UJIAN NASIONAL'),
(53119, 5, 531, 0, 3, '5.3.1.19', 'UJIAN AKHIR SEKOLAH'),
(53120, 5, 531, 0, 3, '5.3.1.20', 'UJIAN SEKOLAH'),
(53121, 5, 531, 0, 3, '5.3.1.21', 'UJIAN PRAKTEK'),
(53122, 5, 531, 0, 3, '5.3.1.22', 'UJIAN AGAMA'),
(53123, 5, 531, 0, 3, '5.3.1.23', 'UJIAN NASIONAL'),
(53124, 5, 531, 0, 3, '5.3.1.24', 'WISUDA'),
(53125, 5, 531, 0, 3, '5.3.1.25', 'PELAKSANAAN BIMBEL'),
(53126, 5, 531, 0, 3, '5.3.1.26', 'PELATIHAN GURU & KARYAWAN'),
(53127, 5, 531, 0, 3, '5.3.1.27', 'MGMP'),
(53128, 5, 531, 0, 3, '5.3.1.28', 'MKKS'),
(53129, 5, 531, 0, 3, '5.3.1.29', 'AGRIBISNIS'),
(53130, 5, 531, 0, 3, '5.3.1.30', 'PERJALANAN DINAS'),
(53131, 5, 531, 0, 3, '5.3.1.31', 'TRANSPORT OPERASIONAL'),
(53132, 5, 531, 0, 3, '5.3.1.32', 'STUDY TOUR'),
(53133, 5, 531, 0, 3, '5.3.1.33', 'MOS SANTRI BARU'),
(53134, 5, 531, 0, 3, '5.3.1.34', 'PSB'),
(53135, 5, 531, 0, 3, '5.3.1.35', 'OUTBOND'),
(53136, 5, 531, 0, 3, '5.3.1.36', 'EKSTRA KULIKULER'),
(53137, 5, 531, 0, 3, '5.3.1.37', 'KONSUMSI PEMBINA'),
(53138, 5, 531, 0, 3, '5.3.1.38', 'TRANSPORT PENDAMPING'),
(53139, 5, 531, 0, 3, '5.3.1.39', 'REWARD'),
(53140, 5, 531, 0, 3, '5.3.1.40', 'BEASISWA BINTANG KELAS'),
(53141, 5, 531, 0, 3, '5.3.1.41', 'HADIAH BINTANG KELAS'),
(53142, 5, 531, 0, 3, '5.3.1.42', 'SANTRI BERPRESTASI'),
(53143, 5, 531, 0, 3, '5.3.1.43', 'GURU KREATIF'),
(53144, 5, 531, 0, 3, '5.3.1.44', 'OLIMPIADE DAN LOMBA'),
(53145, 5, 531, 0, 3, '5.3.1.45', 'MIR'),
(53146, 5, 531, 0, 3, '5.3.1.46', 'PHBI/PHBN'),
(53147, 5, 531, 0, 3, '5.3.1.47', 'PAJAK'),
(53148, 5, 531, 0, 3, '5.3.1.48', 'LISTRIK'),
(53149, 5, 531, 0, 3, '5.3.1.49', 'PDAM'),
(53150, 5, 531, 0, 3, '5.3.1.50', 'TELEPON'),
(53151, 5, 531, 0, 3, '5.3.1.51', 'PADINET'),
(53152, 5, 531, 0, 3, '5.3.1.52', 'KORAN'),
(53153, 5, 531, 0, 3, '5.3.1.53', 'CATERING GURU SMP'),
(53154, 5, 531, 0, 3, '5.3.1.54', 'CATERING GURU SMK & SMA'),
(53155, 5, 531, 0, 3, '5.3.1.55', 'CATERING SANTRI'),
(53156, 5, 531, 0, 3, '5.3.1.56', 'CATERING MUSRIF'),
(53157, 5, 531, 0, 3, '5.3.1.57', 'LOUNDRY SANTRI'),
(53158, 5, 531, 0, 3, '5.3.1.58', 'LOUNDRY MUSRIF'),
(53159, 5, 531, 0, 3, '5.3.1.59', 'PRAKTEK ENTERPRENUERSHIP'),
(53160, 5, 531, 0, 3, '5.3.1.60', 'PELANTIKAN PRAMUKA'),
(53161, 5, 531, 0, 3, '5.3.1.61', 'PROMOSI BERKELANJUTAN'),
(53162, 5, 531, 0, 3, '5.3.1.62', 'TEMU KELUARGA BESAR SMK-SMA'),
(53163, 5, 531, 0, 3, '5.3.1.63', 'BELANJA BARANG TAHUNAN SMP (BUKU & SERAGAM)'),
(53164, 5, 531, 0, 3, '5.3.1.64', 'BELANJA BARANG BUKU & TAHUNAN SMK - SMA (BUKU & SERAGAM)'),
(53165, 5, 531, 0, 3, '5.3.1.65', 'BELANJA BARANG & PERLENGKAPAN UNIT PSB'),
(53167, 5, 531, 0, 3, '5.3.1.67', 'BELANJA BARANG & PERLENGKAPAN UNIT LITBANG'),
(53168, 5, 531, 0, 3, '5.3.1.68', 'BELANJA BARANG & PERLENGKAPAN UNIT KESEHATAN'),
(53169, 5, 531, 0, 3, '5.3.1.69', 'HUMAS'),
(53170, 5, 531, 0, 3, '5.3.1.70', 'PENGADAAN PANEL & KABEL INSTALASI LISTRIK'),
(53171, 5, 531, 0, 3, '5.3.1.71', 'STUDY EKSKURSI'),
(53172, 5, 531, 0, 3, '5.3.1.72', 'WORKSHOP'),
(53173, 5, 531, 0, 3, '5.3.1.73', 'HAFLAH AKHIRIS SANAH'),
(53174, 5, 531, 0, 3, '5.3.1.74', 'OUTING CLASS'),
(53175, 5, 531, 0, 3, '5.3.1.75', 'CLASS MEETING'),
(53176, 5, 531, 0, 3, '5.3.1.76', 'ALAT OLAHRAGA'),
(53177, 5, 531, 0, 3, '5.3.1.77', 'PENGAYAAN'),
(53178, 5, 531, 0, 3, '5.3.1.78', 'AKREDITASI SEKOLAH'),
(53179, 5, 531, 0, 3, '5.3.1.79', 'GALON SANTRI'),
(53180, 5, 531, 0, 3, '5.3.1.80', 'OPERASIONAL GENSET'),
(53181, 5, 531, 0, 3, '5.3.1.81', 'CATERING STAFF'),
(53182, 5, 531, 0, 3, '5.3.1.82', 'OPERASIONAL PONDOK PESANTREN'),
(53183, 5, 531, 0, 3, '5.3.1.83', 'PSIKOTES KARYAWAN DAN CALON KARYAWAN'),
(53184, 5, 531, 0, 3, '5.3.1.84', 'PROGRAM BINA LINGKUNGAN ATAU HADIAH'),
(53185, 5, 531, 0, 3, '5.3.1.85', 'PROGRAM KELAS XII'),
(53186, 5, 531, 0, 3, '5.3.1.86', 'PASSION BASE LEARNING'),
(53187, 5, 531, 0, 3, '5.3.1.87', 'BIAYA ENGLISH LANGUAGE DAY'),
(1130601, 1, 11306, 0, 4, '1.1.3.06.01', 'MEBELAIR'),
(1130602, 1, 11306, 0, 4, '1.1.3.06.01', 'BANGUNAN'),
(1130603, 1, 11306, 0, 4, '1.1.3.06.01', 'SERAGAM SANTRI'),
(1130604, 1, 11306, 0, 4, '1.1.3.06.01', 'JARIYAH PESANTREN'),
(1130701, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA YAYASAN'),
(1130702, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA PONDOK'),
(1130703, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA SMP'),
(1130704, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA SMK'),
(1130705, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA SMA'),
(1130706, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA MADIN'),
(1130707, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA MASJID'),
(1130708, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA NON APB SMK'),
(1130709, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA NON APB SMP'),
(1130710, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA PEMELIHARAAN'),
(1130711, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA BELANJA MODAL'),
(1130712, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA UNIT PSB'),
(1130713, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA UNIT KESEHATAN'),
(1130714, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA SOSIALISASI'),
(1130715, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA LITBANG'),
(1130716, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA EVENT'),
(1130717, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA SARPRAS YAYASAN'),
(1130718, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA BELANJA PROGRAM'),
(1130719, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA PEMBANGUNAN KOPERASI'),
(1130720, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA NON APB YAYASAN'),
(1130721, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA HUMAS'),
(1130722, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA BIRO KONSELING'),
(1130723, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA LAJNAH BAHASA'),
(1130724, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA HRD'),
(1130725, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA BIRO KERJASAMA'),
(1130726, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA NON APB SMA'),
(1130727, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA BLKK'),
(1130728, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA SATGAS COVID'),
(1130729, 1, 11307, 0, 4, '1.1.3.07.01', 'SPPA TPQ'),
(1131001, 1, 11310, 0, 4, '1.1.3.10.01', 'PIUTANG SILPA TAHUN 2017');

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
-- Struktur dari tabel `simbayhi_transaksi_jurnal`
--

CREATE TABLE `simbayhi_transaksi_jurnal` (
  `id_transaksi_jurnal` int(11) NOT NULL,
  `transaksi_subakun_id` int(11) NOT NULL,
  `user_jurnal_id` int(11) NOT NULL,
  `santri_transaksi_id` int(11) NOT NULL,
  `transaksi_nominal` varchar(20) NOT NULL,
  `transaksi_jumlah` int(11) NOT NULL,
  `transaksi_total` varchar(20) NOT NULL,
  `transaksi_posisi` int(11) NOT NULL,
  `jurnal_status` int(11) NOT NULL,
  `transaksi_tahun` int(11) NOT NULL,
  `transaksi_date` date NOT NULL,
  `jurnal_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(888888, 'User Coba Coba aja', 0, '888888', '$2y$10$UVv3NsTj8z0vJpcf2F8MXe.zswPVkQfbE1feZi1tvoWBP7YG5aL3G', '888888', 2, 1),
(8777667, 'Administrator IT Edit', 0, '8777667', '$2y$10$H1R3W22DursoweDiO6xpp.ssuBOYCoqb7EMYct2PFTOG24xWG7Y.C', '8777667', 1, 1);

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
-- Indeks untuk tabel `simbayhi_data_santri`
--
ALTER TABLE `simbayhi_data_santri`
  ADD PRIMARY KEY (`id_data_santri`);

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
-- Indeks untuk tabel `simbayhi_transaksi_jurnal`
--
ALTER TABLE `simbayhi_transaksi_jurnal`
  ADD PRIMARY KEY (`id_transaksi_jurnal`);

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
-- AUTO_INCREMENT untuk tabel `simbayhi_data_santri`
--
ALTER TABLE `simbayhi_data_santri`
  MODIFY `id_data_santri` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24027792459;

--
-- AUTO_INCREMENT untuk tabel `simbayhi_data_subakun_induk`
--
ALTER TABLE `simbayhi_data_subakun_induk`
  MODIFY `id_subakun_induk` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1131002;

--
-- AUTO_INCREMENT untuk tabel `simbayhi_transaksi_jurnal`
--
ALTER TABLE `simbayhi_transaksi_jurnal`
  MODIFY `id_transaksi_jurnal` int(11) NOT NULL AUTO_INCREMENT;

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
