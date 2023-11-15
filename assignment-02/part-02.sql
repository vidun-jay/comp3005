-- a. List of all book titles.
SELECT title FROM books;

-- b. Names of all members who joined after January 1, 2023.
SELECT first_name, last_name FROM members
WHERE join_date > '2023-01-01';

-- c. Total number of books borrowed by each member (display member name and count).
SELECT first_name, last_name, COUNT(book_id)
FROM members NATURAL JOIN borrowing
GROUP BY first_name, last_name

-- d. List of authors who have more than one book in the database.
SELECT first_name, last_name, COUNT(book_id)
FROM authors NATURAL JOIN books
GROUP BY first_name, last_name
HAVING COUNT(book_id) > 1

-- e. Names of members who have not borrowed any books.
SELECT first_name, last_name, COUNT(book_id)
FROM members NATURAL JOIN borrowing
GROUP BY first_name, last_name
HAVING COUNT(book_id) < 1

-- f. Most recently published book.
SELECT * FROM books
ORDER BY published_date DESC
LIMIT 1

-- g. Publishers and the number of books they've published.
SELECT publisher_name, COUNT(book_id)
FROM publishers
NATURAL JOIN books
GROUP BY publisher_name

-- h. List of books that have never been borrowed.
SELECT *
FROM books LEFT JOIN borrowing ON books.book_id = borrowing.book_id
WHERE borrowing.book_id IS NULL

-- i. Members who have borrowed books written by "J.K. Rowling".
SELECT members.first_name, members.last_name
FROM members
INNER JOIN borrowing ON members.member_id = borrowing.member_id
INNER JOIN books ON borrowing.book_id = books.book_id
INNER JOIN authors ON books.author_id = authors.author_id
WHERE authors.author_id = 1

-- j. Authors whose books have been borrowed more than three times.
SELECT authors.first_name, authors.last_name, COUNT(borrowing.book_id)
FROM borrowing
INNER JOIN books ON borrowing.book_id = books.book_id
INNER JOIN authors ON books.author_id = authors.author_id
GROUP BY authors.first_name, authors.last_name
HAVING COUNT(borrowing.book_id) > 3