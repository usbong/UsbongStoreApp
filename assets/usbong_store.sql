
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
(1, 1, 2, 'The Remains of the Day', 400, NULL, 'English', 'Kazuo Ishiguro', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, '', 'The novelist, Kazuo Ishiguro, has said, ''''A novel may not give us facts that are true, [but] what it tells us about experience, the emotion that it conveys, is something that we recognize as true. And sometimes, very important emotions, feelings are conveyed in a novel that cannot be conveyed in more factual stories, or in factual books. I think most importantly, perhaps, a key to it, I think, a novel can tell us how it feels to be in a certain situation. A work of history or journalism can tell us that some people starved in a particular time and place. But, perhaps, it cannot convey the pain of starving, or losing someone close to you or your child to starvation... We need someone to tell us how it felt... Is it true that it feels like that to be in that situation, or is this not true? I think we still have to ask that question. But I think that''s why we turn to stories, because we feel there''s something missing in just the factual account.''''', NULL, 42, 0, NULL, 1, NULL, NULL, 0);

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