SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_title
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no =t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no ASC;       
select * from retirement_title

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (ret.emp_no) ret.emp_no,
ret.first_name,
ret.last_name,
ret.title

INTO cleaned_titles
FROM retirement_title AS ret
WHERE ret.to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

SELECT
COUNT(ret.emp_no), ret.title
INTO titles_to_retire
FROM cleaned_titles as ret
GROUP BY title
ORDER BY COUNT(title) DESC;

SELECT * FROM titles_to_retire


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
INTO mentors
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY emp_no ;

select * from mentors