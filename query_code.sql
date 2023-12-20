-- List the employee number, last name, first name, sex, and salary of each employee.
Select ee.emp_no, last_name, first_name, sex, s.salary 
from employees ee
Join salaries s ON ee.emp_no = s.emp_no

-- List the first name, last name, and hire date for the employees who were hired in 1986.
Select first_name, last_name, hire_date
from employees
Where EXTRACT (YEAR FROM hire_date) = 1986;

-- -- List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select t.title, dm.dept_no, d.dept_name, ee.emp_no, ee.last_name, ee.first_name
from employees ee
JOIN titles t on ee.emp_title_id = t.title_id
Join dept_manager dm on ee.emp_no = dm.emp_no
Join departments d on dm.dept_no = d.dept_no

-- -- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select d.dept_no, ee.emp_no, ee.last_name, ee.first_name, d.dept_name
from employees ee
Join dept_manager dm on ee.emp_no = dm.emp_no
Join departments d on dm.dept_no = d.dept_no

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
Select first_name, last_name, sex
from employees
Where first_name = 'Hercules' AND last_name like 'B%';


-- List each employee in the Sales department, including their employee number, last name, and first name.
Select d.dept_name, ee.emp_no, ee.last_name, ee.first_name
from departments d
Join dept_manager dm on dm.dept_no = d.dept_no
Join employees ee on ee.emp_no = dm.emp_no
Where d.dept_name = 'Sales'


-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select d.dept_name, ee.emp_no, ee.last_name, ee.first_name
from departments d
Join dept_manager dm on dm.dept_no = d.dept_no
Join employees ee on ee.emp_no = dm.emp_no
Where d.dept_name = 'Sales' OR d.dept_name ='Development'

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
Select last_name, COUNT(*) AS frequency
from employees
Group By last_name
Order By frequency DESC;