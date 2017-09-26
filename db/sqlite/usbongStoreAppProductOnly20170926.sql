-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2017 at 08:34 AM
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
-- Database: `usbong_store20170926`
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
(24, 1, 10, 'Le Petit Prince', 320, '<strike>&#x20B1;400</strike>', 'French', 'Antoine de Saint-Exupéry', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
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
(42, 2, 6, 'Fairest (complete set)', 3500, '<strike>&#x20B1;4000</strike>', 'English', NULL, NULL, 'VF', NULL, 'Paperback', 1, NULL, NULL),
(43, 2, 6, 'Batman and Robin New 52 set', 6000, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(44, 1, 7, 'One Piece Manga set (1-20)', 3700, NULL, 'Japanese', NULL, NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(45, 1, 7, 'Conan Manga set (1-9)', 1665, NULL, 'Japanese', NULL, NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(46, 1, 7, 'Rurouni Kenshin Manga set (1-27 complete)', 5400, NULL, 'Japanese', NULL, NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(47, 2, 8, 'DAREDEVIL', 800, NULL, 'English', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(48, 2, 8, 'Spider-man Marvel Toybiz 90s', 700, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(49, 2, 8, 'Marvel Legends Wave 1 X-MEN BAF Juggernaut', 10000, NULL, 'English', NULL, NULL, 'VF-NM', NULL, NULL, 0, NULL, NULL),
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
(79, 3, 10, 'Noong Unang Panahon', 180, '<strike>&#x20B1;260</strike>', 'Filipino/English', ' Rafaelita Valera/Ghani Madueño', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 32),
(80, 3, 10, 'Si Lurat, Kidhat, Pirok, ug Piyong', 180, '<strike>&#x20B1;260</strike>', 'Filipino/Cebuano', ' Virgilio S. Almario/Albert Gamos', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 32),
(81, 3, 10, 'Can We Live Without Trees', 230, '<strike>&#x20B1;310</strike>', 'English', 'May Tobias-Papa/Fran Alvarez', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 40),
(82, 3, 10, 'Florante at Laura', 280, '<strike>&#x20B1;360</strike>', 'Filipino', 'Francisco Balagtas/Virgilio S. Almario', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 152),
(83, 3, 10, 'Displaced', 330, '<strike>&#x20B1;410</strike>', 'English', 'Aneka Rodriguez/Mitzi Villavecer', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 160),
(84, 3, 10, 'Mga Tala sa Dagat', 330, '<strike>&#x20B1;410</strike>', 'Filipino', 'Annette Acacio Flores/Nanoy Rafael', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, 'Nanoy Rafael', 100),
(85, 3, 10, 'Ibong Adarna (Complete Text)', 330, '<strike>&#x20B1;410</strike>', 'Filipino', 'Virgilio S. Almario (Editor)', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 268),
(86, 3, 10, 'Si Janus Silang at ang Tiyanak ng Tabon', 255, '<strike>&#x20B1;335</strike>', 'Filipino', 'Edgar Calabia Samar', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 180),
(87, 3, 10, 'Si Janus Silang at ang Labanang Manananggal-Mambabarang', 280, '<strike>&#x20B1;360</strike>', 'Filipino', 'Edgar Calabia Samar', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 204),
(88, 3, 10, 'Buwan, Buwang Bulawan', 300, '<strike>&#x20B1;380</strike>', 'Filipino', 'Virgilio S. Almario/Abi Goy', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 120),
(89, 3, 6, 'Light', 410, NULL, '(wordless)', 'Rob Cham', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 114),
(90, 3, 6, 'Sixty Six', 435, NULL, 'Filipino', 'Russell Molina/Ian Sta. Maria', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 148),
(91, 3, 7, 'Si Janus Silang at ang Tiyanak ng Tabon (Manga)', 410, NULL, 'Filipino', 'Edgar Calabia Samar/Carljoe Javier/Natasha Ringor', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 125),
(92, 3, 10, 'Detective Boys of Masangkay: Ang Mangkukulam', 355, '<strike>&#x20B1;435</strike>', 'Filipino', 'Bernalyn Hapin Sastrillo/Borg Sinaban', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 216),
(93, 3, 10, 'Piagsugpatan: Stories of the Mandaya', 280, '<strike>&#x20B1;360</strike>', 'English', 'Marcy Dans Lee et al.', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 90),
(94, 3, 10, 'Si Tito Libro at Ako', 280, '<strike>&#x20B1;360</strike>', 'Filipino', 'Uma Krishnaswami/Nanoy Rafael/JC Galag', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, 'Nanoy Rafael', 115),
(95, 3, 10, 'Supremo', 280, '<strike>&#x20B1;360</strike>', 'Filipino', 'Xi Zuq/Al Estrella ', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 105),
(96, 3, 10, 'Pangkat Papaya', 280, '<strike>&#x20B1;360</strike>', 'English', 'Xi Zuq/Al Estrella', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 105),
(97, 3, 10, 'Ang Lihim ng San Esteban', 280, '<strike>&#x20B1;360</strike>', 'Filipino', 'Acacio Flores/Nanoy Rafael', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 100),
(98, 3, 10, 'Can We Live on Mars', 230, '<strike>&#x20B1;310</strike>', 'English', 'Gidget Jimenez/Bru', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 40),
(99, 3, 10, 'Can We Drink the Ocean', 230, '<strike>&#x20B1;310</strike>', 'English', 'Gidget Jimenez/Isabel Roxas', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 40),
(100, 3, 10, 'Can We Plug Into Lightning', 230, '<strike>&#x20B1;310</strike>', 'English', 'Gidget Jimenez/Beth Parrocha-Doctolero', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 40),
(101, 3, 10, 'Guardians of Tradition: The Gawad sa Manlilikha ng Bayan', 230, '<strike>&#x20B1;310</strike>', 'English', 'Mae Astrid Tobias/Rommel Joson/Renato S. Rastrollo', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 32),
(102, 3, 10, 'Handa Ako', 200, '<strike>&#x20B1;280</strike>', 'Filipino', 'Liwliwa Malabed/Mia Lagos', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 44),
(103, 3, 10, 'Diksiyonaryong Adarna', 830, '<strike>&#x20B1;910</strike>', 'Filipino', 'Adarna House, Inc.', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 800),
(104, 3, 10, 'What Kids Should Know About Andres and the Katipunan', 230, '<strike>&#x20B1;310</strike>', 'English', 'Weng Cahiles/Isa Natividad', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 48),
(105, 3, 6, 'Piko', 410, NULL, 'Filipino/English', 'Josel Nicolas (Editor) et al.', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 96),
(106, 3, 10, 'Hating Kapatid', 180, '<strike>&#x20B1;260</strike>', 'Filipino/English', 'Raissa Rivera Falgui/Fran Alvarez', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 32),
(107, 3, 10, 'Kung Linggo', 180, '<strike>&#x20B1;260</strike>', 'Filipino', 'Virgilio S. Almario/Abi Goy', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 32),
(108, 3, 10, 'Pag-abot ni Kolor sa Lungsod', 180, '<strike>&#x20B1;260</strike>', 'Cebuano/Filipino', 'Susan Dela Rosa Aragon', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, 'Susan Dela Rosa Aragon', 32),
(109, 3, 10, 'Si Ambongan', 180, '<strike>&#x20B1;260</strike>', 'Cebuano/Filipino', 'Lamberto Antonio/J.B. dela Peña', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 32),
(110, 3, 10, 'Si Diwayen, Noong Bago Dumating ang mga Espanyol', 180, '<strike>&#x20B1;260</strike>', 'Filipino/English', 'Augie Rivera/Paolo Lim', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 32),
(111, 1, 8, 'Scratchbuild Revolution Hobbymate 12th Anniversary Edition', 3500, NULL, 'English', NULL, 'USA Gundam Store', 'New', NULL, 'Paperback', 1, NULL, NULL),
(112, 1, 2, 'Tuesdays with Morrie', 300, NULL, 'English', 'Mitch Albom', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(113, 1, 6, 'Watchmen', 500, NULL, 'English', 'Alan Moore/Dave Gibbons', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(114, 1, 2, 'The Alchemist', 350, NULL, 'English', 'Paulo Coelho', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(115, 1, 2, 'Made in America', 350, NULL, 'English', 'Sam Walton/John Huey', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(116, 1, 2, 'Goethe\'s Faust', 400, NULL, 'German/English', 'Goethe/Walter Kaufmann', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, 'Walter Kaufmann', NULL),
(117, 1, 2, 'Blink', 300, NULL, 'English', 'Malcolm Gladwell', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(118, 1, 2, 'The Tipping Point', 300, NULL, 'English', 'Malcolm Gladwell', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(119, 1, 8, 'The Art of the Matrix', 500, NULL, 'English', NULL, NULL, 'Used - Very Good', NULL, 'Paperback', 1, NULL, NULL),
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
(139, 4, 11, 'McCormick Iodized Salt 140g', 100, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(140, 4, 12, 'izumi Glass Teapot with Strainer 700ml', 158, NULL, 'English', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(141, 4, 5, 'PROMO-sencha (Green Tea), izumi Glass Teapot with Strainer 700ml', 312, '<strike>&#x20B1;383</strike>', 'English', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(142, 1, 5, 'PROMO-erin (with DVDs) vol 1-3', 5320, '<strike>&#x20B1;7776</strike>', 'Japanese', NULL, NULL, NULL, NULL, 'Paperback', 1, NULL, NULL),
(143, 1, 7, 'Nodame Kanta-bire Manga set (1-25 complete)', 5000, NULL, 'Japanese', NULL, NULL, 'Used - Good', NULL, NULL, 1, NULL, NULL),
(144, 1, 5, 'PROMO-kanzen masta- 1kyuu and 2kyuu', 1750, '<strike>&#x20B1;1820</strike>', 'Japanese', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(145, 3, 10, 'Alpabetong Filipino', 180, '<strike>&#x20B1;260</strike>', 'Filipino', 'Virgilio S. Almario/Paul Eric Roca', NULL, 'New', NULL, 'Paperback', 99, NULL, 32),
(146, 3, 10, 'Ang Alamat ng Palay', 180, '<strike>&#x20B1;260</strike>', 'Filipino/English', 'Virgilio S. Almario/Conrad Raquel', NULL, 'New', NULL, 'Paperback', 99, NULL, 32),
(147, 3, 10, 'Alamat ng Ampalaya', 180, '<strike>&#x20B1;260</strike>', 'Filipino/English', 'Augie Rivera/Kora Dandan-Albano', NULL, 'New', NULL, 'Paperback', 99, NULL, 32),
(148, 3, 10, 'Filemon Mamon', 180, '<strike>&#x20B1;260</strike>', 'Filipino/English', 'Christine Bellen/Jason Moss', NULL, 'New', NULL, 'Paperback', 99, NULL, 32),
(149, 3, 10, 'Naging Manlililok si Wigan', 180, '<strike>&#x20B1;260</strike>', 'Filipino', 'Felice Prudente Sta. Maria et al.', NULL, 'New', NULL, 'Paperback', 99, NULL, 32),
(150, 3, 10, 'Si Pilandok at ang Manok na Nangingitlog ng Ginto', 180, '<strike>&#x20B1;260</strike>', 'Filipino/English', 'Virgilio S. Almario/Kora Dandan-Albano', NULL, 'New', NULL, 'Paperback', 99, NULL, 32),
(151, 1, 12, 'Best Buy Popsicle Sticks 100pieces Red', 122, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 99, NULL, NULL),
(152, 1, 12, 'Best Buy Popsicle Sticks 100pieces Yellow', 122, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 99, NULL, NULL),
(153, 1, 12, 'Best Buy Popsicle Sticks 300pieces Yellow', 206, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 99, NULL, NULL),
(154, 1, 12, 'Glue Gun Small Acura ZD-5', 200, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 99, NULL, NULL),
(155, 1, 12, 'Glue Stick Small 6pieces', 96, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 99, NULL, NULL),
(156, 1, 5, 'PROMO-Glue Gun, Glue Sticks 6pieces, Popsicle Sticks 100pieces', 274, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 99, NULL, NULL),
(157, 1, 2, 'The Sandman Book of Dreams', 375, NULL, 'English', 'Neil Gaiman/Ed Kramer (Eds.)', NULL, NULL, NULL, 'Paperback', 3, NULL, NULL),
(158, 2, 6, 'Fantastic four forever story arc set', 800, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(159, 2, 6, 'amazing spider-man comics lot', 800, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(160, 2, 6, 'superior spider-man complete goblin nation story arc', 1000, NULL, 'English', NULL, NULL, 'VF', NULL, 'Paperback', 1, NULL, NULL),
(161, 2, 6, 'spider-man no turning back story arc', 600, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(162, 2, 6, 'spider-man ends of the earth story arc', 1200, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(163, 2, 6, 'Spider-man spider island story arc set', 1200, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(164, 2, 6, 'civil war II', 1400, NULL, 'English', NULL, NULL, 'NM', NULL, 'Paperback', 1, NULL, NULL),
(165, 2, 6, 'battleworld thors set', 400, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(166, 2, 6, 'dc comics presents deadman story arc', 500, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(167, 2, 6, 'warland comics set + extra', 1200, NULL, 'English', NULL, NULL, 'VG-F', NULL, 'Paperback', 1, NULL, NULL),
(168, 2, 6, 'green lantern new 52', 400, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(169, 2, 6, 'captain atom new 52', 300, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(170, 2, 6, 'spaceman set', 900, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(171, 2, 6, 'penguin pain and prejudice set', 600, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(172, 2, 6, 'superman new 52', 600, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(173, 2, 6, 'green arrow new 52 number 1', 400, NULL, 'English', NULL, NULL, 'NM', NULL, 'Paperback', 1, NULL, NULL),
(174, 2, 6, 'animal man new 52', 450, NULL, 'English', NULL, NULL, 'VF', NULL, 'Paperback', 1, NULL, NULL),
(175, 2, 6, 'swamp thing new 52', 400, NULL, 'English', NULL, NULL, 'VF', NULL, 'Paperback', 1, NULL, NULL),
(176, 2, 6, 'x-men number 12', 8000, NULL, 'English', NULL, NULL, 'VG', NULL, 'Paperback', 1, NULL, NULL),
(177, 2, 6, 'ultimate comics new spider-man set', 4500, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(178, 2, 6, 'spider-men complete set', 1200, NULL, 'English', NULL, NULL, 'VF-NM', NULL, 'Paperback', 1, NULL, NULL),
(179, 2, 6, 'INDESTRUCTIBLE hulk set', 1500, NULL, 'English', NULL, NULL, 'F', NULL, 'Paperback', 1, NULL, NULL),
(180, 2, 6, 'sub-mariner number 8', 900, NULL, 'English', NULL, NULL, 'VG-F', NULL, 'Paperback', 1, NULL, NULL),
(181, 2, 8, 'BTAS killer croc', 800, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(182, 2, 8, 'punisher art print', 1000, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(183, 2, 8, 'BTAS Mr. Freeze', 800, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(184, 2, 8, 'BTAS scarecrow', 800, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(185, 2, 8, 'captain america cards', 200, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(186, 2, 8, 'Venom marvel toybiz 90s', 700, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(187, 2, 8, 'Morbius', 400, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(188, 2, 8, 'Rogue', 400, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(189, 2, 8, 'Carnage', 600, NULL, 'English', NULL, NULL, 'New', NULL, '', 1, NULL, NULL),
(190, 2, 8, 'captain america art print', 1000, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(191, 2, 8, 'silver surfer', 800, NULL, 'English', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(192, 2, 8, 'US agent', 500, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(193, 2, 8, 'talking venom', 700, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(194, 2, 8, 'deathlok', 650, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(195, 2, 8, 'scarlet spider', 850, NULL, 'English', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(196, 2, 8, 'green goblin marvel 90s', 400, NULL, 'English', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL),
(197, 2, 8, 'black widow marvel 90s', 400, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(198, 2, 8, 'captain marvel', 600, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(199, 2, 8, 'iron fist marvel 90s', 800, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(200, 2, 8, 'Falcon marvel 90s', 500, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(201, 2, 8, 'bullseye and electra', 700, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(202, 2, 8, 'cyclops and jean grey marvel 90s', 700, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(203, 2, 8, 'DD marvel toybiz 90s', 500, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(204, 2, 8, 'metal gear liquid snake action figure', 1500, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(205, 2, 8, 'green goblin marvel toybiz 90s', 600, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 1, NULL, NULL),
(207, 4, 12, 'head and shoulders apple fresh shampoo 170ml', 196, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 99, NULL, NULL),
(208, 4, 11, 'Ligo Sardines Easy Open Tomato Chili 155g 6cans', 166, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 99, NULL, NULL),
(209, 1, 2, 'A Truck Full of Money', 500, NULL, 'English', 'Tracy Kidder', NULL, 'Used - Very Good', NULL, 'Paperback', 1, NULL, NULL),
(210, 1, 2, 'Made to Stick', 550, NULL, 'English', 'Chip Heath/Dan Heath', NULL, 'Used - Good', NULL, 'Paperback', 2, NULL, NULL),
(211, 1, 2, 'Mountains Beyond Mountains', 500, NULL, 'English', 'Tracy Kidder', NULL, 'Used - Good', NULL, 'Hardcover', 1, NULL, NULL),
(213, 1, 2, 'My Stroke of Insight', 500, NULL, 'English', 'Jill Bolte Taylor, Ph.D.', NULL, 'Used - Good', NULL, 'Hardcover', 1, NULL, NULL),
(214, 1, 2, 'Presentation Zen', 500, NULL, 'English', 'Garr Reynolds', NULL, 'Used - Good', NULL, 'Paperback', 2, NULL, NULL),
(215, 1, 2, 'Surely You\'re Joking, Mr. Feynman', 500, NULL, 'English', 'Richard Feynman', NULL, 'Used - Good', '', 'Paperback', 2, NULL, NULL),
(216, 1, 2, 'The Pleasure of Finding Things Out', 500, NULL, 'English', 'Richard Feynman', NULL, 'Used - Good', NULL, 'Paperback', 2, NULL, NULL),
(217, 1, 2, 'The Road Less Traveled', 350, NULL, 'English', 'M. Scott. Peck, M.D.', NULL, 'Used - Good', NULL, 'Paperback', 2, NULL, NULL),
(218, 1, 2, 'The Youngest Science', 400, NULL, 'English', 'Lewis Thomas', NULL, 'Used - Good', NULL, 'Hardcover', 1, NULL, NULL),
(219, 1, 2, 'When All You\'ve Ever Wanted Isn\'t Enough', 400, NULL, 'English', 'Harold Kushner', NULL, 'Used - Very Good', NULL, 'Paperback', 1, NULL, NULL),
(220, 1, 2, 'The Myth of Sisyphus', 400, NULL, 'English', 'Albert Camus', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(221, 1, 2, 'Musicophilia', 500, NULL, 'English', 'Oliver Sacks', NULL, 'Used - Acceptable', NULL, 'Hardcover', 2, NULL, NULL),
(222, 1, 2, 'Thinking, Fast and Slow', 950, NULL, 'English', 'Daniel Kahneman', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, NULL, NULL),
(223, 1, 2, 'The World is Flat', 400, NULL, 'English', 'Thomas Friedman', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(224, 1, 2, 'The Complete Original Illustrated Sherlock Holmes', 600, NULL, 'English', 'Arthur Conan Doyle', NULL, 'Used - Very Good', NULL, 'Hardcover', 1, NULL, NULL),
(225, 1, 2, 'Great Detectives', 600, NULL, 'English', 'David Willis McCullough (Ed)', NULL, 'Used - Very Good', NULL, 'Hardcover', 1, NULL, NULL),
(226, 1, 2, 'The Dilbert Principle', 400, NULL, 'English', 'Scott Adams', NULL, 'Used - Good', NULL, 'Hardcover', 1, NULL, NULL),
(227, 1, 2, 'Introduction to Zen Buddhism', 460, NULL, 'English', 'D. T. Suzuki', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(228, 4, 11, 'Rebisco Strawberry Cream-Filled Cracker Sandwich 10x32g packs', 132, NULL, 'English', NULL, NULL, 'New', NULL, NULL, 99, NULL, NULL),
(229, 1, 2, 'Creating a World Without Poverty', 500, NULL, 'English', 'Muhammad Yunus', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(230, 1, 2, 'Einstein The Life and Times', 400, NULL, 'English', 'Ronald Clark', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(231, 1, 2, 'Letters to a Young Poet', 270, NULL, 'English', 'Rainer Maria Rilke/Stephen Mitchell', NULL, 'Used - Good', NULL, 'Paperback', 1, 'Stephen Mitchell', NULL),
(232, 1, 2, 'The Long Tail', 500, NULL, 'English', 'Chris Anderson', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(233, 1, 2, 'The Dilbert Future', 400, NULL, 'English', 'Scott Adams', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(234, 1, 2, 'The Greatest Show on Earth', 500, NULL, 'English', 'Richard Dawkins', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(235, 1, 2, 'A Brief History of Time', 500, NULL, 'English', 'Stephen Hawking', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(236, 1, 2, 'A Whole New Mind', 420, NULL, 'English', 'Daniel Pink', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(237, 1, 2, 'Among Schoolchildren', 400, NULL, 'English', 'Tracy Kidder', NULL, 'Used - Good', NULL, 'Hardcover', 1, NULL, NULL),
(238, 1, 2, 'Born to Run', 500, NULL, 'English', 'Christopher McDougall', NULL, 'Used - Good', NULL, 'Hardcover', 1, NULL, NULL),
(239, 1, 2, 'Einstein\'s Dreams', 420, NULL, 'English', 'Alan Lightman', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(240, 1, 2, 'Hanging Out with the Dream King', 480, NULL, 'English', 'Joseph McCabe (Ed)', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(241, 1, 2, 'In Search of Excellence', 420, NULL, 'English', 'Thomas J. Peters/Robert H. Waterman, Jr.', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(242, 1, 2, 'Mere Christianity', 460, NULL, 'English', 'C. S. Lewis', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(243, 1, 2, 'They Call Me Coach', 600, NULL, 'English', 'John Wooden', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(244, 1, 2, 'The Happiness Project', 420, NULL, 'English', 'Gretchen Rubin', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(245, 1, 2, 'Strength in What Remains', 500, NULL, 'English', 'Tracy Kidder', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(246, 1, 2, 'Things Fall Apart', 500, NULL, 'English', 'Chinua Achebe', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL),
(247, 1, 2, 'Harvard Med', 500, NULL, 'English', 'John Langone', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(248, 1, 2, 'The Lean Startup', 800, NULL, 'English', 'Eric Ries', NULL, 'Used - Very Good', NULL, 'Hardcover', 1, NULL, NULL),
(249, 1, 2, 'Einstein', 600, NULL, 'English', 'Walter Isaacson', NULL, 'Used - Very Good', NULL, 'Paperback', 1, NULL, NULL),
(250, 1, 2, 'Quiet', 600, NULL, 'English', 'Susan Cain', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(251, 1, 2, 'Wooden', 400, NULL, 'English', 'John Wooden/Steve Jamison', NULL, 'Used - Good', NULL, 'Hardcover', 1, NULL, NULL),
(252, 1, 2, 'Good Boss, Bad Boss', 500, NULL, 'English', 'Robert Sutton, PhD', NULL, 'Used - Good', NULL, 'Paperback', 1, NULL, NULL),
(253, 1, 2, 'Vintage Sacks', 450, NULL, 'English', 'Oliver Sacks', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL);

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
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;
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
