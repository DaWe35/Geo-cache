SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `geocache`
--

-- --------------------------------------------------------

--
-- Table `coords`
--

CREATE TABLE `coords` (
  `address` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lon` float(10,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Data for `coords`
--

INSERT INTO `coords` (`address`, `lat`, `lon`) VALUES
('12 Erzsébet tér, Budapest, Hungary, 1051', 47.497765, 19.053734),
('13, Gawad Hosni St.,  2nd floor.  Abdin,, Cairo, Egypt', 30.047789, 31.243338),
('1420 K St NW, Washington, District of Columbia 20005', 38.902309, -77.032730),
('310 Andrew Higgins Dr, New Orleans, Louisiana 70130', 29.941826, -90.066330),
('41/4 Abovyan str., 0027 Yerevan, Armenia', 40.189651, 44.524796),
('540 Howard Street, San Francisco, California 94105', 37.787971, -122.397217),
('6021 Hollywood Blvd., Los Angeles, California 90028', 34.102032, -118.320892),
('A38 Hajó, Magyarország', 47.476505, 19.062984),
('A38 Hajó, Petőfi híd budai hídfő, Budapest, Hungary, 1117', 47.476505, 19.062984);

--
-- Index for `coords`
--
ALTER TABLE `coords`
  ADD PRIMARY KEY (`address`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
