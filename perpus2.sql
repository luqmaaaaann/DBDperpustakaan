-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Jan 2022 pada 06.39
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpus2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `donatur`
--

CREATE TABLE `donatur` (
  `ID_DONATUR` char(5) NOT NULL,
  `ID_PETUGAS` int(11) DEFAULT NULL,
  `NM_DONATUR` varchar(100) DEFAULT NULL,
  `ALAMAT_DONATUR` varchar(100) DEFAULT NULL,
  `NO_TELP_DONATUR` varchar(14) DEFAULT NULL,
  `TGL_MENDONATUR` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `donatur`
--

INSERT INTO `donatur` (`ID_DONATUR`, `ID_PETUGAS`, `NM_DONATUR`, `ALAMAT_DONATUR`, `NO_TELP_DONATUR`, `TGL_MENDONATUR`) VALUES
('DT001', 1001, 'Abdur Mustofa', 'Jl. Kenari No 10, Sidoarjo, Jawa Timur', '08135826670', '2022-01-06'),
('DT002', 1002, 'Luqman Haki', 'Delta Puspa Blok J5, Sidoarjo Jawa Timur', '08766253321', '2022-01-04'),
('DT003', 1003, 'Amrina Rosyada', 'Jl. Barista Tropodo 5, Sidoarjo, Jawa Timur', '08756984437', '2022-01-05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kembali`
--

CREATE TABLE `kembali` (
  `ID_KEMBALI` char(5) NOT NULL,
  `ID_ANGGOTA` char(5) DEFAULT NULL,
  `ID_PETUGAS` int(11) DEFAULT NULL,
  `TGL_KEMBALI` date DEFAULT NULL,
  `DENDA` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `kembali`
--

INSERT INTO `kembali` (`ID_KEMBALI`, `ID_ANGGOTA`, `ID_PETUGAS`, `TGL_KEMBALI`, `DENDA`) VALUES
('008', 'AG001', 1001, '2022-01-09', 3000.00),
('011', 'AG003', 1001, '2022-01-08', 0.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `ID_PINJAM` char(5) NOT NULL,
  `ID_ANGGOTA` char(5) DEFAULT NULL,
  `ID_PETUGAS` int(11) DEFAULT NULL,
  `TGL_PINJAM` varchar(50) DEFAULT NULL,
  `batasWaktu` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`ID_PINJAM`, `ID_ANGGOTA`, `ID_PETUGAS`, `TGL_PINJAM`, `batasWaktu`) VALUES
('002', 'AG002', 1002, '2022-01-07', '2022-01-08'),
('003', 'AG003', 1001, '2022-01-07', '2022-01-08'),
('009', 'AG001', 1003, '2022-01-07', '2022-01-08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman_buku`
--

CREATE TABLE `peminjaman_buku` (
  `ID_PINJAM` char(5) NOT NULL,
  `ID_BUKU` char(5) NOT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `peminjaman_buku`
--

INSERT INTO `peminjaman_buku` (`ID_PINJAM`, `ID_BUKU`, `jumlah`) VALUES
('002', 'BK003', 2),
('003', 'BK002', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman_cd`
--

CREATE TABLE `peminjaman_cd` (
  `ID_PINJAM` char(5) NOT NULL,
  `ID_CD` char(5) NOT NULL,
  `Jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `peminjaman_cd`
--

INSERT INTO `peminjaman_cd` (`ID_PINJAM`, `ID_CD`, `Jumlah`) VALUES
('009', 'CD001', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian_buku`
--

CREATE TABLE `pengembalian_buku` (
  `ID_KEMBALI` char(5) NOT NULL,
  `ID_BUKU` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `pengembalian_buku`
--

INSERT INTO `pengembalian_buku` (`ID_KEMBALI`, `ID_BUKU`) VALUES
('008', 'BK003');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengembalian_cd`
--

CREATE TABLE `pengembalian_cd` (
  `ID_KEMBALI` char(5) NOT NULL,
  `ID_CD` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `pengembalian_cd`
--

INSERT INTO `pengembalian_cd` (`ID_KEMBALI`, `ID_CD`) VALUES
('011', 'CD003');

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `ID_PETUGAS` int(11) NOT NULL,
  `NAMA_PETUGAS` varchar(50) DEFAULT NULL,
  `NO_TELP_PETUGAS` varchar(14) DEFAULT NULL,
  `ALAMAT_PETUGAS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `petugas`
--

INSERT INTO `petugas` (`ID_PETUGAS`, `NAMA_PETUGAS`, `NO_TELP_PETUGAS`, `ALAMAT_PETUGAS`) VALUES
(1001, 'Nur Huda Riyantoni', '08463251474', 'Delta Sari Indah Blok D 200, Sidoarjo , Jawa Timur'),
(1002, 'Syahrul Ramadhan', '08135694415', 'Jl. Kamboja Blok A, Sidoarjo, Jawa Timur'),
(1003, 'Satria Wira Bakti', '0856321478', 'Jl Kepuh Permai no 20, Sidoarjo, Jawa Timur');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_anggota`
--

CREATE TABLE `tb_anggota` (
  `ID_ANGGOTA` char(5) NOT NULL,
  `NAMA_ANGGOTA` char(9) DEFAULT NULL,
  `JK_ANGGOTA` char(1) DEFAULT NULL,
  `ALAMAT_ANGGOTA` varchar(100) DEFAULT NULL,
  `NO_TELP_ANGGOTA` varchar(14) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_anggota`
--

INSERT INTO `tb_anggota` (`ID_ANGGOTA`, `NAMA_ANGGOTA`, `JK_ANGGOTA`, `ALAMAT_ANGGOTA`, `NO_TELP_ANGGOTA`, `STATUS`) VALUES
('AG001', 'Syafi', 'L', 'Perumahan pondok Legi no 12, Sidoarjo, Jawa Timur', '08563149947', 'Meminjam'),
('AG002', 'Aris', 'P', 'Gayungsari Kuningan no 12, Surabaya, Jawa Timur', '08564785514', 'Meminjam'),
('AG003', 'Firnanda', 'P', 'Jl. Brigdjen Katamso Gang 4 No 2, Sidoarjo, Jawa Timur', '081346977845', 'Meminjam');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_buku`
--

CREATE TABLE `tb_buku` (
  `ID_BUKU` char(5) NOT NULL,
  `KATEGORI_BUKU` varchar(100) DEFAULT NULL,
  `PENERBIT_BUKU` varchar(100) DEFAULT NULL,
  `THN_TERBIT_BUKU` char(4) DEFAULT NULL,
  `JUMLAH_BUKU` int(11) DEFAULT NULL,
  `JUDUL_BUKU` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_buku`
--

INSERT INTO `tb_buku` (`ID_BUKU`, `KATEGORI_BUKU`, `PENERBIT_BUKU`, `THN_TERBIT_BUKU`, `JUMLAH_BUKU`, `JUDUL_BUKU`) VALUES
('BK001', 'Fiksi', 'Gramedia Pustaka Utama', '2007', 3, 'Ronggeng Dukuh Paruk'),
('BK002', 'Fiksi', 'Gramedia Pustaka Utama', '2019', 1, 'Orang-orang biasa'),
('BK003', 'Fiksi', 'Erlangga', '2016', -1, 'Keris Setan Kober: Perang Niskala Tanah Jawa'),
('BK004', 'Non Fiksi', 'Grasindo', '2016', 4, 'Sebuah Seni untuk Bersikap Bodo Amat'),
('BK005', 'Non Fiksi', 'Kompas', '2018', 3, 'Filosofi Teras');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_cd`
--

CREATE TABLE `tb_cd` (
  `ID_CD` char(5) NOT NULL,
  `JUDUL_CD` varchar(50) DEFAULT NULL,
  `PENERBIT_CD` varchar(50) DEFAULT NULL,
  `THN_RILIS` char(4) DEFAULT NULL,
  `JUMLAH_CD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_cd`
--

INSERT INTO `tb_cd` (`ID_CD`, `JUDUL_CD`, `PENERBIT_CD`, `THN_RILIS`, `JUMLAH_CD`) VALUES
('CD001', 'Gerakan 30 September', 'Cipta Publishing Tehnologi', '2000', 0),
('CD002', 'Soekarno: Indonesia merdeka', 'Graha Citra Tehnologi', '2013', 1),
('CD003', 'Guru Bangsa: Tjokroaminoto', 'Graha Citra Tehnologi', '2015', 4),
('CD004', 'Jenderal Soedirman', 'Cipta Publishing Tehnologi', '2019', 3);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `donatur`
--
ALTER TABLE `donatur`
  ADD PRIMARY KEY (`ID_DONATUR`) USING BTREE,
  ADD KEY `FK_DONATUR_MENDONATU_PETUGAS` (`ID_PETUGAS`) USING BTREE;

--
-- Indeks untuk tabel `kembali`
--
ALTER TABLE `kembali`
  ADD PRIMARY KEY (`ID_KEMBALI`) USING BTREE,
  ADD KEY `FK_KEMBALI_MELAKUKAN_TB_ANGGO` (`ID_ANGGOTA`) USING BTREE,
  ADD KEY `FK_KEMBALI_MELAYANNI_PETUGAS` (`ID_PETUGAS`) USING BTREE;

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`ID_PINJAM`) USING BTREE,
  ADD KEY `FK_PEMINJAM_MELAKUKAN_TB_ANGGO` (`ID_ANGGOTA`) USING BTREE,
  ADD KEY `FK_PEMINJAM_MELAYANI_PETUGAS` (`ID_PETUGAS`) USING BTREE;

--
-- Indeks untuk tabel `peminjaman_buku`
--
ALTER TABLE `peminjaman_buku`
  ADD PRIMARY KEY (`ID_PINJAM`,`ID_BUKU`) USING BTREE,
  ADD KEY `FK_RELATION_RELATIONS_TB_BUKU` (`ID_BUKU`) USING BTREE;

--
-- Indeks untuk tabel `peminjaman_cd`
--
ALTER TABLE `peminjaman_cd`
  ADD PRIMARY KEY (`ID_PINJAM`,`ID_CD`) USING BTREE,
  ADD KEY `FK_RELATION_RELATIONS_TB_CD` (`ID_CD`) USING BTREE;

--
-- Indeks untuk tabel `pengembalian_buku`
--
ALTER TABLE `pengembalian_buku`
  ADD PRIMARY KEY (`ID_KEMBALI`,`ID_BUKU`) USING BTREE;

--
-- Indeks untuk tabel `pengembalian_cd`
--
ALTER TABLE `pengembalian_cd`
  ADD PRIMARY KEY (`ID_KEMBALI`,`ID_CD`) USING BTREE;

--
-- Indeks untuk tabel `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`ID_PETUGAS`) USING BTREE;

--
-- Indeks untuk tabel `tb_anggota`
--
ALTER TABLE `tb_anggota`
  ADD PRIMARY KEY (`ID_ANGGOTA`) USING BTREE;

--
-- Indeks untuk tabel `tb_buku`
--
ALTER TABLE `tb_buku`
  ADD PRIMARY KEY (`ID_BUKU`) USING BTREE;

--
-- Indeks untuk tabel `tb_cd`
--
ALTER TABLE `tb_cd`
  ADD PRIMARY KEY (`ID_CD`) USING BTREE;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `donatur`
--
ALTER TABLE `donatur`
  ADD CONSTRAINT `FK_DONATUR_MENDONATU_PETUGAS` FOREIGN KEY (`ID_PETUGAS`) REFERENCES `petugas` (`ID_PETUGAS`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
