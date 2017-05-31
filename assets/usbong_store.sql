BEGIN;
CREATE TABLE fields (
  fields_id INTEGER PRIMARY KEY,
  fields_name TEXT,
  product_type_id INTEGER
); 

INSERT INTO fields (fields_id, fields_name, product_type_id) VALUES
(1, 'name', 1),
(2, 'price', 1),
(3, 'supplier', 1),
(4, 'description', 1),
(5, 'image_location', 1),
(6, 'author', 2),
(7, 'language', 2);

CREATE TABLE merchant (
  merchant_id INTEGER PRIMARY KEY,
  merchant_name TEXT,
  merchant_motto TEXT,
  merchant_motto_font_color TEXT
); 

INSERT INTO merchant (merchant_id, merchant_name, merchant_motto, merchant_motto_font_color) VALUES
(1, 'Usbong Specialty Bookstore', 'Uplifting Human Lives', '#6f5630'),
(2, 'RetroCC', 'Keep Reading.<br>Keep Collecting.', '#FFFFFF');

CREATE TABLE product (
  product_id INTEGER PRIMARY KEY,
  merchant_id INTEGER,
  product_type_id INTEGER,
  name TEXT,
  price INTEGER,
  language TEXT,
  author TEXT,
  supplier TEXT,
  description TEXT,
  image_location TEXT,
  format TEXT,
  quantity_in_stock INTEGER,
  translator TEXT
); 

INSERT INTO product (product_id, merchant_id, product_type_id, name, price, language, author, supplier, description, image_location, format, quantity_in_stock, translator) VALUES
(1, 1, 2, 'The Remains of the Day', 400, 'English', 'Kazuo Ishiguro', NULL, 'Used - Acceptable', NULL, 'Hardcover', 0, ''),
(2, 1, 2, 'The Daydreamer', 400, 'English', 'Ian McEwan', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, ''),
(3, 1, 2, 'Myths to Live By', 400, 'English', 'Joseph Campbell', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, ''),
(4, 1, 2, 'The Seasons of a Man''s Life', 500, 'English', 'Daniel Levinson et al.', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, ''),
(5, 1, 2, 'The Last Lecture', 400, 'English', 'Randy Pausch et al.', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, ''),
(6, 1, 2, 'The Innovators', 600, 'English', 'Walter Isaacson', NULL, 'Used - Very Good', NULL, 'English', 0, ''),
(7, 1, 2, 'Steve Jobs', 500, 'English', 'Walter Isaacson', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, ''),
(8, 1, 2, 'Tokyo University''s English', NULL, 'Japanese/English', 'Masafumi Satou', NULL, NULL, NULL, 'Paperback', 0, ''),
(9, 1, 2, 'Siddhartha', 250, 'English', 'Herman Hesse', NULL, 'Used - Very Good', NULL, 'Paperback', 0, ''),
(10, 1, 2, 'The Montessori Method', 400, 'English', 'Maria Montessori', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, ''),
(11, 1, 2, 'The Soul of a New Machine', 400, 'English', 'Tracy Kidder', NULL, 'Used - Acceptable', NULL, 'Hardcover', 0, ''),
(12, 1, 2, 'Outliers: The Story of Success', 400, 'English', 'Malcolm Gladwell', NULL, 'Used - Acceptable', NULL, 'Hardcover', 0, ''),
(13, 1, 2, 'Guns, Germs, and Steel', 500, 'English', 'Jared Diamond', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, ''),
(14, 1, 2, 'The Tao of Pooh', 300, 'English', 'Benjamin Hoff', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, ''),
(15, 1, 2, 'The Different Drum', 400, 'English', 'M. Scott Peck, M.D.', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, ''),
(16, 1, 2, 'The Lives of a Cell', 250, 'English', 'Lewis Thomas', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, ''),
(17, 1, 2, 'The Plague', 400, 'English', 'Albert Camus', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, ''),
(18, 1, 2, 'Living Language: French', 500, 'English', 'Anne Heminway', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, ''),
(19, 1, 2, 'Starting Point, 1979-1996', 850, 'English', 'Hayao Miyazaki', NULL, 'New', NULL, 'Paperback', 0, 'Beth Cary/Frederik L. Schodt'),
(20, 1, 2, 'Turning Point, 1997-2008', 1400, 'English', 'Hayao Miyazaki', NULL, 'New', NULL, 'Hardcover', 0, 'Beth Cary/Frederik L. Schodt'),
(21, 1, 2, 'Made in Japan', 400, 'English', 'Akio Morita', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, 'Edwin M. Reingold/Mitsuko Shimomura'),
(22, 1, 2, 'Wikinomics', 400, 'English', 'Don Tapscott/Anthony Williams', NULL, 'Used - Acceptable', NULL, 'Hardcover', 0, NULL),
(23, 1, 2, 'The Dancing Wu Li Masters', 400, 'English', 'Gary Zukav', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL),
(24, 1, 2, 'Le Petit Prince', 400, 'French', 'Antoine de Saint-Exupéry', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL),
(25, 1, 2, 'Founders at Work', 500, 'English', 'Jessica Livingston', NULL, 'Used - Acceptable', NULL, 'Hardcover', 0, NULL),
(26, 1, 2, 'Standard First Aid & Personal Safety', NULL, 'English', 'American Red Cross', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL),
(27, 1, 2, 'HSK Level 5 Sample Exam', NULL, 'Mandarin/Japanese', '孔子学院总部/国家汉办', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, '株式会社スプリックス'),
(28, 1, 3, 'M&S Earl Grey Tea', 420, 'English', NULL, NULL, NULL, NULL, NULL, 0, NULL),
(29, 1, 3, 'UCC Coffee (Rich Blend)', 580, 'Japanese', NULL, NULL, NULL, NULL, NULL, 0, NULL),
(30, 1, 3, 'sencha (Green Tea)', 420, 'Japanese', NULL, NULL, NULL, NULL, NULL, 0, NULL),
(31, 1, 5, 'COMBO-Le Petit Prince, Living Language French, The Plague', 1250, 'French/English', 'Saint-Exupéry, Heminway, Camus', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL),
(32, 1, 5, 'COMBO-Wikinomics, Guns, Germs, and Steel, The Soul of a New Machine, The Different Drum', 1650, 'English', 'Tapscott/Williams, Diamond, Kidder, Peck', NULL, 'Used - Acceptable', NULL, 'Mixed', 0, NULL),
(33, 1, 5, 'COMBO-Made in Japan, The Soul of a New Machine, Founders at Work, Outliers', 1650, 'English', 'Morita et al., Kidder, Gladwell, Livingston', NULL, 'Used - Acceptable', NULL, 'Mixed', 0, NULL),
(34, 1, 5, 'COMBO-Starting Point, Turning Point', 2200, 'English', 'Hayao Miyazaki', NULL, 'New', NULL, 'Mixed', 0, 'Beth Cary and Frederik L. Schodt'),
(35, 1, 5, 'COMBO-Steve Jobs, The Innovators', 1050, 'English', 'Walter Isaacson', NULL, 'Used - Very Good', NULL, 'Paperback', 0, NULL),
(36, 2, 5, 'COMBO-ACTION COMICS 1-52 (complete set)', 8000, 'English', NULL, NULL, 'new, 1-52 + extras, VF-NM', NULL, NULL, 0, NULL),
(37, 2, 5, 'COMBO-Silver Surfer vol 1 (complete set)', 32000, 'English', NULL, NULL, '1-18, VG-F', NULL, NULL, 0, NULL),
(38, 2, 5, 'COMBO-Batman Superman set', 3000, 'English', NULL, NULL, '1-31, annual 1-2, future''s end 1, missing issue 32, VF-NM', NULL, NULL, 0, NULL),
(39, 2, 5, 'COMBO-ULTIMATE FALL OUT set', 1800, 'English', NULL, NULL, 'ultimate fallout 1-6, issue 4 1st appearance miles morales, death of spider-man 2nd print, VF-NM', NULL, NULL, 0, NULL),
(40, 2, 5, 'COMBO-KLAUS boom studios', 1200, 'English', NULL, NULL, 'complete set 1-7, VF-NM', NULL, NULL, 0, NULL),
(41, 2, 5, 'COMBO-Empire of the Dead', 1500, 'English', NULL, NULL, 'complete 1st arc, 1-5, VF', NULL, NULL, 0, NULL),
(42, 2, 5, 'COMBO-Fairest (complete set)', 4000, 'English', NULL, NULL, 'VF', NULL, NULL, 0, NULL),
(43, 2, 5, 'COMBO-Batman and Robin New 52 set', 6000, 'English', NULL, NULL, 'complete set of batman and robin new 52, VF-NM', NULL, NULL, 0, NULL);

CREATE TABLE product_type (
  product_type_id INTEGER PRIMARY KEY,
  product_type_name TEXT
); 

INSERT INTO product_type (product_type_id, product_type_name) VALUES
(1, 'all'),
(2, 'books'),
(3, 'beverages'),
(4, 'books/beverages'),
(5, 'combos'),
(6, 'comics'),
(7, 'manga');


COMMIT;