-- UPDATE urun SET stokmiktari = stokmiktari + 40 WHERE id = 1  Burada Urun Alındığından Dolayı stokmiktarı ekleme yapılmışıtr
-- UPDATE urun SET stokmiktari = stokmiktari - 40 WHERE id = 1  Burada Urun Alındığından Dolayı stokmiktarı çıkartma yapılmışıtr
-- Bu Veritabanı Demodur Yeni Tablolar Eklenerek Zengileştirebilirsiniz
-- Güncelleme İşlemini Trigger İLede Yapabilirisiniz

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `uruntakip`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `calisan`
--

CREATE TABLE `calisan` (
  `id` int(11) NOT NULL,
  `ad` varchar(50) NOT NULL,
  `soyad` varchar(50) NOT NULL,
  `telefon` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `calisan`
--

INSERT INTO `calisan` (`id`, `ad`, `soyad`, `telefon`) VALUES
(1, 'IBRAHIM', 'YILDIZ', '0507053213'),
(2, 'SELIN', 'YILDIZ', '0507053214');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun`
--

CREATE TABLE `urun` (
  `id` int(11) NOT NULL,
  `urun_ad` varchar(25) NOT NULL,
  `stokmiktari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `urun`
--

INSERT INTO `urun` (`id`, `urun_ad`, `stokmiktari`) VALUES
(1, 'TELEVIZYON', 80),
(2, 'TELEFON', 15);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunfisi`
--

CREATE TABLE `urunfisi` (
  `id` int(11) NOT NULL,
  `fisiad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `urunfisi`
--

INSERT INTO `urunfisi` (`id`, `fisiad`) VALUES
(1, 'ALIM'),
(2, 'SATIM');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uruntakipsistemi`
--

CREATE TABLE `uruntakipsistemi` (
  `id` int(11) NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `calisanid` int(11) DEFAULT NULL,
  `urunid` int(11) DEFAULT NULL,
  `urunfisid` int(11) DEFAULT NULL,
  `adet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `uruntakipsistemi`
--

INSERT INTO `uruntakipsistemi` (`id`, `tarih`, `calisanid`, `urunid`, `urunfisid`, `adet`) VALUES
(1, '2020-06-09 21:00:00', 1, 1, 1, 10),
(2, '2020-06-09 21:00:00', 2, 2, 1, 50);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `calisan`
--
ALTER TABLE `calisan`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `urun`
--
ALTER TABLE `urun`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `urun_ad` (`urun_ad`);

--
-- Tablo için indeksler `urunfisi`
--
ALTER TABLE `urunfisi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fisiad` (`fisiad`);

--
-- Tablo için indeksler `uruntakipsistemi`
--
ALTER TABLE `uruntakipsistemi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calisanid` (`calisanid`),
  ADD KEY `urunid` (`urunid`),
  ADD KEY `urunfisid` (`urunfisid`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `calisan`
--
ALTER TABLE `calisan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `urun`
--
ALTER TABLE `urun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `urunfisi`
--
ALTER TABLE `urunfisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `uruntakipsistemi`
--
ALTER TABLE `uruntakipsistemi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `uruntakipsistemi`
--
ALTER TABLE `uruntakipsistemi`
  ADD CONSTRAINT `uruntakipsistemi_ibfk_1` FOREIGN KEY (`calisanid`) REFERENCES `calisan` (`id`),
  ADD CONSTRAINT `uruntakipsistemi_ibfk_2` FOREIGN KEY (`urunid`) REFERENCES `urun` (`id`),
  ADD CONSTRAINT `uruntakipsistemi_ibfk_3` FOREIGN KEY (`urunfisid`) REFERENCES `urunfisi` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
