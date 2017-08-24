-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2017 at 02:21 PM
-- Server version: 10.1.22-MariaDB
-- PHP Version: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `usbong_store_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `product_type_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `previous_price` varchar(30) DEFAULT NULL,
  `language` varchar(20) DEFAULT 'English',
  `author` varchar(50) DEFAULT NULL,
  `supplier` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `image_location` varchar(30) DEFAULT NULL,
  `format` varchar(10) DEFAULT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `translator` varchar(50) DEFAULT NULL,
  `pages` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `merchant_id`, `product_type_id`, `name`, `price`, `previous_price`, `language`, `author`, `supplier`, `description`, `image_location`, `format`, `quantity_in_stock`, `translator`, `pages`) VALUES
(1, 1, 2, 'The Remains of the Day', 400, NULL, 'English', 'Kazuo Ishiguro', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, '', NULL),
(2, 1, 2, 'The Daydreamer', 400, NULL, 'English', 'Ian McEwan', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', NULL),
(3, 1, 2, 'Myths to Live By', 400, NULL, 'English', 'Joseph Campbell', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', NULL),
(4, 1, 2, 'The Seasons of a Man\'s Life', 500, NULL, 'English', 'Daniel Levinson et al.', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', NULL),
(5, 1, 2, 'The Last Lecture', 400, NULL, 'English', 'Randy Pausch et al.', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', NULL),
(6, 1, 2, 'The Innovators', 600, NULL, 'English', 'Walter Isaacson', NULL, 'Used - Very Good', NULL, 'Paperback', 1, '', NULL),
(7, 1, 2, 'Steve Jobs', 500, NULL, 'English', 'Walter Isaacson', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', NULL),
(8, 1, 9, 'Tokyo University\'s English', 1000, NULL, 'Japanese/English', 'Masafumi Satou', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, '', NULL),
(9, 1, 2, 'Siddhartha', 300, NULL, 'English', 'Hermann Hesse', NULL, 'Used - Very Good', NULL, 'Paperback', 1, '', NULL),
(10, 1, 2, 'The Montessori Method', 400, NULL, 'English', 'Maria Montessori', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', NULL),
(11, 1, 2, 'The Soul of a New Machine', 400, NULL, 'English', 'Tracy Kidder', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, '', NULL),
(12, 1, 2, 'Outliers: The Story of Success', 400, NULL, 'English', 'Malcolm Gladwell', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, '', NULL),
(13, 1, 2, 'Guns, Germs, and Steel', 500, NULL, 'English', 'Jared Diamond', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', NULL),
(14, 1, 2, 'The Tao of Pooh', 300, NULL, 'English', 'Benjamin Hoff', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', NULL),
(15, 1, 2, 'The Different Drum', 400, NULL, 'English', 'M. Scott Peck, M.D.', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', NULL),
(16, 1, 2, 'The Lives of a Cell', 300, NULL, 'English', 'Lewis Thomas', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', NULL),
(17, 1, 2, 'The Plague', 400, NULL, 'English', 'Albert Camus', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', NULL),
(18, 1, 2, 'Living Language: French', 500, NULL, 'English', 'Anne Heminway', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', NULL),
(19, 1, 2, 'Starting Point, 1979-1996', 850, NULL, 'English', 'Hayao Miyazaki', NULL, 'New', NULL, 'Paperback', 1, 'Beth Cary/Frederik L. Schodt', NULL),
(20, 1, 2, 'Turning Point, 1997-2008', 1400, NULL, 'English', 'Hayao Miyazaki', NULL, 'New', NULL, 'Hardcover', 1, 'Beth Cary/Frederik L. Schodt', NULL),
(21, 1, 2, 'Made in Japan', 400, NULL, 'English', 'Akio Morita et al.', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, 'Edwin M. Reingold/Mitsuko Shimomura', NULL),
(22, 1, 2, 'Wikinomics', 400, NULL, 'English', 'Don Tapscott/Anthony Williams', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, NULL, NULL),
(23, 1, 2, 'The Dancing Wu Li Masters', 400, NULL, 'English', 'Gary Zukav', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(24, 1, 10, 'Le Petit Prince', 400, NULL, 'French', 'Antoine de Saint-Exupéry', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(25, 1, 2, 'Founders at Work', 500, NULL, 'English', 'Jessica Livingston', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, NULL, NULL),
(26, 1, 2, 'Standard First Aid & Personal Safety', 500, NULL, 'English', 'American Red Cross', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL, NULL),
(27, 1, 9, 'HSK Level 5 Sample Exam', 1500, NULL, 'Mandarin/Japanese', 'Confucius Institute (Hanban)', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, '株式会社スプリックス', NULL),
(28, 4, 3, 'M&S Earl Grey Tea', 295, NULL, 'English', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(29, 4, 3, 'UCC Coffee (Rich Blend)', 580, NULL, 'Japanese', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(30, 4, 3, 'sencha (Green Tea)', 225, NULL, 'Japanese', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(31, 1, 5, 'PROMO-Le Petit Prince, Living Language French, The Plague', 1250, NULL, 'French/English', 'Saint-Exupéry, Heminway, Camus', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(32, 1, 5, 'PROMO-Wikinomics, Guns, Germs, and Steel, The Soul of a New Machine, The Different Drum', 1650, NULL, 'English', 'Tapscott/Williams, Diamond, Kidder, Peck', NULL, 'Used - Acceptable', NULL, 'Mixed', 1, NULL, NULL),
(33, 1, 5, 'PROMO-Made in Japan, The Soul of a New Machine, Founders at Work, Outliers', 1650, NULL, 'English', 'Morita et al., Kidder, Gladwell, Livingston', NULL, 'Used - Acceptable', NULL, 'Mixed', 1, NULL, NULL),
(34, 1, 5, 'PROMO-Starting Point, Turning Point', 2200, NULL, 'English', 'Hayao Miyazaki', NULL, 'New', NULL, 'Mixed', 1, 'Beth Cary and Frederik L. Schodt', NULL),
(35, 1, 5, 'PROMO-Steve Jobs, The Innovators', 1050, NULL, 'English', 'Walter Isaacson', NULL, 'Used - Very Good', NULL, 'Paperback', 1, NULL, NULL),
(36, 2, 6, 'ACTION COMICS 1-52 (complete set)', 8000, NULL, 'English', NULL, NULL, 'new, 1-52 + extras, VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(37, 2, 6, 'Silver Surfer vol 1 (complete set)', 32000, NULL, 'English', NULL, NULL, 'VG-F', NULL, 'Paperback', 1, NULL, NULL),
(38, 2, 6, 'Batman Superman set', 3000, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, 0),
(39, 2, 6, 'ULTIMATE FALLOUT set', 1800, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(40, 2, 6, 'KLAUS boom studios', 1200, NULL, 'English', NULL, NULL, 'complete set 1-7, VF-NM', NULL, NULL, 1, NULL, NULL),
(41, 2, 6, 'Empire of the Dead', 1500, NULL, 'English', NULL, NULL, 'VF', NULL, 'Paperback', 1, NULL, NULL),
(42, 2, 6, 'Fairest (complete set)', 4000, NULL, 'English', NULL, NULL, 'VF', NULL, 'Paperback', 1, NULL, NULL),
(43, 2, 6, 'Batman and Robin New 52 set', 6000, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(44, 1, 7, 'One Piece Manga set (1-20)', 3700, NULL, 'Japanese', NULL, NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(45, 1, 7, 'Conan Manga set (1-9)', 1665, NULL, 'Japanese', NULL, NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(46, 1, 7, 'Rurouni Kenshin Manga set (1-10)', 1850, NULL, 'Japanese', NULL, NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(47, 2, 8, 'DAREDEVIL', 800, NULL, 'English', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(48, 2, 8, 'Spider-man Marvel Toybiz 90s', 700, NULL, 'English', NULL, NULL, 'MOC', NULL, NULL, 1, NULL, NULL),
(49, 2, 8, 'Marvel Legends Wave 1 X-MEN BAF Juggernaut', 10000, NULL, 'English', NULL, NULL, 'VF-NM', NULL, NULL, 1, NULL, NULL),
(50, 1, 9, 'shimbun de manabu nihongo (with CDs)', 1900, '<strike>&#x20B1;2700</strike>', 'Japanese', 'Mizutani Osamu et al.', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL),
(51, 1, 9, 'kanzen masta- 2kyuu', 910, '<strike>&#x20B1;1296</strike>', 'Japanese', '3A Corporation', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL),
(52, 1, 9, 'kanzen masta- 1kyuu', 910, '<strike>&#x20B1;1296</strike>', 'Japanese', '3A Corporation', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL),
(53, 1, 9, 'kanji look and learn', 950, '<strike>&#x20B1;1350</strike>', 'Japanese', 'Eri Banno et al. (The Japan Times)', NULL, 'New', NULL, 'Paperback', 1, NULL, NULL),
(54, 1, 9, 'genki II 2nd ed (with CD)', 2650, '<strike>&#x20B1;3780</strike>', 'Japanese', 'Eri Banno et al. (The Japan Times)', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL),
(55, 1, 9, 'genki I 2nd ed (with CD)', 2650, '<strike>&#x20B1;3780</strike>', 'Japanese', 'Eri Banno et al. (The Japan Times)', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL),
(56, 1, 9, 'erin (with DVD) vol 3', 1820, '<strike>&#x20B1;2592</strike>', 'Japanese', 'The Japan Foundation', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL),
(57, 1, 9, 'erin (with DVD) vol 2', 1820, '<strike>&#x20B1;2592</strike>', 'Japanese', 'The Japan Foundation', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL),
(58, 1, 9, 'erin (with DVD) vol 1', 1820, '<strike>&#x20B1;2592</strike>', 'Japanese', 'The Japan Foundation', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL),
(59, 1, 2, 'kenshuui junjou monogatari', 350, NULL, 'Japanese', 'Keiichi Kawafuchi', NULL, 'New', NULL, 'Paperback', 1, NULL, NULL),
(60, 1, 2, 'Godel, Escher, Bach', 700, NULL, 'English', 'Douglas Hofstadter', NULL, 'Used - Acceptable', NULL, 'Paperback', 2, NULL, NULL),
(61, 1, 2, 'The Intelligent Investor', 550, NULL, 'English', 'Benjamin Graham', NULL, 'Used - Acceptable', NULL, 'Hardcover', 2, NULL, NULL),
(63, 1, 2, 'The Hero with a Thousand Faces', 600, NULL, 'English', 'Joseph Campbell', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(64, 1, 2, 'The Seasons of a Woman\'s Life', 500, NULL, 'English', 'Daniel Levinson et al.', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(65, 1, 2, 'A New Earth', 500, NULL, 'English', 'Eckhart Tolle', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(66, 1, 2, 'The Richest Man in Babylon', 300, NULL, 'English', 'George Clason', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(67, 1, 7, 'Full Metal Alchemist Manga set (1-27 complete)', 5700, NULL, 'Japanese', 'Hiromu Arakawa', NULL, 'Used - Very Good', NULL, 'Paperback', 1, NULL, NULL),
(68, 1, 7, 'Ranma Manga set (1-38 complete)', 7000, NULL, 'Japanese', 'Rumiko Takahashi', NULL, 'Used - Very Good', NULL, 'Paperback', 1, NULL, NULL),
(69, 1, 2, 'The Salmon of Doubt', 400, NULL, 'English', 'Douglas Adams', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(70, 1, 2, 'Banker to the Poor', 400, NULL, 'English', 'Muhammad Yunus', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(71, 1, 2, 'Delivering Happiness', 500, NULL, 'English', 'Tony Hsieh', NULL, 'Used - Acceptable', NULL, 'Hardcover', 3, NULL, NULL),
(72, 1, 9, 'software kaihatsu gijutsusha 2008 ed', 2700, NULL, 'Japanese', 'nikkei BP company', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL, NULL),
(73, 1, 2, 'Surgeons Do Not Cry', 500, NULL, 'English', 'Ting Tiongco', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL, NULL),
(74, 1, 2, 'John L Gokongwei Jr', 500, NULL, 'English', 'Marites Khanser', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL, NULL),
(75, 1, 2, 'The Millionaire Next Door', 400, NULL, 'English', 'Thomas Stanley/William Danko', NULL, 'Used - Acceptable', NULL, 'Paperback', 5, NULL, NULL),
(76, 1, 2, 'Managing in a Time of Great Change', 500, NULL, 'English', 'Peter Drucker', NULL, 'Used - Acceptable', NULL, 'Paperback', 2, NULL, NULL),
(77, 1, 2, 'Direct from Dell', 500, NULL, 'English', 'Michael Dell (with Catherine Fredman)', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL, NULL),
(78, 1, 2, 'The HP Way', 500, NULL, 'English', 'David Packard', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(79, 3, 10, 'Noong Unang Panahon', 260, NULL, 'Filipino/English', ' Rafaelita Valera/Ghani Madueño', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 32),
(80, 3, 10, 'Si Lurat, Kidhat, Pirok, ug Piyong', 260, NULL, 'Filipino/Cebuano', ' Virgilio S. Almario/Albert Gamos', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 32),
(81, 3, 10, 'Can We Live Without Trees', 310, NULL, 'English', 'May Tobias-Papa/Fran Alvarez', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 40),
(82, 3, 10, 'Florante at Laura', 360, NULL, 'Filipino', 'Francisco Balagtas/Virgilio S. Almario', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 152),
(83, 3, 10, 'Displaced', 410, NULL, 'English', 'Aneka Rodriguez/Mitzi Villavecer', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 160),
(84, 3, 10, 'Mga Tala sa Dagat', 410, NULL, 'Filipino', 'Annette Acacio Flores/Nanoy Rafael', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, 'Nanoy Rafael', 100),
(85, 3, 10, 'Ibong Adarna (Complete Text)', 410, NULL, 'Filipino', 'Virgilio S. Almario (Editor)', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 268),
(86, 3, 10, 'Si Janus Silang at ang Tiyanak ng Tabon', 335, NULL, 'Filipino', 'Edgar Calabia Samar', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 180),
(87, 3, 10, 'Si Janus Silang at ang Labanang Manananggal-Mambabarang', 360, NULL, 'Filipino', 'Edgar Calabia Samar', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 204),
(88, 3, 10, 'Buwan, Buwang Bulawan', 380, NULL, 'Filipino', 'Virgilio S. Almario/Abi Goy', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 120),
(89, 3, 6, 'Light', 410, NULL, '(wordless)', 'Rob Cham', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 114),
(90, 3, 6, 'Sixty Six', 435, NULL, 'Filipino', 'Russell Molina/Ian Sta. Maria', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 148),
(91, 3, 7, 'Si Janus Silang at ang Tiyanak ng Tabon (Manga)', 410, NULL, 'Filipino', 'Edgar Calabia Samar/Carljoe Javier/Natasha Ringor', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 125),
(92, 3, 10, 'Detective Boys of Masangkay: Ang Mangkukulam', 435, NULL, 'Filipino', 'Bernalyn Hapin Sastrillo/Borg Sinaban', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 216),
(93, 3, 10, 'Piagsugpatan: Stories of the Mandaya', 360, NULL, 'English', 'Marcy Dans Lee et al.', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 90),
(94, 3, 10, 'Si Tito Libro at Ako', 360, NULL, 'Filipino', 'Uma Krishnaswami/Nanoy Rafael/JC Galag', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, 'Nanoy Rafael', 115),
(95, 3, 10, 'Supremo', 360, NULL, 'Filipino', 'Xi Zuq/Al Estrella ', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 105),
(96, 3, 10, 'Pangkat Papaya', 360, NULL, 'English', 'Xi Zuq/Al Estrella', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 105),
(97, 3, 10, 'Ang Lihim ng San Esteban', 360, NULL, 'Filipino', 'Acacio Flores/Nanoy Rafael', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 100),
(98, 3, 10, 'Can We Live on Mars', 310, NULL, 'English', 'Gidget Jimenez/Bru', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 40),
(99, 3, 10, 'Can We Drink the Ocean', 310, NULL, 'English', 'Gidget Jimenez/Isabel Roxas', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 40),
(100, 3, 10, 'Can We Plug Into Lightning', 310, NULL, 'English', 'Gidget Jimenez/Beth Parrocha-Doctolero', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 40),
(101, 3, 10, 'Guardians of Tradition: The Gawad sa Manlilikha ng Bayan', 310, NULL, 'English', 'Mae Astrid Tobias/Rommel Joson/Renato S. Rastrollo', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 32),
(102, 3, 10, 'Handa Ako', 280, NULL, 'Filipino', 'Liwliwa Malabed/Mia Lagos', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 44),
(103, 3, 10, 'Diksiyonaryong Adarna', 910, NULL, 'Filipino', 'Adarna House, Inc.', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 800),
(104, 3, 10, 'What Kids Should Know About Andres and the Katipunan', 310, NULL, 'English', 'Weng Cahiles/Isa Natividad', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 48),
(105, 3, 6, 'Piko', 410, NULL, 'Filipino/English', 'Josel Nicolas (Editor) et al.', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 96),
(106, 3, 10, 'Hating Kapatid', 260, NULL, 'Filipino/English', 'Raissa Rivera Falgui/Fran Alvarez', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 32),
(107, 3, 10, 'Kung Linggo', 260, NULL, 'Filipino', 'Virgilio S. Almario/Abi Goy', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 32),
(108, 3, 10, 'Pag-abot ni Kolor sa Lungsod', 260, NULL, 'Cebuano/Filipino', 'Susan Dela Rosa Aragon', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, 'Susan Dela Rosa Aragon', 32),
(109, 3, 10, 'Si Ambongan', 260, NULL, 'Cebuano/Filipino', 'Lamberto Antonio/J.B. dela Peña', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 32),
(110, 3, 10, 'Si Diwayen, Noong Bago Dumating ang mga Espanyol', 260, NULL, 'Filipino/English', 'Augie Rivera/Paolo Lim', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 32),
(111, 1, 8, 'Scratchbuild Revolution Hobbymate 12th Anniversary Edition', 3500, NULL, 'English', NULL, 'USA Gundam Store', 'New', NULL, 'Paperback', 1, NULL, NULL),
(112, 1, 2, 'Tuesdays with Morrie', 300, NULL, 'English', 'Mitch Albom', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(113, 1, 6, 'Watchmen', 500, NULL, 'English', 'Alan Moore/Dave Gibbons', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(114, 1, 2, 'The Alchemist', 350, NULL, 'English', 'Paulo Coelho', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(115, 1, 2, 'Made in America', 350, NULL, 'English', 'Sam Walton/John Huey', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(116, 1, 2, 'Goethe''s Faust', 400, NULL, 'German/English', 'Goethe/Walter Kaufmann', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, 'Walter Kaufmann', NULL),
(117, 1, 2, 'Blink', 300, NULL, 'English', 'Malcolm Gladwell', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(118, 1, 2, 'The Tipping Point', 300, NULL, 'English', 'Malcolm Gladwell', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(119, 1, 8, 'The Art of Matrix', 500, NULL, 'English', NULL, NULL, 'Used - Very Good', NULL, 'Paperback', 1, NULL, NULL),
(120, 1, 9, 'BJT Business Japanese Proficiency Test Listening and Reading Comprehension (with 2 CDs)', 1170, NULL, 'Japanese', 'JETRO', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(121, 1, 9, 'BJT Business Japanese Proficiency Test Official Guide (with CD)', 820, NULL, 'Japanese', 'JETRO', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(122, 1, 9, 'BJT Business Japanese Proficiency Test-Practice Test and Strategies (with CD)', 1100, NULL, 'Japanese', 'JAL Academy', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(123, 4, 11, 'Hondashi 1kg', 870, NULL, 'Japanese/Mandarin', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(125, 4, 11, 'Golden Curry Regular Hot', 235, NULL, 'Japanese', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(126, 4, 11, 'Kikkoman Soy Sauce Naturally Brewed 1Litre', 350, NULL, 'English', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(127, 4, 11, 'Spam 340g', 220, NULL, 'English', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(128, 4, 11, 'Heinz Tomato Ketchup', 115, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(129, 4, 12, 'Schick Exact 2 Razors 2plus1', 125, NULL, 'English', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(130, 4, 11, 'Nissin Cup Noodles with Shrimp 64g', 115, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(131, 4, 12, 'Safeguard Value Pack 3x135g', 180, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(132, 4, 12, 'Old Spice High Endurance Dry Cream Pure Sport 45g', 296, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(133, 4, 11, 'JBC Happy Peanuts 100g', 100, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(134, 1, 8, 'The Legend of Zelda Hyrule Historia', 2000, NULL, 'English', NULL, NULL, 'Used - Very Good', NULL, NULL, 1, NULL, NULL),
(135, 4, 11, 'marukome dashiiri katsuo kombu miso 1kg', 250, NULL, 'Japanese', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(136, 4, 11, 'yakisoba sauce 1,200g', 350, NULL, 'Japanese', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(137, 4, 11, 'kewpie Japanese mayonnaise 500g', 275, NULL, 'Japanese', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(138, 4, 11, 'The Original Hotcake Mix Fluffy n Tasty', 135, NULL, 'English', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(139, 4, 11, 'McCormick Iodized Salt 140g', 100, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `merchant_id` (`merchant_id`),
  ADD KEY `product_type_id` (`product_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`merchant_id`) REFERENCES `merchant` (`merchant_id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`product_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
