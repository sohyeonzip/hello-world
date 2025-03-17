SELECT price, bookname
FROM Book;

use madang;

SELECT bookid, bookname, publisher, price
FROM book;
SELECT *
FROM book;

SELECT DISTINCT publisher
FROM book;

SELECT *
FROM book
WHERE price < 20000;

SELECT *
FROM book
WHERE price BETWEEN 10000 AND 20000;

SELECT *
FROM book
WHERE publisher = '굿스포츠' OR publisher = '대한미디어';
-- WHERE publisher IN ('굿스포츠', '대한미디어'); 
 
SELECT *
FROM book
WHERE publisher NOT IN ('굿스포츠', '대한미디어');

SELECT bookname, publisher
FROM book
WHERE bookname LIKE '축구의 역사';

SELECT publisher, bookname
FROM book
WHERE bookname LIKE '%축구%';

SELECT *
FROM book
WHERE bookname LIKE '_구%';

SELECT *
FROM book
WHERE bookname LIKE '%축구%' AND price >= 20000;

SELECT *
FROM book
WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

SELECT *
FROM book
ORDER BY bookname;

SELECT *
FROM book
ORDER BY price, bookname;

SELECT *
FROM book
ORDER BY price Desc, publisher;

SELECT SUM(saleprice)
FROM Orders;

SELECT SUM(saleprice) AS 총매출
FROM Orders;

SELECT SUM(saleprice) AS 총매출
FROM Orders
WHERE custid = 2;

SELECT SUM(saleprice) AS Total, AVG(saleprice) AS Average, MIN(saleprice) AS Minimun, MAX(saleprice) AS Maximum
FROM Orders;

SELECT COUNT(*)
FROM Orders;

SELECT custid, COUNT(*) AS 도서수량, SUM(saleprice) AS 총액
FROM Orders
GROUP BY custid;

SELECT custid, COUNT(*) AS 도서수량
FROM Orders
WHERE saleprice >= 8000
GROUP BY custid-RYGHGGFF
HAVING COUNT(*) >= 2;

SELECT *
FROM Customer, Orders;

SELECT *
FROM customer, orders
WHERE customer.custid = orders.custid
ORDER BY customer.custid ASC;

SELECT name, saleprice
FROM Customer, Orders
WHERE Customer.custid = Orders.custid;

SELECT name, SUM(saleprice)
FROM Customer, Orders
WHERE Customer.custid = Orders.custid
GROUP BY customer.name
ORDER BY customer.name;

SELECT Customer.name, Book.bookname
FROM Customer, Orders, Book
WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid;

SELECT Customer.name, Book.bookname
FROM Customer, Orders, Book
WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid AND book.price = 20000; -- 일반조인1

SELECT bookname
WHERE price = (SELECT MAX(price)
				FROM Book);
-- WHERE price = 35000;

SELECT name
FROM Customer
WHERE custid IN (SELECT custid
				 FROM Orders);
                 
SELECT name
FROM Customer
WHERE custid IN (
					SELECT custid
					FROM Orders
					WHERE bookid IN (
										SELECT bookid
                                        FROM book
										WHERE publisher = '대한미디어'
									)
				 );
                 
 SELECT b1.bookname
 FROM Book b1
 WHERE b1.price > (SELECT avg(b2.price)
					FROM Book b2
                    WHERE b2.publisher = b1.publisher);
                    
SELECT name
FROM Customer
WHERE address LIKE '대한민국%'
UNION 
SELECT name
FROM Customer
WHERE custid IN (SELECT custid FROM Orders);

SELECT name, address
FROM Customer cs
WHERE EXISTS (SELECT *
			  FROM Orders od
			  WHERE cs.custid = od.custid);
              
SELECT ABS(-78), ABS(+78)
FROM Dual;

SELECT ROUND(4.875, 1)
FROM Dual;

SELECT custid '고객번호', ROUND(SUM(saleprice)/COUNT(*), -2) '평균금액'
FROM Orders
GROUP BY custid;

SELECT bookid, REPLACE(bookname, '야구', '농구') bookname, publisher, price
FROM Book;

SELECT bookname '제목', CHAR_LENGTH(bookname) '문자수', LENGTH(bookname) '바이트수'
FROM Book
WHERE publisher = '굿스포츠';

SELECT SUBSTR(name, 1, 1) '성', COUNT(*) '인원'
FROM Customer
GROUP BY SUBSTR(name, 1, 1);

SELECT orderid '주문번호', orderdate '주문일',
		ADDDATE(orderdate, INTERVAL 10 DAY) '확정'
FROM Orders;

SELECT orderid '주문번호', STR_TO_DATE(orderdate, '%Y-%m-%d') '주문일', custid '고객번호', bookid '도서번호'
FROM Orders
WHERE orderdate = DATE_FORMAT('20140707', '%Y%m%d'); 

SELECT SYSDATE(),
		DATE_FORMAT(SYSDATE(), '%Y/%m/%d %M %h:%s') 'SYSDATE_1';
        
SELECT *
FROM Mybook
WHERE price IS NULL;

SELECT *
FROM Mybook
WHERE price = '';

SELECT name '이름', IFNULL(phone, '연락처없음') '전화번호'
FROM Customer;

SELECT (SELECT name
		FROM Customer cs
		WHERE cs.custid = od.custid) 'name', SUM(saleprice) 'total'
FROM Orders od
GROUP BY custid;

SELECT (SELECT name
		FROM customer cs
		WHERE cs.custid = od.custid AND cs.custid <= 2) 'name', SUM(saleprice) 'total'
FROM Orders od
GROUP BY custid;        

SELECT cs.name, SUM(orders.saleprice) 'total'
FROM (
		SELECT custid, name
        FROM customer
        WHERE custid <= 2
        )					cs, orders
WHERE cs.custid = orders.custid;

SELECT orderid, saleprice
FROM Orders
WHERE saleprice >= (SELECT AVG(saleprice)	
					FROM Orders);
                    
SELECT orderid, custid, saleprice
FROM Orders od
WHERE saleprice >= (SELECT AVG(saleprice)	
					FROM Orders os
                    WHERE od.custid = os.custid);

SELECT AVG(saleprice)
					FROM Orders;

SELECT *
FROM Orders
WHERE custid IN (SELECT custid
					FROM Customer
                    WHERE address LIKE '%대한민국%');
                    
SELECT orderid, saleprice
FROM Orders
WHERE saleprice > ALL (SELECT saleprice
					FROM Orders
                    WHERE custid = 3);

SELECT SUM(saleprice) 'total'
FROM Orders od
WHERE EXISTS (SELECT *

SELECT *
FROM Customer
WHERE address LIKE '%대한민국%';

CREATE TABLE NewBook (
bookid INTEGER,
bookname VARCHAR(20),
publisher VARCHAR(20),
price INTEGER,
PRIMARY KEY (bookname, publisher));

DESC NewBook;

SELECT *
FROM Book
WHERE bookname LIKE '%축구%';

CREATE VIEW vw_Book
AS SELECT *
FROM Book
WHERE bookname LIKE '%축구%';

SELECT *
FROM vw_book;

CREATE VIEW vw_Customer
AS SELECT *
FROM Customer
WHERE address LIKE '%대한민국%';

SELECT *
FROM vw_Customer;

CREATE VIEW vw_Orders 
AS SELECT od.orderid, od.custid, cs.name, od.bookid, bk.bookname, od.saleprice, od.orderdate
FROM Orders od, Customer cs, Book bk
WHERE od.custid = cs.custid AND od.bookid = bk.bookid;

SELECT orderid, bookname, saleprice
FROM vw_Orders
WHERE name LIKE '%김연아%';


CREATE OR REPLACE VIEW vw_Customer (custid, name, address)
AS SELECT custid, name, address
FROM Customer
WHERE address LIKE '%영국%';

SELECT *
FROM vw_Customer;

DROP VIEW vw_Customer;

SELECT *
FROM vw_Customer;

delimiter //
CREATE PROCEDURE InsertBook(
	IN myBookID INTEGER,
    IN myBookNAME VARCHAR(40),
    IN myPublisher VARCHAR(40),
    IN myPrice INTEGER)
BEGIN 
 INSERT INTO Book(bookid, bookname, publisher, price)
  VALUES(myBookID, myBookName, myPublisher, myPrice);
END;
//
delimiter ;

CALL InsertBook(13, '스포츠과학', '마당과학서적', 25000);
SELECT * FROM Book;

delimiter // 
CREATE PROCEDURE BookInsertOrUpdate(
	myBookID INTEGER,
    myBookName VARCHAR(40),
    myPublisher VARCHAR(40),
    myPrice INT)
BEGIN
	DECLARE mycount INTEGER;
    SELECT count(*) INTO mycount FROM Book
     WHERE bookname LIKE myBookName;
	IF mycount !=0 THEN
     SET SQL_SAFE_UPDATES = 0;
     UPDATE Book SET price = myPrice
      WHERE bookname LIKE myBookName;
	ELSE 
     INSERT INTO Book(bookid, bookname, publisher, price)
      VALUES(myBookID, myBookName, myPublisher, myPrice);
	END IF;
END;
//
delimiter ;

CALL BookInsertOrUpdate(15, '스포츠 즐거움', '마당과학서적', 25000);
select * FROM Book;

CALL BookInsertOrUpdate(15, '스포츠 즐거움', '마당과학서적', 20000);
select * FROM Book;

delimiter // 
CREATE PROCEDURE AveragePrice(
OUT AverageVal INTEGER)
BEGIN
SELECT AVG(price) INTO AverageVal
FROM Book WHERE price IS NOT NULL;
END;
//
delimiter ;

CALL AveragePrice(@myValue);
SELECT @myValue;
