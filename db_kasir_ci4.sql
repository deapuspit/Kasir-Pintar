-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Feb 2024 pada 03.44
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_kasir_ci4`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_jual`
--

CREATE TABLE `tbl_jual` (
  `id_jual` int(11) NOT NULL,
  `no_faktur` varchar(15) DEFAULT NULL,
  `tgl_jual` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `grand_total` int(11) DEFAULT NULL,
  `bayar` int(11) DEFAULT NULL,
  `kembali` int(11) DEFAULT NULL,
  `id_user` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_jual`
--

INSERT INTO `tbl_jual` (`id_jual`, `no_faktur`, `tgl_jual`, `jam`, `grand_total`, `bayar`, `kembali`, `id_user`) VALUES
(10, '20246240001', '2024-02-24', '13:09:45', 100000, 150000, 50000, 0),
(11, '20240250001', '2024-02-02', '07:35:14', 60000, 70000, 10000, 0),
(12, '20240250002', '2024-02-25', '07:41:09', 24400000, 50000000, 25600000, 0),
(13, '20240250003', '2024-02-08', '19:20:34', 553000, 600000, 47000, NULL),
(14, '20240250004', '2024-02-06', '19:22:00', 155000, 200000, 45000, 0),
(15, '20241260001', '2024-02-26', '04:19:08', 24376500, 25000000, 623500, 0),
(16, '20241260002', '2024-02-26', '05:09:17', 342000, 400000, 58000, 0),
(17, '20241260003', '2024-02-26', '16:33:47', 10000, 20000, 10000, NULL),
(18, '20241260004', '2024-02-26', '16:54:20', 110000, 200000, 90000, 0),
(19, '20242270001', '2024-02-27', '13:06:32', 85000, 100000, 15000, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Makanan'),
(2, 'Minuman'),
(3, 'Bumbu Masakan'),
(4, 'Elektronik'),
(5, 'Alat Tulis Kantor'),
(6, 'Aksesoris'),
(8, 'Alat dapur'),
(10, 'Aksesoris Wanita'),
(11, 'novel');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `id_produk` int(11) NOT NULL,
  `kode_produk` varchar(25) DEFAULT NULL,
  `nama_produk` varchar(150) DEFAULT NULL,
  `id_kategori` int(25) DEFAULT NULL,
  `id_satuan` int(25) DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  `harga_jual` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_produk`
--

INSERT INTO `tbl_produk` (`id_produk`, `kode_produk`, `nama_produk`, `id_kategori`, `id_satuan`, `harga_beli`, `harga_jual`, `stok`) VALUES
(2, '11112', 'Frisian Flag Kental Manis', 2, 10, 8000, 10000, 32),
(3, '11113', 'Aqua', 2, 15, 6000, 8000, 47),
(5, '11114', 'Coca Cola', 2, 15, 10000, 15000, -40),
(6, '11118', 'biskuit gandum', 1, 1, 25000, 2000, 5),
(7, '11115', 'Torpedo', 2, 2, 26000, 26500, 7),
(10, '111119', 'good day frezee', 2, 1, 30000, 31000, 12),
(11, '111120', 'ice cream paddle pop', 1, 1, 40000, 42000, -80),
(15, '1111124', 'biskuit momotaro', 1, 1, 2000, 2500, 8),
(16, '111166', 'Nabati', 1, 1, 20000, 21000, 9),
(17, '11110', 'Hilo Teen', 2, 2, 80000, 85000, 3),
(20, '1234', 'Logitech M220 Mouse Wirelles', 4, 6, 140000, 146000, 0),
(21, '12345', 'Laptop Avita Ram 4', 6, 6, 4500000, 4800000, 2),
(22, '8888166607927', 'Prima Air Mineral 330ML', 2, 1, 2500, 3000, 50),
(23, '8886008101336', 'Malkis Abon 135gr', 1, 1, 6000, 7000, 30),
(24, '8886015203115', 'Kopi Golda Latte 200ML', 2, 1, 2000, 3000, 40);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_rinci`
--

CREATE TABLE `tbl_rinci` (
  `id_rinci` int(11) NOT NULL,
  `no_faktur` varchar(15) DEFAULT NULL,
  `kode_produk` varchar(25) DEFAULT NULL,
  `modal` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `untung` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_rinci`
--

INSERT INTO `tbl_rinci` (`id_rinci`, `no_faktur`, `kode_produk`, `modal`, `harga`, `qty`, `total_harga`, `untung`) VALUES
(17, '20246240001', '11110', 35000, 40000, 1, 40000, '5000'),
(18, '20246240001', '11113', 6000, 8000, 1, 8000, '2000'),
(19, '20246240001', '11112', 8000, 10000, 5, 50000, '10000'),
(20, '20246240001', '11118', 25000, 2000, 1, 2000, '-23000'),
(21, '20240250001', '11110', 35000, 40000, 1, 40000, '5000'),
(22, '20240250001', '11118', 25000, 2000, 1, 2000, '-23000'),
(23, '20240250001', '11113', 6000, 8000, 1, 8000, '2000'),
(24, '20240250001', '11112', 8000, 10000, 1, 10000, '2000'),
(25, '20240250002', '111110', 23000000, 24000000, 1, 24000000, '1000000'),
(26, '20240250002', '12345', 300000, 400000, 1, 400000, '100000'),
(27, '20240250003', '11110', 35000, 40000, 2, 80000, '10000'),
(28, '20240250003', '12345', 300000, 400000, 1, 400000, '100000'),
(29, '20240250003', '11115', 26000, 26500, 2, 53000, '1000'),
(30, '20240250003', '11112', 8000, 10000, 2, 20000, '4000'),
(31, '20240250004', '11112', 8000, 10000, 5, 50000, '10000'),
(32, '20240250004', '111166', 20000, 21000, 5, 105000, '5000'),
(33, '20241260001', '1234', 200000, 300000, 1, 300000, '100000'),
(34, '20241260001', '12345', 23000000, 24000000, 1, 24000000, '1000000'),
(35, '20241260001', '11112', 8000, 10000, 1, 10000, '2000'),
(36, '20241260001', '11110', 35000, 40000, 1, 40000, '5000'),
(37, '20241260001', '11115', 26000, 26500, 1, 26500, '500'),
(38, '20241260002', '1234', 200000, 300000, 1, 300000, '100000'),
(39, '20241260002', '11118', 25000, 2000, 1, 2000, '-23000'),
(40, '20241260002', '11110', 35000, 40000, 1, 40000, '5000'),
(41, '20241260003', '11112', 8000, 10000, 1, 10000, '2000'),
(42, '20241260004', '11112', 8000, 10000, 2, 20000, '4000'),
(43, '20241260004', '1111124', 2000, 2500, 2, 5000, '1000'),
(44, '20241260004', '11110', 80000, 85000, 1, 85000, '5000'),
(45, '20242270001', '11110', 80000, 85000, 1, 85000, '5000');

--
-- Trigger `tbl_rinci`
--
DELIMITER $$
CREATE TRIGGER `t_rinci_jual` AFTER INSERT ON `tbl_rinci` FOR EACH ROW BEGIN
    UPDATE tbl_produk SET stok = stok - NEW.qty
    WHERE kode_produk = NEW.kode_produk;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_satuan`
--

CREATE TABLE `tbl_satuan` (
  `id_satuan` int(2) NOT NULL,
  `nama_satuan` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_satuan`
--

INSERT INTO `tbl_satuan` (`id_satuan`, `nama_satuan`) VALUES
(1, 'PCS'),
(2, 'BOX'),
(3, 'Lusin'),
(4, 'Buah'),
(5, 'KG'),
(6, 'Unit'),
(7, 'Bungkus'),
(10, 'Kaleng'),
(15, 'Liter');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(2) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `nama_user`, `email`, `password`, `level`) VALUES
(5, 'dea', 'dea123@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 1),
(6, 'agam', 'agam123@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 2),
(7, 'kasir', 'kasir123@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_jual`
--
ALTER TABLE `tbl_jual`
  ADD PRIMARY KEY (`id_jual`);

--
-- Indeks untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `tbl_rinci`
--
ALTER TABLE `tbl_rinci`
  ADD PRIMARY KEY (`id_rinci`);

--
-- Indeks untuk tabel `tbl_satuan`
--
ALTER TABLE `tbl_satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_jual`
--
ALTER TABLE `tbl_jual`
  MODIFY `id_jual` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `tbl_produk`
--
ALTER TABLE `tbl_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `tbl_rinci`
--
ALTER TABLE `tbl_rinci`
  MODIFY `id_rinci` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT untuk tabel `tbl_satuan`
--
ALTER TABLE `tbl_satuan`
  MODIFY `id_satuan` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
