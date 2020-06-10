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

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `urun`
--
ALTER TABLE `urun`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `urun_ad` (`urun_ad`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `urun`
--
ALTER TABLE `urun`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
