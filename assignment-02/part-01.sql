CREATE TABLE Members (
  member_id serial,
  first_name varchar(255) not null,
  last_name varchar(255) not null,
  email varchar(255) not null unique,
  phone varchar(15),
  join_date date default CURRENT_DATE,
  primary key (member_id)
);

CREATE TABLE Authors (
  author_id serial,
  first_name varchar(255) not null,
  last_name varchar(255) not null,
  bio text,
  primary key(author_id)
);

CREATE TABLE Publishers (
  publisher_id serial,
  publisher_name varchar(255) not null,
  address varchar(255),
  primary key(publisher_id)
);

CREATE TABLE Books (
  book_id serial,
  title varchar(255) not null,
  author_id INT,
  publisher_id INT,
  published_date date,
  isbn varchar(13) unique,
  available_copies int not null default 1,
  primary key(book_id),
  foreign key (author_id) references Authors,
  foreign key (publisher_id) references Publishers
);

CREATE TABLE Borrowing (
  borrow_id serial,
  book_id serial,
  member_id int,
  borrow_date date default CURRENT_DATE,
  return_date date,
  primary key(borrow_id),
  foreign key (book_id) references Books,
  foreign key (member_id) references Members
);