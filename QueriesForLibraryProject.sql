CREATE PROC GetByTitleAndBranch @BookTitle varchar(50) = 'The Lost Tribe',@Branch varchar(30)= 'Sharpstown'
AS
	SELECT
	LB.BranchName
	,B.Title
	,BC.No_of_Copies
	FROM BOOK_INFO.Book AS B
	INNER JOIN LIBRARY_AND_BOOK.Book_Copies AS BC
	ON B.BookID = BC.BookID
	INNER JOIN LIBRARY_INFO.Library_Branch AS LB
	ON BC.BranchID = LB.BranchID
	WHERE B.Title = @BookTitle
	AND LB.BranchName = @Branch

CREATE PROC GetBookCopies @BookTitle varchar(50) = 'The Lost Tribe'
AS
	SELECT
	LB.BranchName
	,B.Title
	,BC.No_of_Copies
	FROM BOOK_INFO.Book AS B
	INNER JOIN LIBRARY_AND_BOOK.Book_Copies AS BC
	ON B.BookID = BC.BookID
	INNER JOIN LIBRARY_INFO.Library_Branch AS LB
	ON BC.BranchID = LB.BranchID
	WHERE B.Title = @BookTitle



SELECT
BR.CardNo
,BR.Name
,BL.BookID
FROM PERSON.Borrower AS BR
LEFT OUTER JOIN LIBRARY_AND_BOOK.Book_Loans AS BL
ON BR.CardNo = BL.CardNo
WHERE BL.BookID IS NULL

CREATE PROCEDURE GetBookByBranchAndDueDate @Branch varchar(50) = 'Sharpstown',@Due varchar(25) = '2016-12-17'
AS
	SELECT
	B.Title
	,BR.Name
	,BR.[Address]
	,B.BookID
	FROM LIBRARY_INFO.Library_Branch AS LB
	INNER JOIN LIBRARY_AND_BOOK.Book_Loans AS BL
	ON LB.BranchID = BL.BranchID
	INNER JOIN BOOK_INFO.Book AS B
	ON BL.BookID = B.BookID
	INNER JOIN PERSON.Borrower AS BR
	ON BL.CardNo = BR.CardNo
	WHERE LB.BranchName = @Branch
	AND BL.DueDate = @Due


SELECT 
LB.BranchName
,COUNT(*) AS 'No. of Books Loaned'
FROM LIBRARY_INFO.Library_Branch AS LB
INNER JOIN LIBRARY_AND_BOOK.Book_Loans AS BL
ON LB.BranchID = BL.BranchID
GROUP BY LB.BranchName

CREATE PROCEDURE GetBorrowerWithMoreThanXBooks @Num_Borrowed int = 5
AS
	SELECT
	BR.Name
	,BR.[Address]
	,COUNT(*) AS 'No. of Books Out'
	FROM PERSON.Borrower AS BR
	INNER JOIN LIBRARY_AND_BOOK.Book_Loans AS BL
	ON BR.CardNo = BL.CardNo
	GROUP BY BR.Name,BR.[Address]
	HAVING COUNT(*) > @Num_Borrowed


CREATE PROCEDURE GetBookByAuthorAndBranch @Author varchar(50) = 'Stephen King',@Branch varchar(50) = 'Central'
AS
	SELECT
	B.Title
	,BC.No_of_Copies
	FROM BOOK_INFO.Book AS B
	INNER JOIN BOOK_INFO.Book_Authors AS BA
	ON B.BookID = BA.BookID
	INNER JOIN LIBRARY_AND_BOOK.Book_Copies AS BC
	ON B.BookID = BC.BookID
	INNER JOIN LIBRARY_INFO.Library_Branch AS LB
	ON BC.BranchID = LB.BranchID
	WHERE BA.AuthorName = @Author
	AND LB.BranchName = @Branch