-- Deliverable 1.

-- 1) Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT e.emp_no,
e.first_name,
e.last_name,
-- 2) Retrieve the title, from_date, and to_date columns from the Titles table.
ti.title,
ti.from_date,
ti.to_date
-- 3) Create a new table using the INTO clause.
INTO retirement_titles
-- 4) Join both tables on the primary key.
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
-- 5) Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;
-- 6) Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 7) Before you export your table, confirm that it looks like this image

-- 8) Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
-- 9) Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
-- 10) Use the DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
-- 11) Create a Unique Titles table using the INTO clause
INTO unique_titles
-- 12) Sort the Unique Titles table in ascending order by the employee number and descending order by the last date (i.e. to_date) of the most recent title.
FROM retirement_titles as rt
ORDER BY emp_no, title DESC;
-- 13) Export the Unique Titles table as unique_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 14) Before you export your table, confirm that it looks like this image
-- 15) Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retirese
-- 16) 	First, retrieve the number of titles from the Unique Titles table.
SELECT COUNT (ut.emp_no), ut.title
-- 17) Then, create a Retiring Titles table to hold the required information.
INTO retiring_titles
FROM unique_titles as ut
-- 18)	Group the table by title, then sort the count column in descending order.
GROUP BY ut.title 
ORDER BY COUNT(title) DESC;
-- 19)	Export the Retiring Titles table as retiring_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 20)	Before you export your table, confirm that it looks like this image:
-- 21) Save your Employee_Database_challenge.sql file in your Queries folder in the Pewlett-Hackard folder.

-- Deliverable 2

-- 1) Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
-- 2) Retrieve the from_date and to_date columns from the Department Employee table.
-- 3) Retrieve the title column from the Titles table.
-- 4) Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    ti.title
-- 5) Create a new table using the INTO clause
INTO mentorship_eligibilty
-- 6) Join the Employees and the Department Employee tables on the primary key.
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
-- 7) Join the Employees and the Titles tables on the primary key.
INNER JOIN titles as ti
ON (e.emp_no = t.emp_no)
-- 8) Filter the data on the to_date column to get current employees whose birth dates are between January 1, 1965 and December 31, 1965.
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
-- 9) Order the table by the employee number.
ORDER BY e.emp_no;
-- 10) Export the Mentorship Eligibility table as mentorship_eligibilty.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 11) Before you export your table, confirm that it looks like this image:








