CREATE DATABASE LIBRARY_MANAGEMENT 


/* ======================= TABLES ========================*/

CREATE TABLE tbl_publisher 
(
		publisher_PublisherName VARCHAR(100) PRIMARY KEY NOT NULL,
		publisher_PublisherAddress VARCHAR(200) NOT NULL,
		publisher_PublisherPhone VARCHAR(50) NOT NULL,
)
SELECT * FROM tbl_publisher
CREATE TABLE tbl_book 
(
		book_BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_Title VARCHAR(100) NOT NULL,
		book_PublisherName VARCHAR(100) NOT NULL 
		CONSTRAINT fk_publisher_name1 FOREIGN KEY REFERENCES tbl_publisher(publisher_PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
)
SELECT * FROM tbl_book
CREATE TABLE tbl_library_branch
 (
		library_branch_BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		library_branch_BranchName VARCHAR(100) NOT NULL,
		library_branch_BranchAddress VARCHAR(200) NOT NULL
)
SELECT * FROM tbl_library_branch
CREATE TABLE tbl_borrower 
(
		borrower_CardNo INT PRIMARY KEY NOT NULL IDENTITY (100,1),
		borrower_BorrowerName VARCHAR(100) NOT NULL,
		borrower_BorrowerAddress VARCHAR(200) NOT NULL,
		borrower_BorrowerPhone VARCHAR(50) NOT NULL
)
SELECT * FROM tbl_borrower
CREATE TABLE tbl_book_loans 
(
		book_loans_LoansID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_loans_BookID INT NOT NULL 
		CONSTRAINT fk_book_id1 FOREIGN KEY REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_BranchID INT NOT NULL 
		CONSTRAINT fk_branch_id1 FOREIGN KEY REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_CardNo INT NOT NULL 
		CONSTRAINT fk_cardno FOREIGN KEY REFERENCES tbl_borrower(borrower_CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
		book_loans_DateOut VARCHAR(50) NOT NULL,
		book_loans_DueDate VARCHAR(50) NOT NULL
)
SELECT * FROM tbl_book_loans
CREATE TABLE tbl_book_copies 
(
		book_copies_CopiesID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_copies_BookID INT NOT NULL 
		CONSTRAINT fk_book_id2 FOREIGN KEY REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_copies_BranchID INT NOT NULL 
		CONSTRAINT fk_branch_id2 FOREIGN KEY REFERENCES tbl_library_branch(library_branch_BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_copies_No_Of_Copies INT NOT NULL
)
SELECT * FROM tbl_book_copies
CREATE TABLE tbl_book_authors 
(
		book_authors_AuthorID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		book_authors_BookID INT NOT NULL 
		CONSTRAINT fk_book_id3 FOREIGN KEY REFERENCES tbl_book(book_BookID) ON UPDATE CASCADE ON DELETE CASCADE,
		book_authors_AuthorName VARCHAR(50) NOT NULL
)
SELECT * FROM tbl_book_authors


/*======================== END TABLES ======================*/


INSERT INTO tbl_publisher VALUES
(
	'DAW Books',
	'375 Hudson Street, New York, NY 10014',
	'212-366-2000'
),
(
	'Viking',
	'385 Hudson Street, New York, NY 12014',
	'212-366-2000'
),
(
	'Signet Books',
	'365 Hudson Street, New York, NY 11014',
	'212-366-2000'
),
(
	'Chilton Books',
	'Not Available',
	'Not Available'
),
(
	'George Allen & Unwin',
	'83 Alexander Ln, Crows Nest NSW 2065, Australia',
	'+61-2-8425-0100'
),
(
	'Alfred A. Knopf',
	'The Knopf Doubleday,New York, NY 10019',
	'212-940-7390'
),		
(
	'Bloomsbury',
	'Bloomsbury Publishing Inc.,New York, NY 10018',
	'212-419-5300'
),
(
	'Shinchosa',
	'Oga Bldg. 8,Tokyo 101-0064 Japan',
	'+81-3-5577-6507'
),
(
	'Harper and Row',
	'HarperCollins Publishers,New York, NY 10007',
	'212-207-7000'
)
SELECT * FROM tbl_publisher
INSERT INTO tbl_book(book_Title, book_PublisherName)VALUES 
(	'The Name of the Wind', 
	'DAW Books'
),
(
	'It', 
	'Viking'
),
(	'The Green Mile', 
	'Signet Books'
),
(	
	'Dune',
	'Chilton Books'
),
(
	'The Hobbit', 
	'George Allen & Unwin'
),
(
	'Eragon', 
	'Alfred A. Knopf'
),
(
	'A Wise Mans Fear', 
	'DAW Books'
),
(
	'Harry Potter and the Philosophers Stone', 
	'Bloomsbury'
),
(
	'Hard Boiled Wonderland and The End of the World',
	 'Shinchosa'
),
(
	'The Giving Tree', 
	'Harper and Row'
)

SELECT * FROM tbl_book
SELECT * FROM tbl_book WHERE book_PublisherName = 'George Allen & Unwin'

INSERT INTO tbl_library_branch
(library_branch_BranchName, library_branch_BranchAddress)VALUES
(
	'Sharpstown',
	'32 Corner Road, New York, NY 10012'
),
(
	'Central',
	'491 3rd Street, New York, NY 10014'
),
(
	'Saline',
	'40 State Street, Saline, MI 48176'
),
(
	'Ann Arbor',
	'101 South University, Ann Arbor, MI 48104'
)
	UPDATE tbl_library_branch
	SET library_branch_BranchName = 'UNION'
	WHERE library_branch_BranchID = 2
SELECT * FROM tbl_library_branch

INSERT INTO tbl_borrower
(borrower_BorrowerName, borrower_BorrowerAddress, borrower_BorrowerPhone)VALUES
(
	'Joe Smith',
	'1321 4th Street, New York, NY 10014',
	'212-312-1234'
),
(
	'Jane Smith',
	'1321 4th Street, New York, NY 10014',
	'212-931-4124'
),
(
	'Tom Li',
	'981 Main Street, Ann Arbor, MI 48104',
	'734-902-7455'
),
(
	'Angela Thompson',
	'2212 Green Avenue, Ann Arbor, MI 48104',
	'313-591-2122'
),
(
	'Harry Emnace',
	'121 Park Drive, Ann Arbor, MI 48104',
	'412-512-5522'
),
(
	'Tom Haverford',
	'23 75th Street, New York, NY 10014',
	'212-631-3418'
),
(
	'Haley Jackson',
	'231 52nd Avenue New York, NY 10014',
	'212-419-9935'
),
(
	'Michael Horford',
	'653 Glen Avenue, Ann Arbor, MI 48104',
	'734-998-1513'
)	
SELECT * FROM tbl_borrower
INSERT INTO tbl_book_loans
(book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)VALUES
(
	'1',
	'1',
	'100',
	'1/1/18',
	'2/2/18'
)

INSERT INTO tbl_book_loans
(book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)VALUES
(
	'2',
	'1',
	'100',
	'1/1/18',
	'2/2/18'
)

INSERT INTO tbl_book_loans
(book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)VALUES
(
	'3',
	'1',
	'100',
	'1/1/18',
	'2/2/18'
)

INSERT INTO tbl_book_loans
(book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)VALUES
(
	'4',
	'1',
	'100',
	'1/1/18',
	'5/2/18'
)

INSERT INTO tbl_book_loans
(book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)VALUES
(
	'5',
	'4',
	'102',
	'1/3/18',
	'8/3/18'
)
INSERT INTO tbl_book_loans
(book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)VALUES
(
	'9',
	'1',
	'102',
	'1/3/18',
	'2/3/18'
)
INSERT INTO tbl_book_loans
(book_loans_BookID, book_loans_BranchID, book_loans_CardNo, book_loans_DateOut, book_loans_DueDate)VALUES
(
	'10',
	'2',
	'105',
	'12/12/17',
	'1/12/17'
)
SELECT * FROM tbl_book_loans
INSERT INTO tbl_book_copies
(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)VALUES
(
	'1',
	'1',
	'5'
)

INSERT INTO tbl_book_copies
(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)VALUES
(
	'2',
	'1',	
	'5'
)

INSERT INTO tbl_book_copies
(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)VALUES
(
	'3',
	'1',
	'5'
)

INSERT INTO tbl_book_copies
(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)VALUES
(
	'4',
	'1',
	'5'
)

INSERT INTO tbl_book_copies
(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)VALUES
(
	'5',
	'1',
	'5'
)

INSERT INTO tbl_book_copies
(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)VALUES
(
	'6',
	'1',
	'5'
)

INSERT INTO tbl_book_copies
(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)VALUES
(
	'7',
	'1',
	'5'
)

INSERT INTO tbl_book_copies
(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)VALUES
(
	'8',
	'1',
	'5'
)

INSERT INTO tbl_book_copies
(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)VALUES
(
	'9',
	'1',
	'5'
)

INSERT INTO tbl_book_copies
(book_copies_BookID, book_copies_BranchID, book_copies_No_Of_Copies)VALUES
(
	'10',
	'1',
	'5'
)
SELECT * FROM tbl_book_copies

INSERT INTO tbl_book_authors
(book_authors_BookID,book_authors_AuthorName)VALUES
(
	'1',
	'Patrick Rothfuss'
)

INSERT INTO tbl_book_authors
(book_authors_BookID,book_authors_AuthorName)VALUES
(
	'2',
	'Stephen King'
)

INSERT INTO tbl_book_authors
(book_authors_BookID,book_authors_AuthorName)VALUES
(
	'3',
	'Stephen King'
)

INSERT INTO tbl_book_authors
(book_authors_BookID,book_authors_AuthorName)VALUES
(
	'4',
	'Frank Herbert'
)

INSERT INTO tbl_book_authors
(book_authors_BookID,book_authors_AuthorName)VALUES
(
	'5',
	'J.R.R. Tolkien'
)

INSERT INTO tbl_book_authors
(book_authors_BookID,book_authors_AuthorName)VALUES
(
	'6',
	'Christopher Paolini'
)

INSERT INTO tbl_book_authors
(book_authors_BookID,book_authors_AuthorName)VALUES
(
	'7',
	'Patrick Rothfuss'
)

INSERT INTO tbl_book_authors
(book_authors_BookID,book_authors_AuthorName)VALUES
(
	'8',
	'J.K. Rowling'
)

INSERT INTO tbl_book_authors
(book_authors_BookID,book_authors_AuthorName)VALUES
(
	'9',
	'Haruki Murakami'
)
	SELECT * FROM tbl_book_authors
	
/*============================== END POPULATING TABLES ==============================*/
	
	