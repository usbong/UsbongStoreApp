
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
(7, 1, 2, 'Steve Jobs', 500, NULL, 'English', 'Walter Isaacson', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'This book offers glimpses of Steve Jobs'' life as a human person, warts and all. I particularly liked discovering that despite the wealth that he was able to accumulate in his life, he decided that he didn''t want to change his simple, yet efficient lifestyle, only for the sake of being able to live the rich life that is glamorized by media. <br><br> p.s. I like the iPAD + pencil combo.', NULL, 26, 0, NULL, 1, NULL, NULL, 0),
(8, 1, 9, 'Tokyo University''s English', 1000, NULL, 'Japanese/English', 'Masafumi Satou', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, '', 'While this book is intended for Japanese students who''ll be taking the Tokyo University entrance exam, it can be used by Japanese language learners as well. The sample readings are in English, while the translation and explanations are in Japanese. The articles are also quite interesting. I particularly remember the one about how our hopes and fears are ''''often illusions promising to change our way of life, but leaving us exactly as we were before.''''', NULL, 48, 0, NULL, 1, NULL, NULL, 0),
(9, 1, 2, 'Siddhartha', 300, NULL, 'English', 'Hermann Hesse', NULL, 'Used - Very Good', NULL, 'Paperback', 1, '', 'This story relates the transitions a person undertook to achieve the state of everlasting peace. He first lived the life of a scholar, and then became an ascetic, and then a merchant, and then a boatman. I found it particularly interesting to learn how an ascetic could become a merchant. As it turns out, having the ability to read and write, as well as the patience to wait and fast, instead of having to seek any kind of work due to being driven by hunger, proved useful to this transition. Another key idea that I got from the book is that there are things that cannot be taught in words, but must truly be experienced for another person to understand.', NULL, 44, 0, NULL, 1, NULL, NULL, 1),
(10, 1, 2, 'The Montessori Method', 400, NULL, 'English', 'Maria Montessori', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'The first dawn of real discipline comes through action. When a child has learned to respond naturally through action that is aimed towards an objective, that is, action that is no longer erratic, he is no more the child that he was at first, but an individual. When, further, he has freed himself from being dependent on others due to his own inferiority, he has overcome himself and the limits of his age, and has made a great step forward by conquering his future while in the present.', NULL, 39, 0, NULL, 1, NULL, NULL, 1),
(11, 1, 2, 'The Soul of a New Machine', 400, NULL, 'English', 'Tracy Kidder', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, '', 'What is the soul of a new machine? It is the collective soul etched in silicon and microcode of a team of dedicated engineers who brought the machine to life. In the end, ''''It''s just a computer. It''s really a small thing in the world, you know.''''', NULL, 37, 0, NULL, 1, NULL, NULL, 0),
(12, 1, 2, 'Outliers: The Story of Success', 400, NULL, 'English', 'Malcolm Gladwell', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, '', 'There are two things that make rice farming meaningful. First, there is a clear relationship between effort and reward, in that the harder you work a rice field, the more it yields. Second, its complexity is akin to running a small business that is composed of a family workforce, who must hedge uncertainty through seed selection, building and managing a sophisticated irrigation system, and at the same time coordinating the complicated process of crop harvesting and crop preparation.', NULL, 28, 0, NULL, 1, NULL, NULL, 0),
(13, 1, 2, 'Guns, Germs, and Steel', 500, NULL, 'English', 'Jared Diamond', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, '<p>Where do innovations actually come from? As it turns out, much technology is not invented solely locally and is not done by a lone individual. Instead, it is borrowed from other societies and from other inventors who''ve gone before. The spread of useful invention depends on whether a society that learns about it is receptive to it and adopts it. Societies lacking the invention often find themselves at a disadvantage in relation to the receptive society, even becoming overwhelmed and replaced if the disadvantage is sufficiently great.</p><p>技术革新是从哪里来的？ 原来，许多技术不是国内独立发明的，也不是一个人做的。反而，是从别的社会与上一代的发明家借的。推广有用的发明在于观察社会是否接受，採用它。缺发明的社会常对接受社会不利，而若太差，被压倒也替换。</p>', NULL, 34, 0, NULL, 1, '', '', 1),
(14, 1, 2, 'The Tao of Pooh', 300, NULL, 'English', 'Benjamin Hoff', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'To Laozi, the universe was not a setter of traps, but a teacher of valuable lessons. While it would be arrogant to attempt to adequately put how the universe operates into words, its nature could be understood. And the natural result of being able to appreciate, learn from, and work with whatever happens in everyday life is happiness.', NULL, 35, 0, NULL, 1, NULL, NULL, 1),
(15, 1, 2, 'The Different Drum', 400, NULL, 'English', 'M. Scott Peck, M.D.', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'The reality of human nature is that we are all profoundly different. This is due to our capacity to be molded by culture and experience in extremely variable ways. At the same time, it is this same capacity that opens the way for all of us to *transformation*, which paradoxically, is both the basic cause of war and the basic cure for war.', NULL, 49, 0, NULL, 1, NULL, NULL, 1),
(16, 1, 2, 'The Lives of a Cell', 300, NULL, 'English', 'Lewis Thomas', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'The sky is a miraculous achievement. It is, after all, far and away the grandest product of collaboration in all of nature. Earth would not be alive as we know it without such cooperation. Moreover, the shelter it provides prevents millions of meteorites from pounding us like the powdered surface of the moon. While we may not be sensitive enough to hear it, we find solace in knowing that the sound is there above, ''like the random noise of rain on the roof at night.''', NULL, 35, 0, NULL, 1, NULL, NULL, 1),
(17, 1, 2, 'The Plague', 400, NULL, 'English', 'Albert Camus', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'The town of Oran is hit by a devastating plague. Everyone is locked in the town. Nobody comes in, nobody goes out. Gripped by this circumstance, the people are challenged to confront their strongly held beliefs. Meanwhile, a group of tenacious men and women work together to fight the plague, hoping that they''ll eventually figure out a cure to put an end to it. Eventually, indeed, the plague is brought to a stop. But how? Could it be divine intervention? It''s not what you think.', NULL, 37, 0, NULL, 1, NULL, NULL, 1),
(18, 1, 2, 'Living Language: French', 500, NULL, 'English', 'Anne Heminway', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, '', 'While the book may be dated, e.g. the currency is not in euros, I found the sequence of chapters relevant to one who is learning French. The chapters start with a dialogue, then an explanation of certain grammar points, then some exercises, and finally a cultural note, which all provide a much better glimpse of French culture. Using tools like Google Translate to help you with the pronunciation, you should be able to gradually learn to speak, read, and understand French as you go through this book.', NULL, 40, 0, NULL, 1, NULL, NULL, 0),
(19, 1, 2, 'Starting Point, 1979-1996', 850, NULL, 'English', 'Hayao Miyazaki', NULL, 'New', NULL, 'Paperback', 1, 'Beth Cary/Frederik L. Schodt', 'I first got a copy of this book (Japanese version) while studying in Japan as an exchange student. I wanted to eventually be able to read it in the original. About 10 years later, I was indeed able to read the chapter on ''''Animation and Manga Movies''''. It was a pleasant surprise that my Japanese language ability had improved to the extent that I could already read such texts. I then translated the chapter for my class on Japanese Films. Having said this, it is still fun even now to just randomly flip a page and read insights from MiyazakiSAN.', NULL, 33, 1, NULL, 1, NULL, NULL, 0),
(20, 1, 2, 'Turning Point, 1997-2008', 1400, NULL, 'English', 'Hayao Miyazaki', NULL, 'New', NULL, 'Hardcover', 1, 'Beth Cary/Frederik L. Schodt', 'I first got a copy of the first book, ''''Starting Point, 1979-1996 (Japanese version)'''', while studying in Japan as an exchange student. I wanted to eventually be able to read it in the original. About 10 years later, I was indeed able to read the chapter on ''''Animation and Manga Movies''''. It was a pleasant surprise that my Japanese language ability had improved to the extent that I could already read such texts. I then translated the chapter for my class on Japanese Films. Not long after, I got a copy of this book in the original Japanese. It is indeed fun to just randomly flip a page and read insights from MiyazakiSAN.', NULL, 30, 0, NULL, 1, NULL, NULL, 0),
(21, 1, 2, 'Made in Japan', 400, NULL, 'English', 'Akio Morita et al.', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, 'Edwin M. Reingold/Mitsuko Shimomura', 'Here''s my English translation of an excerpt taken from an interview with Akio Morita on NHK''s 「あの人に会いたい」(I want to meet that person).<br> 「私は日本製品を売ろうとしていたが、 ドイツ人の目にはこの傘が日本製品を象徴していると」''''I was trying to sell Japanese products, but in the eyes of Germans, Japanese products were small umbrellas that are put on top of ice creams!''''<br> 「この傘がメイドインジャパンだったわけです」 ''''This umbrella represented products made in Japan.''''<br> 「それ以来、私はメイドインジャパンのイメージを変えなければと一生懸命やってきた」 ''''After that, I did my very best to change the ''Made in Japan'' image.''''', NULL, 32, 0, NULL, 1, NULL, NULL, 1),
(22, 1, 2, 'Wikinomics', 400, NULL, 'English', 'Don Tapscott/Anthony Williams', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, NULL, 'This book provides an optimistic view on how technology, particularly the internet, is enabling people to massively collaborate. While we know that technology is a double-edged sword, that is, it can be used for good or ill depending on its wielder, one is left with a positive and optimistic feeling that things are getting better instead of worse after reading this book. ', NULL, 36, 0, NULL, 1, NULL, NULL, 0),
(23, 1, 2, 'The Dancing Wu Li Masters', 400, NULL, 'English', 'Gary Zukav', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, 'This book is a must-read for anyone who wants to understand Physics, that is, not the Physics that students commonly learn in school, where there are equations that one must solve in a sort of computer-like way, without really understanding deeply what kind of thinking and perspective brought about those equations in the first place. One question that this book asks is, what is a living thing? If we break down a human person into very, very tiny, little pieces, we''ll find that a rock is made up of those very tiny, little pieces as well. And yet, we do not call a rock a living thing. Why is that? Eventually, if you continue asking such questions, you''ll arrive with the answer that we don''t know. And the book concludes with an invitation to an opening towards eastern culture. ', NULL, 31, 0, NULL, 1, NULL, NULL, 1),
(24, 1, 10, 'Le Petit Prince', 320, 400, 'French', 'Antoine de Saint-Exupéry', NULL, 'Used - Acceptable', NULL, 'Paperback', 1, NULL, 'This book''s often quoted phrase, «On ne voit bien qu''avec le cœur. L''essentiel est invisible pour les yeux.  (We can only see well with our hearts. What is essential is invisible to the eye.)» reminds us that a person can be vain, difficult, and demanding, but it is the quality time that we spent for that person that makes him or her special and unique from all the other persons in the world.', NULL, 165, 0, NULL, 1, NULL, NULL, 1),
(25, 1, 2, 'Founders at Work', 500, NULL, 'English', 'Jessica Livingston', NULL, 'Used - Acceptable', NULL, 'Hardcover', 1, NULL, 'Reading this book gives a person an idea of what founders of startups had to undergo to be able to achieve what they''ve achieved. It contains interviews upon interviews of founders of companies that even now we still recognize and whose services we still use. I hope that this book gives you a better appreciation and respect for company founders, and inspires you to become one someday.', NULL, 44, 0, NULL, 1, NULL, NULL, 1),
(26, 1, 2, 'Standard First Aid & Personal Safety', 500, NULL, 'English', 'American Red Cross', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, NULL, 'While there are copies of First Aid guides, which a person can download free-of-charge online, this printed copy shows ways of how an ordinary person, without having to prescribe any medicine, can provide first aid when needed. Examples include applying various bandages, positioning a person in certain ways, and so on. What is most important, however, is achieving a calm and tranquil state of mind to act and do what must be done even during times of accidents or disaster. Hopefully, this book helps you attain such a state of presence.', NULL, 30, 0, NULL, 1, NULL, NULL, 1),
(27, 1, 9, 'HSK Level 5 Sample Exam', 1500, NULL, 'Mandarin/Japanese', 'Confucius Institute (Hanban)', NULL, 'Used - Acceptable', NULL, 'Paperback', 0, '株式会社スプリックス', 'This book is a good learning tool not only for those who''ll be taking the HSK Level 5 exam, but also those who simply enjoy reading interesting texts or articles from a variety of fields. The texts are in Mandarin (Simplified), while the translation and explanations are in Japanese. One story that I remember from this book is the one about the business man, his son, and their donkey. The lesson it shared was that it is difficult to please everybody. And if you mistakenly think that you can satisfy everyone, you''ll realize that you won''t be happy and the people you wanted to satisfy won''t be satisfied either. ', NULL, 31, 0, NULL, 1, NULL, NULL, 0),
(28, 4, 3, 'M&S Earl Grey Tea', 295, NULL, 'English', NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Douglas Adams has this to say about tea. It is from the chapter on ''''Tea'''' from the book, <b><a href=\\''https://store.usbong.ph/w/The-Salmon-of-Doubt-Douglas-Adams/69\\''>The Salmon of Doubt</a></b>. ''''Drink it. After a few moments you will begin to think that the place you''ve come to  isn''t maybe quite so strange and crazy after all.''''', NULL, 65, 0, NULL, 1, NULL, NULL, 0);



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