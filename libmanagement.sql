CREATE DATABASE librarymanagement;


USE librarymanagement;


CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255),
    ISBN VARCHAR(20) UNIQUE,
    PublicationYear INT,
    Genre VARCHAR(50),
    TotalCopies INT,
    AvailableCopies INT,
    Location VARCHAR(50)
);


CREATE TABLE LibraryUsers (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Name VARCHAR(100),
    Email VARCHAR(100),
    LibraryCardNumber VARCHAR(20) UNIQUE NOT NULL,
    AccountStatus ENUM('Active', 'Suspended') DEFAULT 'Active'
);


CREATE TABLE Librarians (
    LibrarianID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Name VARCHAR(100),
    Email VARCHAR(100)
);


CREATE TABLE Transactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    BookID INT,
    TransactionType ENUM('Checkout', 'Return'),
    TransactionDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    LateFee DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES LibraryUsers(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);


CREATE TABLE Catalog (
    CatalogID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    AvailabilityStatus ENUM('Available', 'Checked Out') DEFAULT 'Available',
    ReservationStatus ENUM('Reserved', 'Not Reserved') DEFAULT 'Not Reserved',
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);


CREATE TABLE LateFees (
    LateFeeID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    TransactionID INT,
    LateFeeAmount DECIMAL(10, 2),
    PaymentStatus ENUM('Paid', 'Unpaid') DEFAULT 'Unpaid',
    FOREIGN KEY (UserID) REFERENCES LibraryUsers(UserID),
    FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID)
);

INSERT INTO Books (Title, Author, ISBN, PublicationYear, Genre, TotalCopies, AvailableCopies, Location)
VALUES
    ('The Catcher in the Rye', 'J.D. Salinger', '9780316769174', 1951, 'Fiction', 5, 5, 'Shelf A'),
    ('To Kill a Mockingbird', 'Harper Lee', '9780061120084', 1960, 'Fiction', 8, 8, 'Shelf B'),
    ('1984', 'George Orwell', '9780451524935', 1949, 'Dystopian', 6, 6, 'Shelf C'),
    ('The Great Gatsby', 'F. Scott Fitzgerald', '9780743273565', 1925, 'Fiction', 7, 7, 'Shelf D'),
    ('Pride and Prejudice', 'Jane Austen', '9780679783268', 1813, 'Romance', 4, 4, 'Shelf E'),
    ('Brave New World', 'Aldous Huxley', '9780060850524', 1932, 'Dystopian', 5, 5, 'Shelf F'),
    ('The Lord of the Rings', 'J.R.R. Tolkien', '9780618640157', 1954, 'Fantasy', 9, 9, 'Shelf G'),
    ('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', '9780590353427', 1997, 'Fantasy', 10, 10, 'Shelf H'),
    ('The Hobbit', 'J.R.R. Tolkien', '9780547928227', 1937, 'Fantasy', 6, 6, 'Shelf I'),
    ('Moby-Dick', 'Herman Melville', '9780142000083', 1851, 'Adventure', 3, 3, 'Shelf J');

INSERT INTO LibraryUsers(Username, Password, Name, Email, LibraryCardNumber)
VALUES
    ('HEMANSHI89','123','HEMANSHI','hemanshi29@gmail.com','9001'),
    ('prachi12','123','PRACHI','prachi87@gmail.com','9002'),
    ('rit78','123','RIT','ritdave67@gmail.com','9003'),
    ('nakul90','123','NAKUL','nakuljadhav3@gmail.com','9004'),
    ('HET559','123','HET','hetpatel0@gmail.com','9005'),
    ('34AXAY6','123','AXAY','axayshah2@gmail.com','9006'),
    ('MINAXI4','123','MIANAXI','minaxisingh7@gmail.com','9007'),
    ('raj186','123','RAJ','rajpatil9@gmail.com','9008'),
    ('sahilk982','123','SAHIL','sahilpatel34@gmail.com','9009'),
    ('yash76','123','YASH','yashchavda93@gmail.com','9010');

INSERT INTO Librarians(Username , Password ,Name ,Email)
VALUES
    ('shivin67','7642','SHIVIN','shivin78@gmail.com'),
    ('ASTHA245','3576','ASTHA','asthapatil98@gmail.com'),
    ('VINIT99','3556','VINIT','vinitkumar73@gmail.com'),
    ('NITYA56','4455','NITYA','nityaali36@gmail.com'),
    ('NIKITA2','3567','NIKITA','nikitaship2@gmail.com'),
    ('viraj53','5768','VIRAJ','virajgandhi56@gmail.com'),
    ('cintan22','8889','CHINTAN','chintanhadiya0@gmail.com'),
    ('nimesh55','3578','NIMESH','nimeshpatil8@gmail.com'),
    ('rajesh88','4444','RAJESH','rajeshgupta77@gmail.com'),
    ('lakhan66','8659','LAKHAN','lakhanpatel1@gmail.com');


INSERT INTO Transactions(UserID ,BookID ,TransactionType ,TransactionDate ,DueDate ,ReturnDate ,LateFee )
VALUES
    ('45','67','checkout','30/6/2023','12/7/2023','15/7/2023','50.50'),
    ('89','66','return','30/6/2023','10/8/2023','2/8/2023','230.00'),
    ('44','44','checkout','12/7/2023','30/7/2023','28/7/2023','100.00'),
    ('66','85','return','15/7/2023','29/7/2023','30/7/2023','79.00'),
    ('89','65','return','16/7/2023','30/7/2023','30/7/2023','99.00'),
    ('23','24','checkout','25/7/2023','30/8/2023','18/8/2023','120.00'),
    ('57','46','return','28/7/2023','21/8/2023','30/8/2023','150.80'),
    ('24','56','checkout','30/7/2023','12/8/2023','30/8/2023','76.30'),
    ('89','87','return','2/8/2023','28/8/2023','5/9/2023','60.66'),
    ('98','90','checkout','5/8/2023','15/8/2023','10/9/2023','80.78');


INSERT INTO Catalog(BookID )
VALUES
    ('67'),
    ('66'),
    ('44'),
    ('85'),
    ('65'),
    ('24'),
    ('46'),
    ('56'),
    ('87'),
    ('98');


INSERT INTO LateFees (UserID ,TransactionID ,LateFeeAmount)
VALUES
    ('45','','0'),
    ('89','','50'),
    ('44','','20'),
    ('66','','0'),
    ('89','','0'),
    ('23','','100'),
    ('57','','0'),
    ('24','','0'),
    ('89','','0'),
    ('98','','0');