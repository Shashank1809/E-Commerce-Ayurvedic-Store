CREATE TABLE admin (
	id int(11) auto_increment primary key,
  	name varchar(255) NOT NULL,
  	email varchar(255) NOT NULL,
  	password varchar(255) NOT NULL,
  	phone varchar(10) NOT NULL
);

INSERT INTO admin (name, email, password, phone) VALUES
('Shashank Jagtap', 'admin@gmail.com', 'admin@2024', '9146986890');

CREATE TABLE brand(
	id int(11) auto_increment primary key,
	brandName varchar(255) NOT NULL,
	brandDescription text NOT NULL,
	brandAddress varchar(255) NOT NULL
);

INSERT INTO brand(brandName, brandDescription, brandAddress) VALUES
('NURALZ','Nuralz is an Ayurveda division of Vibcare Pharma and Nuralz runs on the same ideology. All of Nuralz products are manufactured in WHO-GMP Certified Facilities to provides you the best quality Ayurveda products available in the market. So, Nuralz is the best Ayurvedic PCD Franchise Company in India. And their goal is to prevent and promote the body’s own capacity for maintenance and balance. Nuralz Ayurveda has the best answer for free of every one of these diseases.','Plot No 4, HSIIDC IT PARK, Sector 22, Haryana 134109'),
('DABUR INDIA LTD.', 'Dabur India Ltd. was set up in 1884, and this brand is considered one of the best herbal range brands in India. The Dabur Chyawanprash is the most popular and demanding Ayurvedic product in the marketplace. This brand offers products for diseases, skincare, and personal care and for other health concerns too.', 'Registered Office: 8/3, Asaf Ali Road, New Delhi-110002'),
('PATANJALI AYURVEDA', 'Patanjali Ayurveda is also an Ayurvedic Company by the popular yoga guru of India Baba Ramdev. This brand is not a newcomer in the Ayurvedic segment, well it offers an affordable and excellent range of Ayurvedic medicines and Ayurvedic products in the market. Also, Patanjali is giving tough competition to the other Ayurvedic brands in the market.', 'Patanjali Ayurved Limited, Haridwar, Uttarakhand – 249401'),
('BAIDYANATH', 'Shree Baidyanath Ayurved Bhawan Ltd was formed in 1917. And, since then Baidyanath is serving excellent quality Ayurvedic products in the marketplace which are highly reliable. Consequently, they are very popular for preparing the finest remedial formulations made from herbs and that could help to boost better nutrients for a healthy body.', 'Shree Baidyanath Ayurved Bhawan Pvt.Ltd. 1- Gupta Lane Near Ganesh Talkies, Beside Lohia Hospital, Kolkata, West Bengal 700006'),
('HAMDARD LABORATORIES', 'In 1906, Hamdard Company was established in India. This brand is one of the admired and trusted Ayurvedic companies that offer an excellent range of herbal care medicines for faster healing with ultimate results. Also, this company delivers an excellent and wide range of Ayurvedic products in the market to meet people’s requirements.', '2A/3, Asaf Ali Road, Hamdard Building, New Delhi-110002.'),
('ZANDU AYURVEDA', 'Zandu Ayurveda is one major Ayurvedic brand in this country. Further, this brand offers an excellent remedial solution for diseases and cancer issues. Moreover, in the present, they are one of the richest Ayurvedic brands in India.', 'Emami Group, Emami Tower, 687 Anandapur, EM Bypass, Kolkata 700107'),
('HIMALAYA WELLNESS', 'Himalaya wellness offers the finest range of personal care products, hair care products and natural skincare products in the market. And, truly they are really effective and best for regular usage. Also, they offer more than 100 ranges of Ayurvedic remedial solutions for curing health issues.', 'Makali, Bengaluru, KA, 562 162, India'),
('VICCO LABORATORIES', 'Vicco is one of the topmost herbal companies in the Indian Market that serves an excellent range of dental and skincare products. Similarly, in the present time, they are one of the most developing and trusted Ayurvedic brands in the Herbal Care Market Of India.', '78, Farmland, Ramdaspeth, Nagpur 440 010, Maharashtra, India'),
('CHARAK PHARMA PVT. LTD.', 'This is one of the major Ayurvedic brands in the Indian Market that offers top quality Ayurvedic products. Also, they are best at selling their high-quality Ayurvedic range in the foreign markets too.', 'Charak Pharma Pvt. Ltd, 501/A, Poonam Chambers, Dr. Annie Besant Road, Worli, Mumbai – 400 018.'),
('SANDU PHARMACEUTICALS LTD.', 'Sandu Pharmaceuticals is one of the major Ayurvedic companies in India. They are serving excellent pediatric and women’s care products. Thus, this brand assures to deliver the top quality herbal range in the market for curing serious diseases.', 'Sandu Nagar, D. K. Sandu Marg, Chembur , Mumbai, Maharashtra, India.');

CREATE TABLE category (
	id int(11) auto_increment primary key,
  	categoryName varchar(255) DEFAULT NULL,
  	categoryDescription longtext DEFAULT NULL
);

INSERT INTO category (categoryName, categoryDescription) VALUES
('Syrups', 'Ayurvedic syrups are herbal remedies made from traditional plant-based ingredients that often aim to relieve ailments such as cough, cold, and sore throat. For example, products like Pankajakasthuri Cough Syrup blend various Ayurvedic herbs, such as Tulsi, to provide relief and boost immunity.'),
('Capsules', 'Ayurvedic capsules are dietary supplements made from various herbs and natural ingredients based on ancient Ayurvedic medicine principles. These capsules are designed to promote health and wellness by leveraging the benefits of plant-based extracts and traditional formulations. Examples include plant extract-based supplements for overall health and hair growth capsules like Kesh King for fuller hair.'),
('Oils', 'Ayurvedic oils are specially formulated medicinal preparations that aim to balance the three doshas in the body, provide essential micronutrients, and promote overall health. They can be used for various purposes, including hair care, treating conditions like dandruff, hair fall, and premature graying. Many Ayurvedic hair oils also contain herbal ingredients such as neem, amla, and bhringraj, which are known to strengthen hair and improve scalp health.'),
('Ointments', 'Ayurvedic ointments are topical applications made from natural ingredients that aim to provide relief from various ailments, such as pain, inflammation, and respiratory issues. Products like Tiger Balm and Ayurvedic ointments from brands like Apollo Pharmacy are designed for fast-acting relief, with some targeting specific issues like joint pain and nasal congestion.'),
('Powders', 'Ayurvedic powders (or churnas) are natural herbal powders used in traditional Indian medicine to promote health and well-being. Examples include Ashwagandha powder for stress relief, Amla powder for immunity and skin health, and Triphala churna for digestion. They can be mixed with water or other substances for consumption or topical application.'),
('Health Juice', 'Ayurvedic health juices, such as Dabur Gut Health Juice, are made from natural ingredients and are designed to promote digestive health and overall well-being. They typically contain no artificial colors, flavors, or sugars and are based on traditional Ayurvedic principles aimed at restoring balance in the body.');

CREATE TABLE users (
  id int(11) auto_increment primary key,
  name varchar(255) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  contactno varchar(11) DEFAULT NULL,
  password varchar(255) DEFAULT NULL
);

INSERT INTO users (name, email, contactno, password) VALUES
('Vijay Panwar', 'vp.singh@gmail.com', '9259874230', 'test@2023'),
('Deepali Patekar', 'dr.deeps@gmail.com', '8285703355', 'test@2023'),
('Mrugesh Walimbe', 'mrugesh2005@gmass.com', '8121312312', 'test@2023'),
('Ayush Kumbhar', 'ak47@gmail.com', '7234567890', 'test@2023'),
('Ameya Desai', 'desaimangoes@gmail.com', '9425879212', 'test@2023');

CREATE TABLE products (
  id int(11) auto_increment primary key,
  brandId int(11) references brand(id) on delete cascade,
  categoryId int(11) references category(id) on delete cascade,
  productName varchar(255) NOT NULL,
  productPrice decimal(10,2) NOT NULL,
  productPriceBeforeDiscount decimal(10,2) NOT NULL,
  productDescription longtext NOT NULL,
  productImage1 varchar(255) NOT NULL,
  productImage2 varchar(255) NOT NULL,
  productImage3 varchar(255) NOT NULL,
  shippingCharge decimal(10,2) NOT NULL,
  productAvailability varchar(255) NOT NULL,
  mfgDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  expDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE addresses (
  id int(11) auto_increment primary key,
  userId int(11) references users(id) on delete cascade,
  billingAddress varchar(255) DEFAULT NULL,
  biilingCity varchar(150) DEFAULT NULL,
  billingState varchar(100) DEFAULT NULL,
  billingPincode varchar(11) DEFAULT NULL,
  billingCountry varchar(100) DEFAULT NULL,
  shippingAddress varchar(300) DEFAULT NULL,
  shippingCity varchar(150) DEFAULT NULL,
  shippingState varchar(100) DEFAULT NULL,
  shippingPincode varchar(11) DEFAULT NULL,
  shippingCountry varchar(100) DEFAULT NULL,
  postingDate timestamp NULL DEFAULT current_timestamp()
);

CREATE TABLE cart (
  id int(11) auto_increment primary key,
  userID int(11) references users(id) on delete cascade,
  productId int(11) references products(id) on delete cascade,
  productQty int(11) DEFAULT NULL,
  postingDate timestamp NOT NULL DEFAULT current_timestamp()
);


CREATE TABLE orders (
  id int(11) auto_increment primary key,
  orderNumber varchar(12) DEFAULT NULL,
  userId int(11) references users(id) on delete cascade,
  addressId int(11) references addresses(id) on delete cascade,
  totalAmount decimal(10,2) DEFAULT NULL,
  txnType varchar(200) DEFAULT NULL,
  txnNumber varchar(50) DEFAULT NULL,
  orderStatus varchar(120) DEFAULT NULL,
  orderDate timestamp NOT NULL DEFAULT current_timestamp()
);


CREATE TABLE ordersdetails (
  id int(11) auto_increment primary key,
  orderId int(11) references orders(id) on delete cascade,
  userId int(11) references users(id) on delete cascade,
  productId int(11) references products(id) on delete cascade,
  quantity int(11) DEFAULT NULL,
  orderDate timestamp NOT NULL DEFAULT current_timestamp(),
  orderStatus varchar(55) DEFAULT NULL
);

CREATE TABLE ordertrackhistory (
  id int(11) auto_increment primary key,
  orderId int(11) references orders(id) on delete cascade,
  status varchar(255) DEFAULT NULL,
  remark mediumtext DEFAULT NULL,
  actionBy int(3) DEFAULT NULL,
  postingDate timestamp NOT NULL DEFAULT current_timestamp(),
  canceledBy varchar(100) DEFAULT NULL
);

CREATE TABLE wishlist (
  id int(11) auto_increment primary key,
  userId int(11) references users(id) on delete cascade,
  productId int(11) references products(id) on delete cascade,
  postingDate timestamp NOT NULL DEFAULT current_timestamp()
);

