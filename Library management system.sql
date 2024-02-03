CREATE DATABASE IF NOT EXISTS LIBRARY;
USE LIBRARY;
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    genre VARCHAR(30),
    published_year INT
);
INSERT INTO Book(book_id,title,author,genre,published_year)VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960),
(2, '1984', 'George Orwell', 'Dystopian', 1949),
(3, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', 1925),
(4, 'Pride and Prejudice', 'Jane Austen', 'Romance', 1813),
(5, 'The Catcher in the Rye', 'J.D. Salinger', 'Coming-of-Age', 1951),
(6,'The India Story', 'Bimal Jalal', 'Novel', 2003),
(7, 'Listen to Your Heart: The London Adventure', 'Ruskin Bond', 'Adventure', 1983),
(8, 'A Place Called Home', 'Preeti Shenoy', 'Nonfiction', 1969),
(9, 'Home in the World','Amartya Sen', 'Drama	', 1877),
(10, 'The Endgame', 'Hussain Zaidi', 'Fiction', 1865),
(11, 'Michael Ondaatje', 'Warlight', 'Fantasy', 2016),
(12, 'The Only Story', 'Julian Barnes', 'Graphic novel', 1978),
(13, 'Moon Tiger', 'Penelope Lively', 'Fairytale', 1831),
(14, 'Gorbachev: His Life and Times', 'William Taubman', 'Philosophy', 2012),
(15, 'No Spin', 'Shane Warne', 'Mystery', 2021);
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(15)
);
INSERT INTO Member(customer_id,customer_name,email,phone_number)VALUES
(1, 'John Doe', 'john.doe@email.com', '123-456-7890'),
(2, 'Jane Smith', 'jane.smith@email.com', '987-654-3210'),
(3, 'Bob Johnson', 'bob.johnson@email.com', '555-123-4567'),
(4, 'Alice Williams', 'alice.w@email.com', '111-222-3333'),
(5, 'Charlie Brown', 'charlie.brown@email.com', '777-888-9999'),
(6, 'Doe', 'do.doe@email.com', '134-456-7890'),
(7, 'Smith', 'smi.smith@email.com', '987-654-4560'),
(8, 'Johnson', 'jhon.johnson@email.com', '665-123-4567'),
(9, 'Williams', 'william.w@email.com', '141-522-3893'),
(10, 'Brown', 'lie.brown@email.com', '679-888-2399'),
(11, 'John', 'john.e@email.com', '178-456-7890'),
(12, 'Jane', 'jane.ne@email.com', '987-324-3210'),
(13, 'Bob', 'bob.on@email.com', '125-123-4567'),
(14, 'Alice', 'alice.will@email.com', '111-456-3333'),
(15, 'Charlie', 'charlie.e@email.com', '888-522-1010');
CREATE TABLE BookLoan (
    loan_id INT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE,
    return_date DATE
);
INSERT INTO BookLoan(loan_id,book_id,member_id,loan_date,return_date)VALUES
(1, 1, 1, '2023-01-01', '2023-01-15'),
(2, 2, 2, '2023-02-01', '2023-02-15'),
(3, 3, 3, '2023-03-01', '2023-03-15'),
(4, 4, 4, '2023-04-01', '2023-04-15'),
(5, 5, 5, '2023-05-01', '2023-05-15'),
(6, 6, 6, '2023-06-01', '2023-06-15'),
(7, 7, 7, '2023-07-01', '2023-07-15'),
(8, 8, 8, '2023-08-01', '2023-08-15'),
(9, 9, 9, '2023-09-01', '2023-09-15'),
(10, 10, 10, '2023-10-01', '2023-10-15'),
(11, 11, 11, '2023-11-01', '2023-11-15'),
(12, 12, 12, '2023-12-01', '2023-12-15'),
(13, 13, 13, '2023-13-01', '2023-13-15'),
(14, 14, 14, '2023-14-01', '2023-14-15'),
(15, 15, 15, '2023-15-01', '2023-15-15');
SELECT * FROM Book
SELECT * FROM Book WHERE published_year > 1950;
UPDATE Book SET genre = 'Literary Fiction' WHERE book_id = 1
DELETE FROM Book WHERE book_id = 4;
INSERT INTO Member VALUES (6, 'Eva Green', 'eva.green@email.com', '999-888-7777');
SELECT Book.title, Book.author, BookLoan.loan_date, BookLoan.return_date
FROM Book
JOIN BookLoan ON Book.book_id = BookLoan.book_id
JOIN Member ON BookLoan.member_id = Member.member_id
WHERE Member.member_name = 'John Doe';
SELECT genre, COUNT(*) AS num_books FROM Book GROUP BY genre;
SELECT * FROM Book ORDER BY published_year ASC LIMIT 1;
SELECT Member.member_name, COUNT(*) AS num_books_borrowed
FROM Member
JOIN BookLoan ON Member.member_id = BookLoan.member_id
GROUP BY Member.member_name
HAVING COUNT(*) > 2;
SELECT * FROM Book WHERE title LIKE '%The%';
SELECT Book.title, Member.member_name, BookLoan.loan_date
FROM Book
JOIN BookLoan ON Book.book_id = BookLoan.book_id
JOIN Member ON BookLoan.member_id = Member.member_id
WHERE MONTH(BookLoan.loan_date) = 2 ;
SELECT Book.title, Member.member_name
FROM Book
JOIN BookLoan ON Book.book_id = BookLoan.book_id
JOIN Member ON BookLoan.member_id = Member.member_id
WHERE Member.member_name LIKE 'J%';
SELECT title FROM Book WHERE EXISTS (
    SELECT 1 FROM BookLoan WHERE BookLoan.book_id = Book.book_id
);
SELECT * FROM Member WHERE member_phone IS NULL;
SELECT * FROM Member WHERE member_email IS NOT NULL;








