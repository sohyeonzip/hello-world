SELECT bookname, price
FROM Book;

SELECT price, bookname
FROM Book;

SELECT bookid, bookname, publisher, price
FROM Book;

SELECT *
FROM Book;

SELECT publisher
FROM Book;

SELECT DISTINCT publisher
FROM Book;

SELECT *
FROM Book
WHERE price < 20000;

SELECT *
FROM Book
WHERE price >= 10000 AND price <= 20000;

SELECT *
FROM Book
WHERE price BETWEEN 10000 AND 20000;

SELECT *
FROM Book
WHERE publisher IN ('굿스포츠', '대한미디어');

SELECT *
FROM Book
WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

SELECT *
FROM Book
WHERE publisher NOT IN ('굿스포츠', '대한미디어');

SELECT *
FROM Book
WHERE publisher != '굿스포츠' AND publisher != '대한미디어';

SELECT bookname, publisher
FROM Book
WHERE bookname = '축구의 역사';

SELECT bookname, publisher
FROM Book
WHERE bookname LIKE '축구의 역사';

SELECT bookname, publisher
FROM Book
WHERE bookname LIKE '%축구%';

SELECT *
FROM Book
WHERE bookname LIKE '_구%';

SELECT *
FROM Book
WHERE bookname LIKE '%축구%' AND price >= 20000;

SELECT *
FROM Book
WHERE publisher = '굿스포츠' OR publisher = '대한미디어';

SELECT *
FROM Book
ORDER BY bookname;

SELECT *
FROM Book
ORDER BY price, bookname;

SELECT *
FROM Book
ORDER BY price DESC, publisher;

SELECT SUM(saleprice)
FROM Orders;

SELECT SUM(saleprice) AS 총매출
FROM Orders;

SELECT SUM(saleprice) AS 총매출
FROM Orders
WHERE custid = 2;

SELECT SUM(saleprice) AS Total, AVG(saleprice) AS Average, MIN(saleprice) AS Minimum, MAX(saleprice) AS Maximum
FROM Orders;

SELECT COUNT(*)
FROM Orders;

SELECT custid, COUNT(*) AS 도서수량, SUM(saleprice) AS 총액
FROM Orders
GROUP BY custid;

SELECT custid, count(*) AS 도서수량
FROM Orders
WHERE saleprice >= 8000
GROUP BY custid
HAVING count(*) >= 0;

SELECT *
FROM Customer, Orders
WHERE Customer.custid = Orders.custid;

SELECT *
FROM Customer, Orders
WHERE Customer.custid = Orders.custid
ORDER BY Orders.custid;

SELECT name, saleprice
FROM Customer, Orders
WHERE Customer.custid = Orders.custid;

SELECT name, SUM(saleprice)
FROM Customer, Orders
WHERE Customer.custid = Orders.custid
GROUP BY Customer.custid
ORDER BY Customer.name;

SELECT Customer.name, Book.bookname
FROM Customer, Orders, Book
WHERE Customer.custid = Orders.custid
	  AND Orders.bookid = Book.bookid;

-- 3-26
SELECT Customer.name, Book.bookname
FROM Customer 
JOIN Orders ON Customer.custid = Orders.custid
JOIN Book ON Orders.bookid = Book.bookid
WHERE Book.price = 20000; -- 외부조인

SELECT Customer.name, Book.bookname
FROM Customer, Orders, Book
WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid AND Book.price = 20000; -- 일반조인1

SELECT Customer.name, Book.bookname
FROM Customer
INNER JOIN Orders ON Customer.custid = Orders.custid
INNER JOIN Book ON Orders.bookid = Book.bookid
WHERE Book.price = 20000; -- 일반조인2

-- 3-28
SELECT bookname
FROM Book
WHERE price = ( SELECT MAX(price)
				FROM Book );
                
-- 3-29
SELECT Customer.name
FROM Customer
WHERE custid IN ( SELECT custid
				  FROM Orders );
                  
-- 3-30
SELECT Customer.name
FROM Customer
WHERE custid IN ( 
					SELECT custid
					FROM Orders 
                    WHERE Bookid IN (
										SELECT bookid
										FROM Book
										WHERE publisher = '대한미디어' )
				);
                
-- 3-31
SELECT b1.bookname
FROM Book b1
WHERE b1.price > (SELECT avg(b2.price)
					FROM Book b2
                    WHERE b2.publisher = b1.publisher);
                    
-- 3-32
SELECT name
FROM Customer
WHERE address LIKE '대한민국%'
UNION
SELECT name
FROM Customer
WHERE custid IN (SELECT custid FROM Orders);

-- 3-33
SELECT name, address
FROM Customer cs
WHERE EXISTS (SELECT *
				FROM Orders od
                WHERE cs.custid = od.custid);
                
-- 3-34
CREATE TABLE NewBook (
bookid INTEGER PRIMARY KEY,
bookname VARCHAR(20) NOT NULL,
publisher VARCHAR(20) UNIQUE,
price INTEGER DEFAULT 10000 CHECK(price > 1000)
);

DESC newbook;

-- 3-35
CREATE TABLE NewCustomer (
custid INTEGER PRIMARY KEY,
name VARCHAR(40),
address VARCHAR(40),
phone VARCHAR(30)
);

DESC NewCustomer;

-- 3-36
CREATE TABLE NewOrders (
orderid INTEGER,
custid INTEGER NOT NULL,
bookid INTEGER NOT NULL,
saleprice INTEGER,
orderdate DATE,
PRIMARY KEY (orderid),
FOREIGN KEY (custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE
);

DESC NewOrders;

-- 3-37
ALTER TABLE newbook
ADD  isbn VARCHAR(13);

DESC newbook;

-- 3-38
ALTER TABLE Newbook
MODIFY isbn INTEGER;

DESC Newbook;

-- 3-39
ALTER TABLE Newbook
DROP COLUMN isbn;

DESC Newbook;

-- 3-40
ALTER TABLE Newbook
MODIFY bookid INTEGER NOT NULL;

DESC Newbook;

-- 3-42
DROP TABLE Newbook;

DESC Newbook;

-- 3-43
DROP TABLE Neworders;
DROP TABLE Newcustomer;

-- DESC Neworders;
DESC Newcustomer;

-- 3-44
INSERT INTO Book(bookid, bookname, publisher, price)
VALUES (11, '스포츠 의학', '한솔의학서적', 90000);

select * from book;
-- DESC book;

-- 3-45
INSERT INTO Book(bookid, bookname, publisher)
VALUES (14, '스포츠 의학', '한솔의학서적');

select * from book;

-- 3-46
select * from imported_book;

INSERT INTO Book(bookid, bookname, price, publisher)
		SELECT bookid, bookname, price, publisher -- INTO와 SELECT 컬럼 순서 일치시켜야 함 / 설정한 컬럼 순으로 출력됨
        FROM imported_book;
        -- values 생략
select * from book;

-- 3-47
UPDATE Customer
SET address = '대한민국 부산'
WHERE custid = 5;

select * from Customer;

-- 3-48
UPDATE Book
SET publisher = ( SELECT publisher
					FROM imported_book
					WHERE bookid = 21
				)
WHERE bookid = 14;

select * from Book;

-- 3-49
DELETE FROM Book
WHERE bookid = '11';

select * from book;

-- 3-50
DELETE FROM orders
WHERE custid > 0; 

select * from orders;

-- 4-1
SELECT ABS(-78), ABS(+78)
FROM Dual;

-- 4-2
SELECT ROUND(4.875, 1)
FROM Dual;

-- 4-3
SELECT custid '고객번호', ROUND(SUM(saleprice)/COUNT(*), -2) '평균금액'
FROM Orders
GROUP BY custid;

-- 4-4
SELECT bookid, REPLACE(bookname, '야구', '농구') bookname, publisher, price
FROM Book;

-- 4-5
SELECT bookname '제목', CHAR_LENGTH(bookname) '문자수',
		LENGTH(bookname) '바이트수'
FROM Book
WHERE publisher = '굿스포츠';

-- 4-6
SELECT SUBSTR(name, 1, 1) '성', COUNT(*) '인원'
FROM Customer
GROUP BY SUBSTR(name, 1, 1);

-- 4-7
SELECT orderid '주문번호', orderdate '주문일',
		ADDDATE(orderdate, INTERVAL 10 DAY) '확정'
FROM Orders;

-- 4-8
SELECT orderid '주문번호', STR_TO_DATE(orderdate, '%Y-%m-%d') '주문일',
		custid ;
        
-- 4-9
SELECT SYSDATE(),
		DATE_FORMAT(SYSDATE(), '%Y/%m/%d %M %h:%s') 'SYSDATE_1';
       
--      


SELECT price+100
FROM Mybook
WHERE Bookid = 3;

SELECT SUM(price), AVG(price), COUNT(*), COUNT(price)
FROM Mybook;

SELECT SUM(price), AVG(price), COUNT(*)
FROM Mybook
WHERE bookid >= 4;

SELECT *
FROM Mybook
WHERE price IS NULL;

SELECT *
FROM Mybook
WHERE price = '';
        
-- 4-10
SELECT name '이름', IFNULL(phone, '연락처없음') '전화번호'
FROM Customer;

-- 4-11
SET @seq:=0;
SELECT (@seq:=@seq+1) '순번', custid, name, phone
FROM Customer
WHERE @seq < 2;

-- 4-12
SELECT ( SELECT name
			FROM Customer cs
            WHERE cs.custid = od.custid ) 'name', SUM(saleprice) 'total'
FROM Orders od
GROUP BY custid;

-- 4-13
SELECT * FROM orders;

SELECT orders.orderid, orders.custid, orders.bookid, orders.saleprice, orders.orderdate, book.bookname bname
FROM orders, book
WHERE orders.bookid = book.bookid;

-- 4-14
SELECT cs.name, SUM(saleprice) 'total'
FROM (
		SELECT custid, name
        FROM customer
        WHERE custid <= 2
        )					cs, orders
WHERE cs.custid = orders.custid
GROUP BY cs.name; -- 일반조인1

SELECT cs.name, SUM(saleprice) 'total'
FROM (
    SELECT custid, name
    FROM customer
    WHERE custid <= 2
) cs 
INNER JOIN orders ON cs.custid = orders.custid
GROUP BY cs.name; -- 일반조인2?  &  전체 합 구하려면 어떻게 해야하는지?

-- 4-15
SELECT orderid, saleprice
FROM Orders
WHERE saleprice <= (SELECT AVG(saleprice)
					FROM Orders);
                    
-- 4-16
SELECT orderid, custid, saleprice
FROM Orders od
WHERE saleprice >= (SELECT AVG(saleprice)	
					FROM Orders os
                    WHERE od.custid = os.custid);
                    
-- 4-17
SELECT SUM(saleprice) 'total'
FROM Orders
WHERE custid IN (SELECT custid
					FROM Customer
                    WHERE address LIKE '%대한민국%');
                    
-- 4-18
SELECT orderid, saleprice
FROM Orders
WHERE saleprice > ALL (SELECT saleprice
						FROM Orders
						WHERE custid = '3');
                        
-- 4-19
SELECT SUM(saleprice) 'total'
FROM Orders od
WHERE EXISTS (SELECT *
				FROM Customer cs
                WHERE address LIKE '%대한민국%' AND cs.custid = od.custid);
                
-- 뷰
SELECT *
FROM Book
WHERE bookname LIKE '%축구%';

CREATE VIEW vw_Book
AS SELECT *
FROM Book
WHERE bookname LIKE '%축구%';
                
SELECT *
FROM vw_Book;

-- 4-20
CREATE VIEW vw_Customer
AS SELECT *
FROM Customer
WHERE address LIKE '%대한민국%';

SELECT *
FROM vw_Customer;

-- 4-21
CREATE VIEW vw_Orders (orderid, custid, name, bookid, bookname, saleprice, orderdate)
AS SELECT od.orderid, od.custid, cs.name, od.bookid, bk.bookname, od.saleprice, od.orderdate
FROM Orders od, Customer cs, Book bk
WHERE od.custid = cs.custid AND od.bookid = bk.bookid;

SELECT orderid, bookname, saleprice
FROM vw_Orders
WHERE name = '김연아';

-- 4-22
CREATE OR REPLACE VIEW vw_Customer (custid, name, address)
AS SELECT custid, name, address
FROM Customer
WHERE address LIKE '%영국%';

SELECT *
FROM vw_Customer;

-- 4-23
DROP VIEW vw_Customer;

SELECT *
FROM vw_Customer;

-- 5-1
use madang3;
delimiter //
CREATE PROCEDURE InsertBook(
IN myBookID INTEGER,
IN myBookName VARCHAR(40),
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

-- 5-2
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
        IF mycount != 0 THEN
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
    SELECT * FROM Book;
    CALL BookInsertOrUpdate(15, '스포츠 즐거움', '마당과학서적', 20000);
    SELECT * FROM Book;
    
    -- 5-3
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
    
    -- 5-4
    delimiter // 
    CREATE PROCEDURE intrerst()
    BEGIN 
		DECLARE myInterest INTEGER DEFAULT 0.0;
        DECLARE Price INTEGER;
        DECLARE endOfRow BOOLEAN DEFAULT FALSE;
        DECLARE InterestCursor CURSOR FOR
			SELECT saleprice FROM Orders;
		DECLARE CONTINUE handler
			FOR NOT FOUND SET endOfRow = TRUE;
		OPEN InterestCursor;
        cursor_loop: LOOP
			FETCH InterestCursor INTO Price;
            IF endOfRow THEN LEAVE cursor_loop;
            END IF;
            IF Price >= 30000 THEN 
				SET myInterest = myInterest + Price * 0.1;
			ELSE 
				SET myInterest = myInterest + Price * 0.05;
			END IF;
            END LOOP cursor_loop;
            CLOSE InterestCursor;
            SELECT CONCAT(' 전체 이익 금액 = ', myInterest);
	END;
    //
    delimiter ;
    
    CALL Interest();
    
    -- 5-5
    SET global log_bin_trust_function_creators = ON;
    
    CREATE TABLE Book_log(
    bookid_l INTEGER,
    bookname_l VARCHAR(40),
    publisher_l VARCHAR(40),
    price_l INTEGER);
    
    delimiter // 
    CREATE TRIGGER AfterInsertBook
    AFTER INSERT ON Book FOR EACH ROW
    BEGIN 
    DECLARE average INTEGER;
    INSERT INTO Book_log
    VALUES(new.bookid, new.bookname, new.publisher, new.price);
    END;
    //
    delimiter ; 
    
    INSERT INTO Book VALUES(12, '스포츠 과학 1', '이상미디어', 25000);
    SELECT * FROM Book WHERE BOOKID = 12;
    SELECT * FROM Book_log WHERE BOOKID_L = '12';
    
-- 5-6
delimiter //
CREATE FUNCTION fnc_Interest(
Price INTEGER) RETURNS INT
BEGIN
DECLARE myInterest INTEGER;
IF Price >= 30000 THEN SET myInterest = Price * 0.1;
ELSE SET myInterest := Price * 0.05;
END IF;
RETURN myInterest;
END; //
delimiter ;

SELECT custid, orderid, saleprice, fnc_Interest(saleprice) interest
FROM Orders; 