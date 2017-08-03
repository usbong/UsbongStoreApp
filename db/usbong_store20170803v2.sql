-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 03, 2017 at 08:13 AM
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
-- Database: `usbong_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_order_id` int(11) DEFAULT NULL,
  `quantity` int(6) NOT NULL,
  `price` int(6) NOT NULL,
  `added_datetime_stamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `purchased_datetime_stamp` datetime NOT NULL,
  `removed_datetime_stamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `product_id`, `customer_id`, `customer_order_id`, `quantity`, `price`, `added_datetime_stamp`, `purchased_datetime_stamp`, `removed_datetime_stamp`) VALUES
(1, 81, 1, 1, 1, 310, '2017-08-02 19:48:46', '2017-08-02 19:50:27', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_first_name` varchar(16) DEFAULT NULL,
  `customer_last_name` varchar(16) DEFAULT NULL,
  `customer_email_address` varchar(30) DEFAULT NULL,
  `customer_password` varchar(250) DEFAULT NULL,
  `customer_contact_number` int(16) DEFAULT NULL,
  `customer_shipping_address` text,
  `customer_city` text,
  `customer_country` text,
  `customer_postal_code` int(11) DEFAULT NULL,
  `mode_of_payment_id` tinyint(1) NOT NULL DEFAULT '0',
  `is_admin` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_first_name`, `customer_last_name`, `customer_email_address`, `customer_password`, `customer_contact_number`, `customer_shipping_address`, `customer_city`, `customer_country`, `customer_postal_code`, `mode_of_payment_id`, `is_admin`) VALUES
(1, 'abc', 'def', 'usbong.ph@gmail.com', '$2y$10$.XKiIckqlnoaBSe180NEm.TRUOwvCzbNInkOey86YC5bTzPZqI8a.', 1234567, '2 E Rodriguez Ave. Sto Nino', 'Marikina City', 'Philippines', 1800, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

CREATE TABLE `customer_order` (
  `customer_order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `added_datetime_stamp` datetime NOT NULL,
  `quantity` int(11) NOT NULL,
  `status_accepted` tinyint(1) NOT NULL DEFAULT '0',
  `order_total_price` int(11) NOT NULL,
  `fulfilled_status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`customer_order_id`, `customer_id`, `added_datetime_stamp`, `quantity`, `status_accepted`, `order_total_price`, `fulfilled_status`) VALUES
(1, 1, '2017-08-02 19:50:27', 1, 1, 310, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `fields_id` int(11) NOT NULL,
  `fields_name` varchar(30) NOT NULL,
  `product_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fields`
--

INSERT INTO `fields` (`fields_id`, `fields_name`, `product_type_id`) VALUES
(1, 'name', 1),
(2, 'price', 1),
(3, 'supplier', 1),
(4, 'description', 1),
(5, 'image_location', 1),
(6, 'author', 2),
(7, 'language', 4);

-- --------------------------------------------------------

--
-- Table structure for table `merchant`
--

CREATE TABLE `merchant` (
  `merchant_id` int(11) NOT NULL,
  `merchant_name` varchar(50) NOT NULL,
  `merchant_motto` varchar(50) DEFAULT NULL,
  `merchant_motto_font_color` varchar(8) NOT NULL DEFAULT '#6f5630'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `merchant`
--

INSERT INTO `merchant` (`merchant_id`, `merchant_name`, `merchant_motto`, `merchant_motto_font_color`) VALUES
(1, 'Usbong Specialty Bookstore', 'Uplifting Human Lives', '#6f5630'),
(2, 'RetroCC', 'Keep Reading.<br>Keep Collecting.', '#FFFFFF'),
(3, 'Adarna House, Inc.', 'Every Filipino child literate', '#0b7900');

-- --------------------------------------------------------

--
-- Table structure for table `mode_of_payment`
--

CREATE TABLE `mode_of_payment` (
  `mode_of_payment_id` tinyint(1) NOT NULL,
  `mode_of_payment_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mode_of_payment`
--

INSERT INTO `mode_of_payment` (`mode_of_payment_id`, `mode_of_payment_name`) VALUES
(0, 'Bank Deposit'),
(1, 'Paypal');

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
  `language` varchar(20) DEFAULT 'English',
  `author` varchar(50) DEFAULT NULL,
  `supplier` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `image_location` varchar(30) DEFAULT NULL,
  `format` varchar(10) DEFAULT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `translator` varchar(50) DEFAULT NULL,
  `product_overview` text,
  `pages` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `merchant_id`, `product_type_id`, `name`, `price`, `language`, `author`, `supplier`, `description`, `image_location`, `format`, `quantity_in_stock`, `translator`, `product_overview`, `pages`) VALUES
(1, 1, 2, 'The Remains of the Day', 400, 'English', 'Kazuo Ishiguro', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, '', 'The novelist, Kazuo Ishiguro, has said, \"A novel may not give us facts that are true, [but] what it tells us about experience, the emotion that it conveys, is something that we recognize as true. And sometimes, very important emotions, feelings are conveyed in a novel that cannot be conveyed in more factual stories, or in factual books. I think most importantly, perhaps, a key to it, I think, a novel can tell us how it feels to be in a certain situation. A work of history or journalism can tell us that some people starved in a particular time and place. But, perhaps, it cannot convey the pain of starving, or losing someone close to you or your child to starvation... We need someone to tell us how it felt... Is it true that it feels like that to be in that situation, or is this not true? I think we still have to ask that question. But I think that\'s why we turn to stories, because we feel there\'s something missing in just the factual account.\"', NULL),
(2, 1, 2, 'The Daydreamer', 400, 'English', 'Ian McEwan', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'While we know \"Google\" as the search engine giant, Peter, the protagonist in this book, discovered \"Googol\", which is pronounced somewhat similarly, while thinking about the largest number in the world. A \"Googol\" is ten multiplied by ten a hundred times. Moreover, \"Googolplex\" is ten multiplied by ten a googol number of times! But what I really remember about this book is the story about how Peter became friends with the school bully by realizing that he and his classmates only dreamed him up to be strong and powerful, because in reality, he is a nice, ordinary little boy just like any of them.', NULL),
(3, 1, 2, 'Myths to Live By', 400, 'English', 'Joseph Campbell', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'Here is a quotation from the book, which you are free to agree or disagree.\r\n\r\n\"All societies are evil, sorrowful, inequitable; and so they will always be. So if you really want to help this world, what you will have to teach is how to live in it. And that no one can do who has not himself learned how to live in it in the joyful sorrow and sorrowful joy of the knowledge of life as it is.\"', NULL),
(4, 1, 2, 'The Seasons of a Man\'s Life', 500, 'English', 'Daniel Levinson et al.', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'This book provides a more or less general picture of the so-called \"seasons\" of a man\'s life. It shows examples of various men who set out to realize their dream or ideal life, only to discover later in life that they must confront and eventually accept the reality that they may not be able to actually fulfill that initial dream. One example that I can remember is the academic who wanted to receive recognition for his work by receiving the Nobel prize, but to his great disappointment was beaten to it by a rival group. He later found solace in providing mentorship to the younger generation of scientists in his field.', NULL),
(5, 1, 2, 'The Last Lecture', 400, 'English', 'Randy Pausch et al.', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'While the \"Last Lecture\" doesn\'t necessarily mean that it\'s a professor\'s last lecture, and is simply a way for senior professors at Carnegie Mellon University to share wisdom to younger students and faculty, for Randy Pausch, it really was somewhat of a last lecture, because he was already grappling with pancreatic cancer and his chance of survival was low. This book offers his insights about living.', NULL),
(6, 1, 2, 'The Innovators', 600, 'English', 'Walter Isaacson', NULL, 'Used - Very Good', NULL, 'Paperback', 1, '', 'This book chronicles the many people who contributed to the development of an important tool that is the computer and the many innovations that went with it. It was interesting for me to discover glimpses of inventors as humans, working together to build things that would amplify even further their capabilities and shape the world forever. ', NULL),
(7, 1, 2, 'Steve Jobs', 500, 'English', 'Walter Isaacson', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'This book offers glimpses of Steve Jobs\' life as a human person, warts and all. I particularly liked discovering that despite the wealth that he was able to accumulate in his life, he decided that he didn\'t want to change his simple, yet efficient lifestyle, only for the sake of being able to live the rich life that is glamorized by media.', NULL),
(8, 1, 9, 'Tokyo University\'s English', 1000, 'Japanese/English', 'Masafumi Satou', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, '', 'While this book is intended for Japanese students who\'ll be taking the Tokyo University entrance exam, it can be used by Japanese language learners as well. The sample readings are in English, while the translation and explanations are in Japanese. The articles are also quite interesting. I particularly remember the one about how our hopes and fears are \"often illusions promising to change our way of life, but leaving us exactly as we were before.\"', NULL),
(9, 1, 2, 'Siddhartha', 300, 'English', 'Herman Hesse', NULL, 'Used - Very Good', NULL, 'Paperback', 1, '', 'This story relates the transitions a person undertook to achieve the state of everlasting peace. He first lived the life of a scholar, and then became an ascetic, and then a merchant, and then a boatman. I found it particularly interesting to learn how an ascetic could become a merchant. As it turns out, having the ability to read and write, as well as the patience to wait and fast, instead of having to seek any kind of work due to being driven by hunger, proved useful to this transition. Another key idea that I got from the book is that there are things that cannot be taught in words, but must truly be experienced for another person to understand.', NULL),
(10, 1, 2, 'The Montessori Method', 400, 'English', 'Maria Montessori', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'The first dawn of real discipline comes through action. When a child has learned to respond naturally through action that is aimed towards an objective, that is, action that is no longer erratic, he is no more the child that he was at first, but an individual. When, further, he has freed himself from being dependent on others due to his own inferiority, he has overcome himself and the limits of his age, and has made a great step forward by conquering his future while in the present.', NULL),
(11, 1, 2, 'The Soul of a New Machine', 400, 'English', 'Tracy Kidder', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, '', 'What is the soul of a new machine? It is the collective soul etched in silicon and microcode of a team of dedicated engineers who brought the machine to life. In the end, \"It\'s just a computer. It\'s really a small thing in the world, you know.\"', NULL),
(12, 1, 2, 'Outliers: The Story of Success', 400, 'English', 'Malcolm Gladwell', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, '', 'There are two things that make rice farming meaningful. First, there is a clear relationship between effort and reward, in that the harder you work a rice field, the more it yields. Second, its complexity is akin to running a small business that is composed of a family workforce, who must hedge uncertainty through seed selection, building and managing a sophisticated irrigation system, and at the same time coordinating the complicated process of crop harvesting and crop preparation.', NULL),
(13, 1, 2, 'Guns, Germs, and Steel', 500, 'English', 'Jared Diamond', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'Where do innovations actually come from? As it turns out, much technology is not invented solely locally and is not done by a lone individual. Instead, it is borrowed from other societies and from other inventors who’ve gone before. The spread of useful invention depends on whether a society that learns about it is receptive to it and adopts it. Societies lacking the invention often find themselves at a disadvantage in relation to the receptive society, even becoming overwhelmed and replaced if the disadvantage is sufficiently great.', NULL),
(14, 1, 2, 'The Tao of Pooh', 300, 'English', 'Benjamin Hoff', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'To Laozi, the universe was not a setter of traps, but a teacher of valuable lessons. While it would be arrogant to attempt to adequately put how the universe operates into words, its nature could be understood. And the natural result of being able to appreciate, learn from, and work with whatever happens in everyday life is happiness.', NULL),
(15, 1, 2, 'The Different Drum', 400, 'English', 'M. Scott Peck, M.D.', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'The reality of human nature is that we are all profoundly different. This is due to our capacity to be molded by culture and experience in extremely variable ways. At the same time, it is this same capacity that opens the way for all of us to transformation, which paradoxically, is both the basic cause of war and the basic cure for war.', NULL),
(16, 1, 2, 'The Lives of a Cell', 300, 'English', 'Lewis Thomas', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'The sky is a miraculous achievement. It is, after all, far and away the grandest product of collaboration in all of nature. Earth would not be alive as we know it without such cooperation. Moreover, the shelter it provides prevents millions of meteorites from pounding us like the powdered surface of the moon. While we may not be sensitive enough to hear it, we find solace in knowing that the sound is there above, “like the random noise of rain on the roof at night.”', NULL),
(17, 1, 2, 'The Plague', 400, 'English', 'Albert Camus', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'The town of Oran is hit by a devastating plague. Everyone is locked in the town. Nobody comes in, nobody goes out. Gripped by this circumstance, the people are challenged to confront their strongly held beliefs. Meanwhile, a group of tenacious men and women work together to fight the plague, hoping that they\'ll eventually figure out a cure to put an end to it. Eventually, indeed, the plague is brought to a stop. But how? Could it be divine intervention? It\'s not what you think.', NULL),
(18, 1, 2, 'Living Language: French', 500, 'English', 'Anne Heminway', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'While the book may be dated, e.g. the currency is not in euros, I found the sequence of chapters relevant to one who is learning French. The chapters start with a dialogue, then an explanation of certain grammar points, then some exercises, and finally a cultural note, which all provide a much better glimpse of French culture. Using tools like Google Translate to help you with the pronunciation, you should be able to gradually learn to speak, read, and understand French as you go through this book.', NULL),
(19, 1, 2, 'Starting Point, 1979-1996', 850, 'English', 'Hayao Miyazaki', NULL, 'New', NULL, 'Paperback', 1, 'Beth Cary/Frederik L. Schodt', 'I first got a copy of this book (Japanese version) while studying in Japan as an exchange student. I wanted to eventually be able to read it in the original. About 10 years later, I was indeed able to read the chapter on \"Animation and Manga Movies\". It was a pleasant surprise that my Japanese language ability had improved to the extent that I could already read such texts. I then translated the chapter for my class on Japanese Films. Having said this, it is still fun even now to just randomly flip a page and read insights from MiyazakiSAN.', NULL),
(20, 1, 2, 'Turning Point, 1997-2008', 1400, 'English', 'Hayao Miyazaki', NULL, 'New', NULL, 'Hardcover', 1, 'Beth Cary/Frederik L. Schodt', 'I first got a copy of the first book, \"Starting Point, 1979-1996 (Japanese version)\", while studying in Japan as an exchange student. I wanted to eventually be able to read it in the original. About 10 years later, I was indeed able to read the chapter on \"Animation and Manga Movies\". It was a pleasant surprise that my Japanese language ability had improved to the extent that I could already read such texts. I then translated the chapter for my class on Japanese Films. Not long after, I got a copy of this book in the original Japanese. It is indeed fun to just randomly flip a page and read insights from MiyazakiSAN.', NULL),
(21, 1, 2, 'Made in Japan', 400, 'English', 'Akio Morita et al.', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, 'Edwin M. Reingold/Mitsuko Shimomura', 'Here\'s my English translation of an excerpt taken from an interview with Akio Morita on NHK\'s 「あの人に会いたい」(I want to meet that person).<br>\r\n「私は日本製品を売ろうとしていたが、\r\nドイツ人の目にはこの傘が日本製品を象徴していると」\"I was trying to sell Japanese products, but in the eyes of Germans, Japanese products were small umbrellas that are put on top of ice creams!\"<br>\r\n「この傘がメイドインジャパンだったわけです」\r\n\"This umbrella represented products made in Japan.\"<br>\r\n「それ以来、私はメイドインジャパンのイメージを変えなければと一生懸命やってきた」\r\n\"After that, I did my very best to change the \'Made in Japan\' image.\"', NULL),
(22, 1, 2, 'Wikinomics', 400, 'English', 'Don Tapscott/Anthony Williams', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, NULL, 'This book provides an optimistic view on how technology, particularly the internet, is enabling people to massively collaborate. While we know that technology is a double-edged sword, that is, it can be used for good or ill depending on its wielder, one is left with a positive and optimistic feeling that things are getting better instead of worse after reading this book. ', NULL),
(23, 1, 2, 'The Dancing Wu Li Masters', 400, 'English', 'Gary Zukav', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, 'This book is a must-read for anyone who wants to understand Physics, that is, not the Physics that students commonly learn in school, where there are equations that one must solve in a sort of computer-like way, without really understanding deeply what kind of thinking and perspective brought about those equations in the first place. One question that this book asks is, what is a living thing? If we break down a human person into very, very tiny, little pieces, we\'ll find that a rock is made up of those very tiny, little pieces as well. And yet, we do not call a rock a living thing. Why is that? Eventually, if you continue asking such questions, you\'ll arrive with the answer that we don\'t know. And the book concludes with an invitation to an opening towards eastern culture. ', NULL),
(24, 1, 10, 'Le Petit Prince', 400, 'French', 'Antoine de Saint-Exupéry', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, 'This book\'s often quoted phrase, «On ne voit bien qu’avec le cœur. L’essentiel est invisible pour les yeux.  (We can only see well with our hearts. What is essential is invisible to the eye.)» reminds us that a person can be vain, difficult, and demanding, but it is the quality time that we spent for that person that makes him or her special and unique from all the other persons in the world.', NULL),
(25, 1, 2, 'Founders at Work', 500, 'English', 'Jessica Livingston', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, NULL, 'Reading this book gives a person an idea of what founders of startups had to undergo to be able to achieve what they\'ve achieved. It contains interviews upon interviews of founders of companies that even now we still recognize and whose services we still use. I hope that this book gives you a better appreciation and respect for company founders, and inspires you to become one someday.', NULL),
(26, 1, 2, 'Standard First Aid & Personal Safety', 500, 'English', 'American Red Cross', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL, 'While there are copies of First Aid guides, which a person can download free-of-charge online, this printed copy shows ways of how an ordinary person, without having to prescribe any medicine, can provide first aid when needed. Examples include applying various bandages, positioning a person in certain ways, and so on. What is most important, however, is achieving a calm and tranquil state of mind to act and do what must be done even during times of accidents or disaster. Hopefully, this book helps you attain such a state of presence.', NULL),
(27, 1, 9, 'HSK Level 5 Sample Exam', 1500, 'Mandarin/Japanese', 'Confucius Institute (Hanban)', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, '株式会社スプリックス', 'This book is a good learning tool not only for those who\'ll be taking the HSK Level 5 exam, but also those who simply enjoy reading interesting texts or articles from a variety of fields. The texts are in Mandarin (Simplified), while the translation and explanations are in Japanese. One story that I remember from this book is the one about the business man, his son, and their donkey. The lesson it shared was that it is difficult to please everybody. And if you mistakenly think that you can satisfy everyone, you\'ll realize that you won\'t be happy and the people you wanted to satisfy won\'t be satisfied either. ', NULL),
(28, 1, 3, 'M&S Earl Grey Tea', 420, 'English', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Douglas Adams has this to say about tea. It is from the chapter on \"Tea\" from the book, \"The Salmon of Doubt\". \"Drink it. After a few moments you will begin to think that the place you\'ve come to \r\nisn\'t maybe quite so strange and crazy after all.\"', NULL),
(29, 1, 3, 'UCC Coffee (Rich Blend)', 580, 'Japanese', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(30, 1, 3, 'sencha (Green Tea)', 420, 'Japanese', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'While at present, Filipinos in general favor coffee over tea, I hope that someday we would all appreciate the simple and calming effects of drinking Japanese green tea. While other teas may contain plenty of caffeine, or would easily cause molds to form if not consumed quickly, green tea offers few, if at all, caffeine, such that one can drink it even before going to sleep, and can store it in room temperature without molds forming. If you find that you\'ve made too much green tea, you can put it inside the refrigerator and drink it later as cold tea, without the disadvantage of too much added sugar found in commercialized iced teas.', NULL),
(31, 1, 5, 'PROMO-Le Petit Prince, Living Language French, The Plague', 1250, 'French/English', 'Saint-Exupéry, Heminway, Camus', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL, NULL),
(32, 1, 5, 'PROMO-Wikinomics, Guns, Germs, and Steel, The Soul of a New Machine, The Different Drum', 1650, 'English', 'Tapscott/Williams, Diamond, Kidder, Peck', NULL, 'Used - Acceptable', NULL, 'Mixed', 1, NULL, NULL, NULL),
(33, 1, 5, 'PROMO-Made in Japan, The Soul of a New Machine, Founders at Work, Outliers', 1650, 'English', 'Morita et al., Kidder, Gladwell, Livingston', NULL, 'Used - Acceptable', NULL, 'Mixed', 1, NULL, NULL, NULL),
(34, 1, 5, 'PROMO-Starting Point, Turning Point', 2200, 'English', 'Hayao Miyazaki', NULL, 'New', NULL, 'Mixed', 1, 'Beth Cary and Frederik L. Schodt', NULL, NULL),
(35, 1, 5, 'PROMO-Steve Jobs, The Innovators', 1050, 'English', 'Walter Isaacson', NULL, 'Used - Very Good', NULL, 'Paperback', 1, NULL, NULL, NULL),
(36, 2, 6, 'ACTION COMICS 1-52 (complete set)', 8000, 'English', NULL, NULL, 'new, 1-52 + extras, VF-NM', NULL, NULL, 1, NULL, NULL, NULL),
(37, 2, 6, 'Silver Surfer vol 1 (complete set)', 32000, 'English', NULL, NULL, '1-18, VG-F', NULL, NULL, 1, NULL, NULL, NULL),
(38, 2, 6, 'Batman Superman set', 3000, 'English', NULL, NULL, '1-31, annual 1-2, future\'s end 1, missing issue 32, VF-NM', NULL, NULL, 1, NULL, NULL, NULL),
(39, 2, 6, 'ULTIMATE FALL OUT set', 1800, 'English', NULL, NULL, 'ultimate fallout 1-6, issue 4 1st appearance miles morales, death of spider-man 2nd print, VF-NM', NULL, NULL, 1, NULL, NULL, NULL),
(40, 2, 6, 'KLAUS boom studios', 1200, 'English', NULL, NULL, 'complete set 1-7, VF-NM', NULL, NULL, 1, NULL, NULL, NULL),
(41, 2, 6, 'Empire of the Dead', 1500, 'English', NULL, NULL, 'complete 1st arc, 1-5, VF', NULL, NULL, 1, NULL, NULL, NULL),
(42, 2, 6, 'Fairest (complete set)', 4000, 'English', NULL, NULL, 'VF', NULL, NULL, 1, NULL, NULL, NULL),
(43, 2, 6, 'Batman and Robin New 52 set', 6000, 'English', NULL, NULL, 'Complete set of batman and robin new 52,\r\nVF-NM', NULL, NULL, 1, NULL, NULL, NULL),
(44, 1, 7, 'One Piece Manga set (1-20)', 3700, 'Japanese', NULL, NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL, NULL),
(45, 1, 7, 'Conan Manga set (1-9)', 1665, 'Japanese', NULL, NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL, NULL),
(46, 1, 7, 'Rurouni Kenshin Manga set (1-10)', 1850, 'Japanese', NULL, NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, NULL, NULL),
(47, 2, 8, 'DAREDEVIL', 800, 'English', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(48, 2, 8, 'Spider-man Marvel Toybiz 90s', 700, 'English', NULL, NULL, 'MOC', NULL, NULL, 1, NULL, NULL, NULL),
(49, 2, 8, 'Marvel Legends Wave 1 X-MEN BAF Juggernaut', 10000, 'English', NULL, NULL, 'VF-NM', NULL, NULL, 1, NULL, NULL, NULL),
(50, 1, 9, 'shimbun de manabu nihongo (with CDs)', 2700, 'Japanese', 'Mizutani Osamu et al.', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL, NULL),
(51, 1, 9, 'kanzen masta- 2kyuu', 1300, 'Japanese', '3A Corporation', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL, NULL),
(52, 1, 9, 'kanzen masta- 1kyuu', 1300, 'Japanese', '3A Corporation', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL, NULL),
(53, 1, 9, 'kanji look and learn', 2000, 'Japanese', 'Eri Banno et al. (The Japan Times)', NULL, 'New', NULL, 'Paperback', 1, NULL, NULL, NULL),
(54, 1, 9, 'genki II 2nd ed (with CD)', 3800, 'Japanese', 'Eri Banno et al. (The Japan Times)', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL, NULL),
(55, 1, 9, 'genki I 2nd ed (with CD)', 3800, 'Japanese', 'Eri Banno et al. (The Japan Times)', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL, NULL),
(56, 1, 9, 'erin (with DVD) vol 3', 2600, 'Japanese', 'The Japan Foundation', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL, NULL),
(57, 1, 9, 'erin (with DVD) vol 2', 2600, 'Japanese', 'The Japan Foundation', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL, NULL),
(58, 1, 9, 'erin (with DVD) vol 1', 2600, 'Japanese', 'The Japan Foundation', NULL, 'New', NULL, 'Paperback', 2, NULL, NULL, NULL),
(59, 1, 2, 'kenshuui junjou monogatari', 350, 'Japanese', 'Keiichi Kawafuchi', NULL, 'New', NULL, 'Paperback', 1, NULL, '\"Honest Tales of a Medical Resident: Don\'t Call Me Doctor!\", by Keiichi Kawafuchi, relates the author\'s own experiences as a resident in a university hospital. The road that he took to become a medical doctor wasn\'t straight-forward. He first worked in various and odd jobs, even turning into a hikikomori (someone who withdraws from society), before deciding at 30 to become a medical doctor. He eventually graduated at 37 years old from Kyoto University\'s Medical School, and is now a freelance internist and writer. Although reviews may be mixed (one side likes the book, the other side doesn\'t), I found the author\'s experiences and musings quite honest and frank.', NULL),
(60, 1, 2, 'Godel, Escher, Bach', 700, 'English', 'Douglas Hofstadter', NULL, 'Used - Acceptable', NULL, 'Paperback', 2, NULL, 'This book shows through historical examples of real persons who\'ve stumbled upon the paradoxes of logic, and have emerged with masterpieces that defy reason. I highly recommend this book to people who are stuck in the realm of thinking, and have yet to appreciate the beauty of what is beyond logic.', NULL),
(61, 1, 2, 'The Intelligent Investor', 550, 'English', 'Benjamin Graham', NULL, 'Used - Acceptable', NULL, 'Hardcover', 2, NULL, 'One key idea from the book is this: Unlike many people, who think that money in investment is made out of buying and selling of stocks, real money is actually made, as it has been done since the past, out of owning and holding securities. From these, one receives interest and dividends as well as increases in value.', NULL),
(63, 1, 2, 'The Hero with a Thousand Faces', 600, 'English', 'Joseph Campbell', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, 'According to the author, there is a pattern in the stories humankind has told time and time again since the ancient past. Stories about love where out of the many who have tried and failed, emerges a hero who would be able to defeat the hideous ogre, which may symbolize the dear damsel\'s parents, and triumphantly save the princess and be able to live together in everlasting bliss. But if so many have failed, how does the hero in fact do this incredible and seemingly insurmountable task?', NULL),
(64, 1, 2, 'The Seasons of a Woman\'s Life', 500, 'English', 'Daniel Levinson et al.', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, 'From the team that brought out the book, \"The Seasons of a Man\'s Life\", comes another notable work that provides a more or less general picture of the so-called \"seasons\" of a woman\'s life as she lives her 20s, 30s, and 40s. An impression that I got from this book is the difficult reality of simply living one\'s life, especially for women. It is indeed full of disappointments and heartaches, yet can be turned into triumphs where one emerges much stronger and less naive about the world and a woman\'s place in it.', NULL),
(65, 1, 2, 'A New Earth', 500, 'English', 'Eckhart Tolle', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, 'The author\'s message doesn\'t necessarily deviate from the one that is brought forth in eastern philosophy. And if from this book you are able to have a better appreciation of life and our world, with all the pain and imperfections that come along with it, then I believe that we\'ve gained one more peaceful person, and our world is so much better for it.', NULL),
(66, 1, 2, 'The Richest Man in Babylon', 300, 'English', 'George Clason', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, 'This book offers guidance to becoming wealthy. The lessons are brought out using stories revolving in the great ancient city of Babylon. I often find myself rereading and rereading this book to make sure that I am able to internalize what I\'ve learned. One key lesson from the book is the setting aside of no less than 10% of one\'s income. Even with only 10pesos saved everyday for 30 days you could already accumulate 300pesos! Afterwards, it is important to make your money work and earn more for you by investing it in honorable and trustworthy people who can keep safe the principal, yet provide you with adequate returns.', NULL),
(67, 1, 7, 'Full Metal Alchemist Manga set (1-27 complete)', 5700, 'Japanese', 'Hiromu Arakawa', NULL, 'Used - Very Good', NULL, 'Paperback', 1, NULL, NULL, NULL),
(68, 1, 7, 'Ranma Manga set (1-38 complete)', 7000, 'Japanese', 'Rumiko Takahashi', NULL, 'Used - Very Good', NULL, 'Paperback', 1, NULL, NULL, NULL),
(69, 1, 2, 'The Salmon of Doubt', 400, 'English', 'Douglas Adams', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, 'The author wrote a chapter on \"Tea\". This is what he has to say: \"Drink it. After a few moments you will begin to think that the place you\'ve come to isn\'t maybe quite so strange and crazy after all.\"', NULL),
(70, 1, 2, 'Banker to the Poor', 400, 'English', 'Muhammad Yunus', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, 'The author has said: \"Who has given the ultimate verdict that people are motivated only by money--that the desire to do great things for the world can\'t be just as powerful a driving force in human behavior?\"', NULL),
(71, 1, 2, 'Delivering Happiness', 500, 'English', 'Tony Hsieh', NULL, 'Used - Acceptable', NULL, 'Hardcover', 3, NULL, 'The author shares the story of how he and his team built the online store, Zappos.com, which was later acquired by Amazon.com. I found it interesting to realize that when everyone is selling the same products at more or less the same price, what would set the company apart would none other than be the customer experience or the company\'s customer service.', NULL),
(72, 1, 9, 'software kaihatsu gijutsusha 2008 ed', 2700, 'Japanese', 'nikkei BP company', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL, NULL, NULL),
(73, 1, 2, 'Surgeons Do Not Cry', 500, 'English', 'Ting Tiongco', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL, '\"Learn from the People\"', NULL),
(74, 1, 2, 'John L Gokongwei Jr', 500, 'English', 'Marites Khanser', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL, 'It was interesting for me to discover the life story of Mr. John Gokongwei Jr, and how he was able to build an empire from the ground-up. Moreover, a key data provided in the book is that the common business sectors of the top 3 Philippine Listed Holding Firms include: 1) Banking and Finance, 2) Hotels, Malls and Apartments, 3) Manufacturing, and 4) Real Estate and Property Development.', NULL),
(75, 1, 2, 'The Millionaire Next Door', 400, 'English', 'Thomas Stanley/William Danko', NULL, 'Used - Acceptable', NULL, 'Paperback', 5, NULL, 'Along with \"The Richest Man in Babylon\", this is a book that I often find myself rereading and rereading. A key idea from the book is the importance of frugality. Moreover, for a family to become financially independent, the wife has to be thriftier than her already thrifty husband.  ', NULL),
(76, 1, 2, 'Managing in a Time of Great Change', 500, 'English', 'Peter Drucker', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL, 'It has been said that the Japanese owe their success to running the modern corporation as a family. Peter Drucker adds that the overseas Chinese owe their success to running their family as a modern corporation.', NULL),
(77, 1, 2, 'Direct from Dell', 500, 'English', 'Michael Dell (with Catherine Fredman)', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL, 'Michael Dell shares the story of how he and his team built Dell Computer Corporation. I particularly liked the part about his company\'s early days, and how he started by buying cheap components and upgrading computers himself to sell them to customers at a much lower cost than resellers who simply bought assembled computers and sold them with an added overhead fee. Focusing on what customers actually want, instead of what a person thinks they want, is one of the many things that I learned from reading this book.', NULL),
(78, 1, 2, 'The HP Way', 500, 'English', 'David Packard', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL, '\"...the best job can be done when the manager has a genuine and thorough understanding of the work. I don\'t see how managers can even understand what standards to observe, what performance to require, and how to measure results unless they understand in some detail the specific nature of the work they are trying to supervise.\"', NULL),
(79, 3, 10, 'Noong Unang Panahon', 260, 'Filipino/English', ' Rafaelita Valera/Ghani Madueño', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Story by Rafaelita S. Valera.<br>Illustrations by Ghani Madueño.<br><br>How was the world created? Where did man come from? Read three legends, from the Samal, Ifugaw, and Tagalog and Visayan, that explain the origins of the world and mankind. Paano nilikha ang mundo? Saan nanggaling ang tao? Basahin ang tatlong alamat, mula sa...', NULL),
(80, 3, 10, 'Si Lurat, Kidhat, Pirok, ug Piyong', 260, 'Filipino/Cebuano', ' Virgilio S. Almario/Albert Gamos', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Story by Virgilio S. Almario.<br>Illustrations by Albert Gamos.<br><br>Once, four fishermen rowed their boat in a glass of water in search of a bright star. They were Open, Wink, Blink, and Close. Follow their exciting adventure as they go after their star. Diha kadto’y upat ka mangingisda nga namangka sa usa ka...', NULL),
(81, 3, 10, 'Can We Live Without Trees', 310, 'English', 'May Tobias-Papa/Fran Alvarez', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Text by May Tobias-Papa.<br>Illustrations by Fran Alvarez.<br><br>Here is a reference book about how important trees are to humans and all living things, how biologically diverse the Philippines is, and how we can help save our forests. Find out whether we can really live without trees. Narito ang isang sangguniang tungkol sa...', NULL),
(82, 3, 10, 'Florante at Laura', 360, 'Filipino', 'Francisco Balagtas/Virgilio S. Almario', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Written by Francisco Balagtas.<br>With annotations by Virgilio S. Almario<br><br>BAGONG SALIKSIK sa pagtuklas ng totoong teksto ni Balagtas, batay sa masinop na pagsusuri sa pinakamatandang edisyon ng Florante at Laura noong ika-19 siglo.', NULL),
(83, 3, 10, 'Displaced', 410, 'English', 'Aneka Rodriguez/Mitzi Villavecer', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Written by Aneka Rodriguez.<br>Illustrations by Mitzi Villavecer.<br><br>Elay is in her last year of high school. As if things weren’t complicated enough, her mother comes home after years of separation, and her best friend is not acting like a friend at all.<br><br>2012 NBDB Highly Recommended Supplementary Material', NULL),
(84, 3, 10, 'Mga Tala sa Dagat', 410, 'Filipino', 'Annette Acacio Flores/Nanoy Rafael', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, 'Nanoy Rafael', 'Written by Annette Acacio Flores<br>\r\nTranslated by Nanoy Rafael<br><br>\r\nIsang pag-iibigan ang nabuo sa pagitan ng prinsesa at isang mangingisda. Isang bata ang kailangang isuko ang paglalaro at pag-aaral, alang-alang sa pagiging pinakamahusay na mangingisda ng bayan. Nauugnay ang lahat ng ito ng isang pangako, isang pangako tungkol sa higanteng dagat na may mga dala-dalang mga tala.\r\n\r\nIto ang kuwento ng isang pamilya ng mga mangingisda at ng kanilang tadhanang nakatali sa dagat.', NULL),
(85, 3, 10, 'Ibong Adarna (Complete Text)', 410, 'Filipino', 'Virgilio S. Almario (Editor)', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Edited and annotated by Virgilio S. Almario<br><br>\r\n\r\nNarito ang orihinal na korido at buong kuwento ng Ibong Adarna. Bagong saliksik. Bagong pag-aaral. Dagdag na patnubay para sa guro at modernong mambabasa.', NULL),
(86, 3, 10, 'Si Janus Silang at ang Tiyanak ng Tabon', 335, 'Filipino', 'Edgar Calabia Samar', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Sa tournament ng TALA Online sa bayan ng Balanga, namatay ang lahat ng manlalaro maliban kay Janus. Sunod-sunod pa ang naging kaso ng pagkamatay ng mga kabataan sa computer shops sa iba’t ibang panig ng bansa. Kinontak si Janus ng nagpakilalang Joey, isa rin umano sa mga nakaligtas sa paglalaro ng TALA na gaya niya. Hindi inasahan ni Janus ang mga matutuklasan niya mula rito na mag-uugnay sa kanya sa misteryo ng kinahuhumalingan niyang RPG—at sa alamat ng Tiyanak mula sa Tábon!<br><br>\r\n2015 ﻿National Book Award, Novel in Filipino<br>\r\n2016 National Children\'s Book Award, Best Reads for Kids', NULL),
(87, 3, 10, 'Si Janus Silang at ang Labanang Manananggal-Mambabarang', 360, 'Filipino', 'Edgar Calabia Samar', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Apat na buwan na si Janus sa mansiyon nina Manong Joey sa Angono pero naroon pa rin ang sakit ng dilang-karayom ng manananggal sa puso niya dahil sa pagkawala ng mga mahal sa buhay at sapilitang paglayo kay Mica.\r\n\r\nSimula ng Christmas break nang mawasak ang proteksiyon ng mansiyon laban sa Tiyanak at sa mga kampon nito. Matinding barang ba ito? Nawawala rin si Mira, ang isa sa kambal na baganing kasing-edad ni Janus at inampon din nina Manong Joey. Ipinagtapat naman ni Renzo kay Janus ang matagal na palang sinusundan ni Manong Isyo: bumalik sa mapa ng utak ng dalawang manong ang brain imprint ng Papa ni Janus at maaaring buhay pa pala ito!\r\n<br><br>\r\nAdditional Information\r\nIkalawang libro sa serye ng Janus Silang', NULL),
(88, 3, 10, 'Buwan, Buwang Bulawan', 380, 'Filipino', 'Virgilio S. Almario/Abi Goy', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Poems by Virgilio S. Almario<br>\r\nWith illustrations by Abi Goy<br><br>\r\n\r\nA collection of poems for children, written by National Artist for Literature Rio Alma.\r\n<br><br>\r\nIsang koleksiyon ng mga tulang pambata ni Rio Alma, Pambansang Alagad ng Sining.', NULL),
(89, 3, 6, 'Light', 410, '(wordless)', 'Rob Cham', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Story and illustrations by Rob Cham<br><br>\r\nThis wordless comic book follows the exploits of a backpack-toting adventurer in a quest to find a mysterious treasure. Framed in black, the illustrations offer delightful bursts of color and are sure to entertain readers of any age.\r\n<br><br>\r\n2016 National Book Award, Best Book of Graphic Literature (Wordless)', NULL),
(90, 3, 6, 'Sixty Six', 435, 'Filipino', 'Russell Molina/Ian Sta. Maria', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Written by Russell Molina<br>\r\nIllustrated by Ian Sta. Maria<br><br>\r\nKuwento ni Celestino Cabal. Kabebertdey niya lang. Mayroon siyang natanggap na regalo na ngayo’y unti-unti niyang binubuksan. Ika nga ng matatanda, “Huli man daw at magaling, maihahabol din.”', NULL),
(91, 3, 7, 'Si Janus Silang at ang Tiyanak ng Tabon (Manga)', 410, 'Filipino', 'Edgar Calabia Samar/Carljoe Javier/Natasha Ringor', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Based on the novel by Edgar Calabia Samar<br>\r\nAdaptation by Carljoe Javier<br>\r\nIllustrations by Natasha Ringor<br><br>\r\n\r\nAng akala ni Janus, pangkaraniwang laro lang ang TALA Online. Sunod-sunod ang pagbabago sa buhay niya matapos ang kahindik-hindik na pangyayari sa RPG tournament sa sinalihan niya. Pero nang matuklasan niya ang tunay na kaugnayan ng larong ito sa alamat ng Tiyanak ng Tabon, wala na siyang magawa kundi ipagpatuloy ang paglalaro!', NULL),
(92, 3, 10, 'Detective Boys of Masangkay: Ang Mangkukulam', 435, 'Filipino', 'Bernalyn Hapin Sastrillo/Borg Sinaban', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Story by Bernalyn Hapin Sastrillo<br>\r\nIllustrations by Borg Sinaban<br><br>\r\nNawawala ang alagang pusa ni Ate Lotlot at ang alagang tuta ni Junjun. Ninakaw ang mga sinampay ni Aling Cora. Pinatay ang mga panabong na manok ni Mang Jimmy. Na-kidnap ang sikat na Shino Kid. May isang mangkukulam. May isang dalagitang bagong lipat.\r\n<br><br>\r\nMay tatlong binatilyong fans ni Detective Conan. Sila ang lulutas sa lahat ng misteryong bumabalot sa Barangay Masangkay.', NULL),
(93, 3, 10, 'Piagsugpatan: Stories of the Mandaya', 360, 'English', NULL, 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Retellings by Marcy Dans Lee<br>\r\nIllustrations by Marcy Dans Lee, Conrad Raquel, Aldy Aguirre, Teresa Escano<br><br>\r\nFor the Mandaya people, piagsugpatan or the horizon is a part of their lives. Piagsugpatan bridges the three material worlds: Langit, Lupa, at Ugsuban. In this book are eight stories that will help bridge the ancient Mandaya worldview with today’s young readers.', 90),
(94, 3, 10, 'Si Tito Libro at Ako', 360, 'Filipino', 'Uma Krishnaswami/Nanoy Rafael/JC Galag', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, 'Nanoy Rafael', 'Story by Uma Krishnaswami<br>\r\nTranslated by Nanoy Rafael<br>\r\nIllustrations by JC Galag<br><br>\r\nPlano ng siyam na taóng gulang na si Yasmin na makapagbasá ng isang libro kada araw, habambuhay. Palaging may tamang libro para sa kaniya si Tito Libro, ang may-ari ng aklatan sa kanto. Pero biglang ipinasara ang aklat ni Tito Libro at kailangang huminto ni Yasmin sa pagbabasa para tulungan siya. Ano nga ba ang magagawa ni Yasmin at ng kaniyang mga kaibigan sa gitna ng nalalapit na eleksiyon? Matutulungan kaya sila ng artistang si Samuel Karate na tumatakbong Mayor?', NULL),
(95, 3, 10, 'Supremo', 360, 'Filipino', 'Xi Zuq/Al Estrella ', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Story by Xi Zuq<br>\r\nWith illustrations by Al Estrella<br><br>\r\n“Supremo Andro!”<br><br>\r\n‘Yan ang gustong marinig ni Andro pagtuntong niya ng Grade 6. Kaya naisip niyang tumakbo bilang Supremo ng Katipunan.<br><br>\r\nHindi niya inakala na marami palang dapat gawin bago maging Supremo. Hindi niya inaasahan ang mga matututuhan niya bago maging pinuno.<br><br>\r\nMatupad kaya ang kaniyang pangarap na maging Supremo?<br><br>\r\n2016 National Children\'s Book Award, Best Reads for Kids', 105),
(96, 3, 10, 'Pangkat Papaya', 360, 'English', 'Xi Zuq/Al Estrella', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'APAKOPO APANG HAPARIPI SAPA IPISKUPUL.\r\n<br><br>\r\nIto ang secret code na nakita ni Andro sa poster para sa Clubs Day ng kanilang paaralan. Akala niya magagawa niyang tuklasin ito kasama ni Miyo. Na dapat ay kasama rin niya sa paghahanda ng booth nila sa Comics Club. Pero parang may iba kay Miyo, at may mga lihim pa itong hindi niya alam.\r\n<br><br>\r\nMatuklasan kaya niya ang mga lihim na ito?', 105),
(97, 3, 10, 'Ang Lihim ng San Esteban', 360, 'Filipino', 'Acacio Flores/Nanoy Rafael', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Story by Annette Acacio Flores<br>\r\nTranslation by Nanoy Rafael<br>\r\n<br><br>\r\nUnang beses magbabakasyon ni Jacobo sa San Esteban sa Ilocos, at magkahalong pananabik at kaba ang dala ng biyahe papunta sa probinsiya ng mga magulang niya. Siguradong marami siyang matutuklasan tungkol sa kasaysayan ng kaniyang pamilya mula kay Lola Carmen! Ngunit hindi niya inaasahang may mas malaking lihim sa mga lumang bahay at multo ng San Esteban. Ang mga ito kaya ang susi sa misteryong pilit na ikinukubli ni Lola Carmen?', 100),
(98, 3, 10, 'Can We Live on Mars', 310, 'English', 'Gidget Jimenez/Bru', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'At the rate that people are exploring space, will it take long before we actually start living on Mars? Discover the beginnings of astronomy, the different kinds of heavenly bodies, and the many space explorations taking place. Find out whether we can live on Mars.<br><br>\r\n2010 Best Reads for Kids, 1st National Children’s Book Awards', 40),
(99, 3, 10, 'Can We Drink the Ocean', 310, 'English', 'Gidget Jimenez/Isabel Roxas', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Text by Gidget Jimenez<br>\r\nIllustrations by Isabel Roxas<br>\r\n<br><br>\r\nIf 70 percent of the world is made up of water, why is everyone worrying about it running out? Discover the properties of water, along with its cycle, treatment, distribution, and how you can help conserve it. Find out whether we can drink the ocean.', 40),
(100, 3, 10, 'Can We Plug Into Lightning', 310, 'English', 'Gidget Jimenez/Beth Parrocha-Doctolero', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Text by Gidget Jimenez<br>\r\nIllustrations by Beth Parrocha-Doctolero<br>\r\n<br><br>\r\nThey say that lightning is made of electricity. Is that where the electricity of a light bulb comes from? Discover how a light bulb works, the sources of energy, how energy is changed to electricity, and how electricity travels to our home.', 40),
(101, 3, 10, 'Guardians of Tradition: The Gawad sa Manlilikha ng Bayan', 310, 'English', NULL, 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Text by Mae Astrid Tobias<br>\r\nIllustrations by Rommel Joson<br>\r\nPhotos by Renato S. Rastrollo<br>\r\n<br><br>\r\nJoin Banog and Kiko as they discover the Philippines’ National Living Treasures: Uwang Ahadas, Hadja Amina Appi, Ginaw Bilog, Federico Caballero, Lang Dulay, Masino Intaray, Salinta Monon, Eduardo Mutuc, Alonzo Saclag, Darhata Sawabi, and Samaon Sulaiman. Read about these people’s dedication to their craft and the tradition of their forebears.', 32),
(102, 3, 10, 'Handa Ako', 280, 'Filipino', NULL, 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Written by Liwliwa Malabed<br>\r\nIllustrated by Mia Lagos<br>\r\n<br><br>\r\nAno ang dapat gawin kapag may bagyo, lindol, sumabog na bulkan, o sunog? Ang aklat na ito ang maghahanda sa iyo sa anumang sakuna!', 44),
(103, 3, 10, 'Diksiyonaryong Adarna', 910, 'Filipino', 'Adarna House, Inc.', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'A Filipino dictionary for high school, Diksiyonaryong Adarna was created to be the partner of students in their study of Philippine language and literature. It contains unfamiliar words found in El Filibusterismo, Noli Me Tangere, and Florante at Laura. To make it easier to understand, main entries also include sample sentences. It also contains entries that represent art, culture, and local beliefs of the different ethnic groups in the Philippines. Apart from being an instrument towards discovering how rich the Filipino language is, Diksiyonaryong Adarna also aims to instill in students a love for their own language.', 800),
(104, 3, 10, 'What Kids Should Know About Andres and the Katipunan', 310, 'English', NULL, 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Author: Weng Cahiles<br>\r\nIllustrator: Isa Natividad<br>\r\n<br><br>\r\nWho was Andres Bonifacio? How was Andres as a brother, a husband, and as a revolutionary leader? Here is a handy reference for children on the life of the Supremo and the Katipunan.\r\n<br><br>\r\n2014 Best Read for Kids, 3rd National Children’s Book Awards', 48),
(105, 3, 6, 'Piko', 410, 'Filipino/English', 'Josel Nicolas (Editor) et al.', 'Adarna House, Inc.', 'New', NULL, 'Paperback', 99, NULL, 'Edited by Josel Nicolas\r\n<br><br>\r\nA Filipino comic book for kids, this is a collection of 20 visual stories from 22 creators.\r\n<br><br>\r\nAwit ng Paggala (Laraine Gazmen & Adam David)<br>\r\nCaptain Old vs Pambatang Komiks (Josel Nicolas)<br>\r\nDressing Up with Dolly (Trizha Ko)<br>\r\nThe Sculptor (Rommel Estanislao)<br>\r\nLimang Kuwentong _ _ _ _ _ (Marlon Hacla & Apol Sta. Maria)<br>\r\nAng Panaginip ni Benjo Bato (Josel Nicolas)<br>\r\nLucky (Julius Villanueva)<br>\r\nIñigo’s Day Out (Adam David & Mervin Malonzo)<br>\r\nSalamin (Josel Nicolas)<br>\r\nKukote Ko (Rob Cham with Karize Uy)<br>\r\nThe Magic Brush (Daniela Go)<br>\r\nTreat (Joanne Cesario & Michelle Bacabac)<br>\r\nImposible (JP Palabon)<br>\r\nHotcakes X Jimbob at ang Ulan (Josel Nicolas)<br>\r\nSi Ella at ang Sigwa (Manix Abrera, Kyth Pallogan, & Karize Uy)<br>\r\nAng Kahon (Bong Redila)<br>\r\nSalamin Part 2 (Josel Nicolas)<br>\r\nAwit ng Pagbalik (Adam David & Laraine Gazmen)', 96);

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `product_type_id` int(11) NOT NULL,
  `product_type_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`product_type_id`, `product_type_name`) VALUES
(1, 'All'),
(2, 'Books'),
(3, 'Beverages'),
(4, 'Books/Beverages'),
(5, 'Promos'),
(6, 'Comics'),
(7, 'Manga'),
(8, 'Toys & Collectibles'),
(9, 'Textbooks'),
(10, 'Children\'s');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_order_id` (`customer_order_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `mode_of_payment_id` (`mode_of_payment_id`);

--
-- Indexes for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD PRIMARY KEY (`customer_order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`fields_id`),
  ADD KEY `product_type_id` (`product_type_id`);

--
-- Indexes for table `merchant`
--
ALTER TABLE `merchant`
  ADD PRIMARY KEY (`merchant_id`);

--
-- Indexes for table `mode_of_payment`
--
ALTER TABLE `mode_of_payment`
  ADD PRIMARY KEY (`mode_of_payment_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `merchant_id` (`merchant_id`),
  ADD KEY `product_type_id` (`product_type_id`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`product_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `customer_order`
--
ALTER TABLE `customer_order`
  MODIFY `customer_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `fields_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `merchant`
--
ALTER TABLE `merchant`
  MODIFY `merchant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mode_of_payment`
--
ALTER TABLE `mode_of_payment`
  MODIFY `mode_of_payment_id` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `product_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `cart_ibfk_3` FOREIGN KEY (`customer_order_id`) REFERENCES `customer_order` (`customer_order_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`mode_of_payment_id`) REFERENCES `mode_of_payment` (`mode_of_payment_id`);

--
-- Constraints for table `customer_order`
--
ALTER TABLE `customer_order`
  ADD CONSTRAINT `customer_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fields_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`product_type_id`);

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
