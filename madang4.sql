CREATE TABLE Staff (
    staffid INTEGER PRIMARY KEY,
    name VARCHAR(40),
    phone VARCHAR(20),
	position VARCHAR(30),
    hiredate DATE
);

CREATE TABLE Inventory ( -- 재고
    invenid INTEGER PRIMARY KEY,
    staffid INTEGER, -- 누가
    bookid INTEGER,
    orderid INTEGER, -- 어디로
    transaction_type VARCHAR(10) CHECK (transaction_type IN ('입고', '출고')), -- '입고'와 '출고'로 강제
    transaction_date DATE,
    quantity INTEGER,
    FOREIGN KEY (staffid) REFERENCES Staff(staffid),
    FOREIGN KEY (bookid) REFERENCES Book(bookid),
    FOREIGN KEY (orderid) REFERENCES Orders(orderid)
);

CREATE TABLE Review ( -- 누가 어떤 책에 리뷰를 썼는가
    reviewid INTEGER PRIMARY KEY,
    custid INTEGER,
    bookid INTEGER,
    reviewdate DATE, -- 언제 작성
    rating INTEGER CHECK (rating >= 1 AND rating <= 5), -- 점수
    comments VARCHAR(2000), -- 고객 리뷰 내용을 2000자까지 허용 -- 어떤 내용
    FOREIGN KEY (custid) REFERENCES Customer(custid),
    FOREIGN KEY (bookid) REFERENCES Book(bookid)
);

CREATE TABLE Answer ( -- 어떤 직원에 어떤 리뷰에 어떤 답글을 달았는가
    answerid INTEGER PRIMARY KEY,
    reviewid INTEGER, -- 어떤 리뷰에
    staffid INTEGER, -- 어떤 스탭
    answerdate DATE, -- 언제
    comments VARCHAR(2000), -- 직원 답변 내용을 2000자까지 허용 -- 어떤 내용
    FOREIGN KEY (reviewid) REFERENCES Review(reviewid),
    FOREIGN KEY (staffid) REFERENCES Staff(staffid)
);

--

INSERT INTO Staff (staffid, name, phone, position, hiredate) VALUES
(1, '류현진', '000-1000-0001', '사장', STR_TO_DATE('2014-06-01','%Y-%m-%d')),
(2, '손흥민', '000-2000-0001', '과장', STR_TO_DATE('2014-06-10','%Y-%m-%d')),
(3, '김연경', '000-3000-0001', '사원', STR_TO_DATE('2014-06-20','%Y-%m-%d'));

INSERT INTO Inventory (invenid, staffid, bookid, orderid, transaction_type, transaction_date, quantity) VALUES
(1, 1, 1, NULL, '입고', STR_TO_DATE('2014-06-30','%Y-%m-%d'), 14),
(2, 3, 2, NULL, '입고', STR_TO_DATE('2014-06-30','%Y-%m-%d'), 29),
(3, 1, 3, NULL, '입고', STR_TO_DATE('2014-06-30','%Y-%m-%d'), 17),
(4, 2, 4, NULL, '입고', STR_TO_DATE('2014-06-30','%Y-%m-%d'), 18),
(5, 3, 5, NULL, '입고', STR_TO_DATE('2014-06-30','%Y-%m-%d'), 20),
(6, 2, 6, NULL, '입고', STR_TO_DATE('2014-06-30','%Y-%m-%d'), 25),
(7, 1, 7, NULL, '입고', STR_TO_DATE('2014-06-30','%Y-%m-%d'), 13),
(8, 3, 8, NULL, '입고', STR_TO_DATE('2014-06-30','%Y-%m-%d'), 27),
(9, 2, 9, NULL, '입고', STR_TO_DATE('2014-06-30','%Y-%m-%d'), 22),
(10, 1, 10, NULL, '입고', STR_TO_DATE('2014-06-30','%Y-%m-%d'), 15),
(11, 2, 1, 1, '출고', STR_TO_DATE('2014-07-01','%Y-%m-%d'), -1),
(12, 3, 3, 2, '출고', STR_TO_DATE('2014-07-03','%Y-%m-%d'), -1),
(13, 1, 5, 3, '출고', STR_TO_DATE('2014-07-03','%Y-%m-%d'), -1),
(14, 2, 6, 4, '출고', STR_TO_DATE('2014-07-04','%Y-%m-%d'), -1),
(15, 3, 7, 5, '출고', STR_TO_DATE('2014-07-05','%Y-%m-%d'), -1),
(16, 1, 2, 6, '출고', STR_TO_DATE('2014-07-07','%Y-%m-%d'), -1),
(17, 2, 8, 7, '출고', STR_TO_DATE( '2014-07-07','%Y-%m-%d'), -1),
(18, 3, 10, 8, '출고', STR_TO_DATE('2014-07-08','%Y-%m-%d'), -1),
(19, 1, 10, 9, '출고', STR_TO_DATE('2014-07-09','%Y-%m-%d'), -1),
(20, 2, 8, 10, '출고', STR_TO_DATE('2014-07-10','%Y-%m-%d'), -1);

INSERT INTO Review (reviewid, custid, bookid, reviewdate, rating, comments) VALUES
(1, 1, 1, STR_TO_DATE('2014-07-01','%Y-%m-%d'), 5, '한번 펼치면 끝까지 읽게 만드는 책이에요.'),
(2, 1, 3, STR_TO_DATE('2014-07-03','%Y-%m-%d'), 3, '새로운 시각을 열어주는 멋진 책입니다.'),
(3, 2, 5, STR_TO_DATE('2014-07-03','%Y-%m-%d'), 4, '단순한 문장 속에 깊은 의미가 담겨 있어요.'),
(4, 3, 6, STR_TO_DATE('2014-07-04','%Y-%m-%d'), 5, '언제 읽어도 좋은 교훈이 담긴 책입니다.'),
(5, 4, 7, STR_TO_DATE('2014-07-05','%Y-%m-%d'), 2, '아쉬운 부분이 많았던 책입니다.'),
(6, 1, 2, STR_TO_DATE('2014-07-07','%Y-%m-%d'), 1, '기대했던 것만큼의 내용은 없었어요.'),
(7, 4, 8, STR_TO_DATE('2014-07-07','%Y-%m-%d'), 3, '소장하고 싶어지는 책이에요.'),
(8, 3, 10, STR_TO_DATE('2014-07-08','%Y-%m-%d'), 4, '마음에 남는 내용이 많아서 좋았어요.'),
(9, 2, 10,STR_TO_DATE('2014-07-09','%Y-%m-%d'), 5, '필요한 순간에 꺼내 읽고 싶은 책입니다.'),
(10, 3, 8, STR_TO_DATE('2014-07-10','%Y-%m-%d'), 2, '내용이 조금 뻔하게 느껴졌습니다.');

INSERT INTO Answer (answerid, reviewid, staffid, answerdate, comments) VALUES
(1, 1, 1, STR_TO_DATE('2014-07-01','%Y-%m-%d'), '따뜻한 리뷰 남겨주셔서 감사합니다.'),
(2, 2, 2, STR_TO_DATE('2014-07-03','%Y-%m-%d'), '따뜻한 리뷰 남겨주셔서 감사합니다.'),
(3, 3, 3, STR_TO_DATE('2014-07-03','%Y-%m-%d'), '따뜻한 리뷰 남겨주셔서 감사합니다.'),
(4, 4, 1, STR_TO_DATE('2014-07-04','%Y-%m-%d'), '따뜻한 리뷰 남겨주셔서 감사합니다.'),
(5, 5, 2, STR_TO_DATE('2014-07-05','%Y-%m-%d'), '솔직한 의견 감사드리며 반영하도록 하겠습니다.'),
(6, 6, 3, STR_TO_DATE('2014-07-07','%Y-%m-%d'), '솔직한 의견 감사드리며 반영하도록 하겠습니다.'),
(7, 7, 1, STR_TO_DATE('2014-07-07','%Y-%m-%d'), '따뜻한 리뷰 남겨주셔서 감사합니다.'),
(8, 8, 2,  STR_TO_DATE('2014-07-08','%Y-%m-%d'), '따뜻한 리뷰 남겨주셔서 감사합니다.'),
(9, 9, 3, STR_TO_DATE('2014-07-09','%Y-%m-%d'), '따뜻한 리뷰 남겨주셔서 감사합니다.'),
(10, 10, 1, STR_TO_DATE('2014-07-10','%Y-%m-%d'), '솔직한 의견 감사드리며 반영하도록 하겠습니다.');