-- Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
CREATE DATABASE homework;
USE homework;
CREATE TABLE sales
(
id  INT PRIMARY KEY AUTO_INCREMENT,
position VARCHAR(30),
price INT NOT NULL
);
INSERT sales (position, price)
VALUES
	("position_1",80),
	("position_2",90),
	("position_3",100),
    ("position_4",120),
    ("position_5",140),
    ("position_6",150),
    ("position_7",170),
    ("position_8",200),
    ("position_9",220),
    ("position_10",240),
    ("position_11",260),
    ("position_12",280),
    ("position_13",300),
    ("position_14",350);
-- Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.    
SELECT id, position, price,
CASE TRUE
    WHEN price < 100 THEN 'меньше 100'
    WHEN price >= 100 AND price <= 300 THEN '100-300'
    ELSE 'больше 300'
END AS position_size
FROM sales;    

-- Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE    

CREATE TABLE orders (
    orderid INT PRIMARY KEY AUTO_INCREMENT,
    salereid VARCHAR(8) NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    orderstatus VARCHAR(30) NOT NULL
);

INSERT INTO orders (salereid, amount, orderstatus)
VALUES
  ("sal_1",1000.00,"OPEN"),
  ("sal_2",4000.00,"OPEN"),
  ("sal_3",1200.50,"CLOSED"),
  ("sal_4",2000.00,"CLOSED"),
  ("sal_3",345.00,"CANCELLED"),
  ("sal_3",400.20,"CLOSED"),
  ("sal_4",1450.00,"OPEN"),
  ("sal_2",3000.00,"OPEN"),
  ("sal_1",4000.00,"OPEN"),
  ("sal_1",2200.00,"OPEN"),
  ("sal_4",3100.00,"CLOSED"),
  ("sal_3",700.50,"OPEN"),
  ("sal_2",2323.36,"CLOSED"),
  ("sal_3",200.00,"CLOSED"),
  ("sal_1",776.20,"CANCELLED"),
  ("sal_3",4355.00,"CLOSED"),
  ("sal_1",5432.67,"CLOSED"),
  ("sal_3",1122.22,"CANCELLED"),
  ("sal_2",65.55,"CLOSED"),
  ("sal_3",83.33,"CLOSED");

SELECT orderid, orderstatus,
CASE orderstatus
    WHEN "OPEN" THEN 'Order is in open state.'
    WHEN "CLOSED" THEN 'Order is closed.'
    ELSE 'Order is cancelled.'
END AS order_summary
FROM orders;

-- №1.	Используя оператор ALTER TABLE, установите внешний ключ в одной из таблиц. 
ALTER TABLE posts
ADD CONSTRAINT posts_user_id_fkey
FOREIGN KEY (user_id)
REFERENCES users (id);

-- №2.	Без оператора JOIN, верните заголовок публикации, текст с описанием, идентификатор клиента, опубликовавшего публикацию и логин данного клиента.
SELECT title, full_text, user_id, users.login
FROM posts, users
WHERE posts.user_id = users.id;

-- №3.	Выполните поиск  по публикациям, автором котоырх является клиент "Mikle".
SELECT *
FROM posts
WHERE user_id = (
    SELECT id
    FROM users
    WHERE login = 'Mikle'
);
