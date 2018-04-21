
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
(2, 'RetroCC', 'Keep Reading.<br>Keep Collecting.', '#FFFFFF'),
(3, 'Adarna House, Inc', 'Una sa Filipino', '#4f4c41'),
(4, 'Usbong Mart', 'Uplifting Human Lives', '#6f5630'),
(5, 'Marikina Orthopedic Specialty Clinic', 'Marikina Orthopedic Specialty Clinic', '#4f4c41'),
(6, 'Pinoydrones', 'We don''t just sell drones, We sell an experience.', '#FFFFFF');


CREATE TABLE product (
  product_id INTEGER PRIMARY KEY,
  merchant_id INTEGER,
  product_type_id INTEGER,
  name TEXT,
  price INTEGER,
  previous_price INTEGER,
  language TEXT,
  author TEXT,
  supplier TEXT,
  description TEXT,
  image_location TEXT,
  format TEXT,
  quantity_in_stock INTEGER,
  translator TEXT,
  product_overview TEXT,
  pages INTEGER,
  product_view_num INTEGER,
  quantity_sold INTEGER,
  external_url TEXT,
  show INTEGER,
  publisher TEXT,
  released_date TEXT,
  is_essential_reading INTEGER
); 

INSERT INTO product (product_id, merchant_id, product_type_id, name, price, previous_price, language, author, supplier, description, image_location, format, quantity_in_stock, translator, product_overview, pages, product_view_num, quantity_sold, external_url, show, publisher, released_date, is_essential_reading) VALUES
(1, 1, 2, 'The Remains of the Day', 400, NULL, 'English', 'Kazuo Ishiguro', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, '', 'The novelist, Kazuo Ishiguro, has said, ''''A novel may not give us facts that are true, [but] what it tells us about experience, the emotion that it conveys, is something that we recognize as true. And sometimes, very important emotions, feelings are conveyed in a novel that cannot be conveyed in more factual stories, or in factual books. I think most importantly, perhaps, a key to it, I think, a novel can tell us how it feels to be in a certain situation. A work of history or journalism can tell us that some people starved in a particular time and place. But, perhaps, it cannot convey the pain of starving, or losing someone close to you or your child to starvation... We need someone to tell us how it felt... Is it true that it feels like that to be in that situation, or is this not true? I think we still have to ask that question. But I think that''s why we turn to stories, because we feel there''s something missing in just the factual account.''''', NULL, 42, 0, NULL, 1, NULL, NULL, 0),
(2, 1, 2, 'The Daydreamer', 400, NULL, 'English', 'Ian McEwan', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'While we know ''''Google'''' as the search engine giant, Peter, the protagonist in this book, discovered ''''Googol'''', which is pronounced somewhat similarly, while thinking about the largest number in the world. A ''''Googol'''' is ten multiplied by ten a hundred times. Moreover, ''''Googolplex'''' is ten multiplied by ten a googol number of times! But what I really remember about this book is the story about how Peter became friends with the school bully by realizing that he and his classmates only dreamed him up to be strong and powerful, because in reality, he is a nice, ordinary little boy just like any of them.', NULL, 24, 0, NULL, 1, NULL, NULL, 0),
(3, 1, 2, 'Myths to Live By', 400, NULL, 'English', 'Joseph Campbell', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'Here is a quotation from the book, which you are free to agree or disagree. ''''All societies are evil, sorrowful, inequitable； and so they will always be. So if you really want to help this world, what you will have to teach is how to live in it. And that no one can do who has not himself learned how to live in it in the joyful sorrow and sorrowful joy of the knowledge of life as it is.''''', NULL, 26, 0, NULL, 1, NULL, NULL, 0),
(4, 1, 2, 'The Seasons of a Man''s Life', 500, NULL, 'English', 'Daniel Levinson et al.', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'This book provides a more or less general picture of the so-called ''''seasons'''' of a man''s life. It shows examples of various men who set out to realize their dream or ideal life, only to discover later in life that they must confront and eventually accept the reality that they may not be able to actually fulfill that initial dream. One example that I can remember is the academic who wanted to receive recognition for his work by receiving the Nobel prize, but to his great disappointment was beaten to it by a rival group. He later found solace in providing mentorship to the younger generation of scientists in his field.', NULL, 35, 0, NULL, 1, NULL, NULL, 0),
(5, 1, 2, 'The Last Lecture', 400, NULL, 'English', 'Randy Pausch et al.', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'While the ''''Last Lecture'''' doesn''t necessarily mean that it''s a professor''s last lecture, and is simply a way for senior professors at Carnegie Mellon University to share wisdom to younger students and faculty, for Randy Pausch, it really was somewhat of a last lecture, because he was already grappling with pancreatic cancer and his chance of survival was low. This book offers his insights about living.', NULL, 23, 0, NULL, 1, NULL, NULL, 0),
(6, 1, 2, 'The Innovators', 600, NULL, 'English', 'Walter Isaacson', NULL, 'Used - Very Good', NULL, 'Paperback', 1, '', 'This book chronicles the many people who contributed to the development of an important tool that is the computer and the many innovations that went with it. It was interesting for me to discover glimpses of inventors as humans, working together to build things that would amplify even further their capabilities and shape the world forever. ', NULL, 38, 0, NULL, 1, NULL, NULL, 0),
(7, 1, 2, 'Steve Jobs', 500, NULL, 'English', 'Walter Isaacson', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'This book offers glimpses of Steve Jobs'' life as a human person, warts and all. I particularly liked discovering that despite the wealth that he was able to accumulate in his life, he decided that he didn''t want to change his simple, yet efficient lifestyle, only for the sake of being able to live the rich life that is glamorized by media. <br><br> p.s. I like the iPAD + pencil combo.', NULL, 26, 0, NULL, 1, NULL, NULL, 0);


CREATE TABLE product_type (
  product_type_id INTEGER PRIMARY KEY,
  product_type_name TEXT
); 

INSERT INTO product_type (product_type_id, product_type_name) VALUES
(1, 'All'),
(2, 'Books'),
(3, 'Beverages'),
(4, 'Books/Beverages'),
(5, 'Promos'),
(6, 'Comics'),
(7, 'Manga'),
(8, 'Toys & Collectibles'),
(9, 'Textbooks'),
(10, 'Children''s'),
(11, 'Food'),
(12, 'Miscellaneous'),
(13, 'Medical');

COMMIT;