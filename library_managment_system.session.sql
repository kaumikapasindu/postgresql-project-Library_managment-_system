-- Lirary Management Sysytem

-- creating branch table

CREATE TABLE branch(
    branch_id VARCHAR(10) PRIMARY KEY,
	manager_id VARCHAR(10),
	branch_address VARCHAR(55),
	contact_no VARCHAR (10)
);



-- creating employee table

CREATE TABLE employee(
    emp_id VARCHAR(10) PRIMARY KEY,
 	emp_name VARCHAR(25),
	position  VARCHAR(15),
 	salary FLOAT,
    branch_id VARCHAR(25) --fk
);



-- creating book table

CREATE TABLE book(
    isbn VARCHAR(20) PRIMARY KEY,
	book_title VARCHAR(75),
	category VARCHAR(10),
    rental_price FLOAT,
    status	VARCHAR(15),
    author	VARCHAR(35),
    publisher VARCHAR(35)
);



-- creating member table

CREATE TABLE member(
    member_id VARCHAR(10) PRIMARY KEY,
	member_name VARCHAR(25),
	member_address VARCHAR(75),
	reg_date DATE
);


-- creating issue table

CREATE TABLE issued_status(
    issued_id VARCHAR(10) PRIMARY KEY,
	issued_member_id VARCHAR(10),--fk
	issued_book_name VARCHAR(75),
	issued_date DATE,
	issued_book_isbn VARCHAR(25),--fk
	issued_emp_id VARCHAR (10)--fk
);


-- creating return_status table

CREATE TABLE return_status(
   return_id VARCHAR(10) PRIMARY KEY,
   issued_id VARCHAR (10),
   return_book_name	VARCHAR(75),
   return_date DATE,	
   return_book_isbn VARCHAR(2)
);


-- Foreigne key

ALTER TABLE issued_status
ADD CONSTRAINT  fk_members
FOREIGN KEY (issued_member_id)
REFERENCES member(member_id);

ALTER TABLE issued_status
ADD CONSTRAINT  fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES book(isbn);

ALTER TABLE issued_status
ADD CONSTRAINT  fk_employees
FOREIGN KEY (issued_emp_id)
REFERENCES employee(emp_id);

ALTER TABLE employee
ADD CONSTRAINT  fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);

ALTER TABLE return_status
ADD CONSTRAINT  fk_issued_states
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);


-- Insert data for table

-- Insert branch table

COPY branch
FROM 'E:\csv_files\branch.csv'
DELIMITER ','
CSV HEADER;

-- Insert employee table

COPY employee
FROM 'E:\csv_files\employees.csv'
DELIMITER ','
CSV HEADER;

-- Insert books table

COPY book
FROM 'E:\csv_files\books.csv'
DELIMITER ','
CSV HEADER;

-- Insert member table

COPY member
FROM 'E:\csv_files\members.csv'
DELIMITER ','
CSV HEADER;

-- Insert issued_status table

COPY issued_status
FROM 'E:\csv_files\issued_status.csv'
DELIMITER ','
CSV HEADER;

-- Insert return_status table


COPY return_status
FROM 'E:\csv_files\return_status.csv'
DELIMITER ','
CSV HEADER;




