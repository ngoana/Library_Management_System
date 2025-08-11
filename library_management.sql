-- Drop tables if they exist
DROP TABLE IF EXISTS BookAuthors;
DROP TABLE IF EXISTS BorrowingRecords;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Members;
DROP TABLE IF EXISTS Librarians;

-- Categories Table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL UNIQUE
);

-- Authors Table
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL
);

-- Books Table
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(13) NOT NULL UNIQUE,
    PublishedYear YEAR,
    CategoryID INT,
    CONSTRAINT fk_category FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- BookAuthors Table
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    CONSTRAINT fk_book FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT fk_author FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Members Table
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    JoinDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Librarians Table
CREATE TABLE Librarians (
    LibrarianID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE
);

-- BorrowingRecords Table
CREATE TABLE BorrowingRecords (
    BorrowID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT NOT NULL,
    MemberID INT NOT NULL,
    BorrowDate DATE NOT NULL,
    ReturnDate DATE,
    LibrarianID INT,
    CONSTRAINT fk_borrow_book FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT fk_borrow_member FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    CONSTRAINT fk_borrow_librarian FOREIGN KEY (LibrarianID) REFERENCES Librarians(LibrarianID)
);
