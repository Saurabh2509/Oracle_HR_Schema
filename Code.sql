PROBLEM_STATEMENT : 

1.	Display details of jobs where the minimum salary is greater than 10000.

        Select * from Hr.Jobs 
        where MIN_SALARY>10000
        
2.	Display the first name and join date of the employees who joined between 2002 and 2005.

        Select Hr.Employees.FIRST_NAME ,Hr.Job_history.START_DATE From Hr.Employees 
        Join Hr.Job_history 
        Using(JOB_ID) 
        where START_DATE between Date'2002-01-01' and Date '2005-12-31'
        
3.	Display first name and join date of the employees who is either IT Programmer or Sales Man.

        Select emp.FIRST_NAME,emp.hire_date,jbs.JOB_TITLE  From Hr.Employees emp
        join Hr.jobs jbs
        using(job_id) 
        where JOB_TITLE='Programmer' OR JOB_TITLE='Sales Manager' 
        
4.	Display employees who joined after 1st January 2008.

        Select Hr.Employees.EMPLOYEE_ID,Hr.Employees.FIRST_NAME,Hr.Employees.LAST_NAME,Hr.Job_history.START_DATE  From Hr.Employees 
        Join Hr.Job_history 
        Using(job_id) 
        where START_DATE  > Date '2008-01-01' 
        
5.	Display details of employee with ID 150 or 160.

        Select Hr.Employees.EMPLOYEE_ID,Hr.Employees.FIRST_NAME,Hr.Employees.LAST_NAME From  Hr.Employees 
        where EMPLOYEE_ID=150 OR EMPLOYEE_ID=160

6.	Display first name, salary, commission pct, and hire date for employees with salary less than 10000.

        Select Hr.Employees.FIRST_NAME,Hr.Employees.SALARY,Hr.Employees.HIRE_DATE ,Hr.Employees.COMMISSION_PCT From  Hr.Employees 
        where SALARY<10000
        
7.	Display job Title, the difference between minimum and maximum salaries for jobs with max salary in the range 10000 to 20000.

        Select Hr.Jobs.JOB_TITLE ,Hr.Jobs.MAX_SALARY-Hr.Jobs.MIN_SALARY as diff_sal  From Hr.Jobs 
        where Hr.Jobs.MAX_SALARY-Hr.Jobs.MIN_SALARY between 10000 and 20000 
        
8.	Display first name, salary, and round the salary to thousands.

        Select Hr.Employees.FIRST_NAME,round(Hr.Employees.SALARY,-3) From Hr.Employees

9.	Display details of jobs in the descending order of the title.

        Select * from Hr.jobs 
        order by JOB_TITLE  Desc

10.	Display employees where the first name or last name starts with S.

        Select Hr.Employees.*   From Hr.Employees 
        where Hr.Employees.FIRST_NAME like 's%' or  Hr.Employees.LAST_NAME like '%s' 
        
11.	Display employees who joined in the month of May.

        Select Hr.Employees.*   From Hr.Employees 
        where to_char(HIRE_DATE,'mon')='may'
        
12.	Display details of the employees where commission percentage is null and salary in the range 5000 to 10000 and department is 30.

        Select Hr.Employees.*   From Hr.Employees 
        where COMMISSION_PCT is null and SALARY between 5000 and 10000 and DEPARTMENT_ID=60  
        
13.	Display first name and date of first salary of the employees.

        Select Hr.Employees.FIRST_NAME ,LAST_DAY(HIRE_DATE)+1 as Date_of_first_salary From Hr.Employees 
        ----[or]
        Select Hr.Employees.FIRST_NAME ,LAST_DAY(HIRE_DATE) as Date_of_first_salary From Hr.Employees 
        
14.	Display first name and experience of the employees.

        Select emp.FIRST_NAME,FLOOR((SYSDATE-emp.HIRE_DATE)/365) as Exprience From Hr.Employees emp

15.	Display first name of employees who joined in 2001.

        Select emp.FIRST_NAME,emp.HIRE_DATE  From Hr.Employees emp
        where Hire_Date between Date'2001-01-01' and Date '2001-12-31' 

16.	Display first name and last name after converting the first letter of each name to upper case and the rest to lower case.

        Select INITCAP(Hr.Employees.FIRST_NAME) as First_Name ,INITCAP(Hr.Employees.LAST_NAME) as Last_Name From Hr.Employees 

17.	Display the first word in job title.

        Select SUBSTR(Hr.jobs.job_title,1) From Hr.jobs 

18.	Display the length of first name for employees where last name contain character ‘b’ after 3rd position.


19.	Display first name in upper case and email address in lower case for employees where the first name and email address are same irrespective of the case.

        Select Upper(Hr.Employees.FIRST_NAME) ,lower(Hr.Employees.EMAIL) From Hr.Employees 
        where FIRST_NAME = EMAIL

20.	Display employees who joined in the current year.

        Select Hr.Employees.*  From Hr.Employees  
        where to_char(HIRE_DATE,'YYYY') =to_char(SYSDATE,'YYYY')
        
21.	Display the number of days between system date and 1st January 2011.
        
        Select Sysdate-Date'2011-01-01' From Dual
        
22.	Display how many employees joined in each month of the current year.

        Select to_char(Hr.Employees.HIRE_DATE,'MM') ,count(*) From  Hr.Employees 
        where to_char(HIRE_DATE,'YYYY') = to_char(SYSDATE,'YYYY')  
        Group by to_char(HIRE_DATE,'MM')
        
23.	Display manager ID and number of employees managed by the manager.

        Select emp.MANAGER_ID,count(emp.employee_id) From  Hr.Employees emp
        Group by MANAGER_ID	
        
24.	Display employee ID and the date on which he ended his previous job.
25.	Display number of employees joined after 15th of the month.

        Select FIRST_NAME,LAST_NAME,HIRE_DATE From Hr.Employees 
        where to_char(HIRE_DATE ,'dd') >'15'

26.	Display the country ID and number of cities we have in the country.

        Select COUNTRY_ID,Count(CITY) From Hr.Locations  
        Group by COUNTRY_ID
        
27.	Display average salary of employees in each department who have commission percentage.

        Select Avg(SALARY) ,DEPARTMENT_ID From Hr.Employees 
        where COMMISSION_PCT >0 
        Group by DEPARTMENT_ID
        
28.	Display job ID, number of employees, sum of salary, and difference between highest salary and lowest salary of the employees of the job.

        Select Job_id ,Sum(Salary),Max(Salary)-Min(Salary),count(EMPLOYEE_ID) From Hr.Employees
        Group by job_id
        
29.	Display job ID for jobs with average salary more than 10000.

        Select Job_id ,avg(salary) From Hr.Employees
        Group by job_id having avg(Salary) >10000
        
30.	Display years in which more than 10 employees joined.

        Select to_char(Hire_date,'YYYY') From Hr.Employees 
        Group by to_char(Hire_date,'YYYY') having count(EMPLOYEE_ID)>10
        
31.	Display departments in which more than five employees have commission percentage.

        Select DEPARTMENT_ID  From Hr.Employees  
        where COMMISSION_PCT>0 
        Group by DEPARTMENT_ID  having count(EMPLOYEE_ID)>5 
        
32.	Display employee ID for employees who did more than one job in the past.

        Select EMPLOYEE_ID from Hr.Job_history  
        Group by EMPLOYEE_ID having count(Employee_id)>1
        
33.	Display job ID of jobs that were done by more than 3 employees for more than 100 days.

        Select Job_ID From Hr.Job_history 
        where (End_date-start_date)>100
        Group by Job_id having count(Employee_id)>3
        
34.	Display department ID, year, and Number of employees joined.

        Select Department_id ,to_char(hire_date,'YYYY'),count(Employee_id)  From hr.Employees
        Group by DEPARTMENT_ID, (HIRE_DATE, 'YYYY') 
        order by DEPARTMENT_ID
        
35.	Display departments where any manager is managing more than 5 employees.

        Select Department_id  From hr.Employees 
        Group by Department_id having  count(MANAGER_ID)>5
        
36.	Change salary of employee 115 to 8000 if the existing salary is less than 6000.

        Update Hr.Employees  
        Set Salary=8000 
        where employee_id =115 and Salary <6000 
        Error:[ORA-01031: insufficient privileges]
        
38.	Insert a new employee into employees with all the required details.

        Error:[ORA-01031: insufficient privileges]
        
40.	Change job ID of employee 110 to IT_PROG if the employee belongs to department 10 and the existing job ID does not start with IT.

        Error:[ORA-01031: insufficient privileges]
        
41.	Display job title, department name, employee last name, starting date for all jobs from 2000 to 2005.

        Select 	jbl.JOB_TITLE,dept.DEPARTMENT_NAME,emp.LAST_NAME,jbh.START_DATE From Hr.Employees emp 
        Join Hr.Job_history jbh 
        on(emp.job_id = jbh.job_id) 
        Join Hr.jobs jbl 
        on(emp.job_id=jbl.job_id) 
        Join Hr.departments dept 
        on(emp.DEPARTMENT_ID = dept.DEPARTMENT_ID) 
        where to_char(jbh.Start_date ,'YYYY') between 2000 and 2005
        
42.	Display department name and number of employees in the department.

        Select 	dept.DEPARTMENT_NAME,count(emp.Employee_id) as Count_Employee From Hr.Departments dept
        inner join hr.employees emp
        on(dept.department_id = emp.department_id)
        Group by department_name

43.	Display job title, employee ID, number of days between ending date and starting date for all jobs in department 30 from job history.

        Select jbs.EMPLOYEE_ID,jbs.JOB_ID,jbs.DEPARTMENT_ID,(jbs.End_date-jbs.Start_date) as Days_,job.JOB_TITLE From Hr.Job_history jbs  
        Left join Hr.jobs job   
        on(jbs.Job_id = job.Job_id) 
        where DEPARTMENT_ID=30
        
44.	Display department name, manager name, and city.[using manager_id]

        Select dep.DEPARTMENT_ID,dep.DEPARTMENT_NAME,dep.MANAGER_ID,dep.LOCATION_ID , loc.CITY From hr.Departments dep 
        FUll outer Join hr.Locations loc 
        on(dep.LOCATION_ID = loc.LOCATION_ID)  
        
45.	Display department name, manager name, and salary of the manager for all managers whose experience is more than 5 years.[No manager name is there][sol by me on manager id]
        
        Select 	dept.DEPARTMENT_NAME,emp.LAST_NAME,emp.SALARY,emp.Manager_id From Hr.Employees emp 
        Join Hr.departments dept 
        on(emp.DEPARTMENT_ID = dept.DEPARTMENT_ID) 
        where to_char(SYSDATE,'YYYY')-(to_char(Hire_date ,'YYYY'))>5
        
46.	Display employee name if the employee joined before his manager.[Self join]

        Select emp.FIRST_NAME,emp.LAST_NAME From Hr.Employees emp 
        Join Hr.Employees mm 
        on(emp.EMPLOYEE_ID= mm.MANAGER_ID) 
        where to_char(emp.Hire_date,'YYYY') < to_char(mm.Hire_date,'YYYY')
        
47.	Display employee name, job title for the jobs employee did in the past where the job was done less than six months.

        Select emp.First_name ,emp.last_name ,job.job_title From hr.employees emp 
        Join Hr.Jobs job 
        on(emp.Job_id = job.Job_id) 
        Join Hr.job_history jbh 
        on(emp.job_id = jbh.job_id) 
        where to_char(jbh.End_date,'mm') -to_char(jbh.Start_date,'mm') < 6  
        
48.	Display third highest salary of all employees.

        SELECT salary from hr.Employees e1  
        where 3-1 =(SELECT COUNT(DISTINCT salary)from hr.Employees e2 where e2.salary > e1.salary) 
        
49.	Display the city of employee whose employee ID is 105.

        Select emp.EMPLOYEE_ID,loc.CITY From Hr.employees emp 
        Join Hr.Departments dep 
        on(emp.DEPARTMENT_ID = dep.DEPARTMENT_ID) 
        join Hr.Locations loc  
        on(dep.LOCATION_ID = loc.LOCATION_ID) 
        where Employee_id =105
        
50.	Display the details of employees drawing the highest salary in the department.

        Select * From Hr.Employees e 
        inner join (Select Department_id, max(salary) as salary From Hr.Employees group by Department_id ) t 
        on e.Department_id=t.Department_id and e.salary=t.salary
        
51.	Display details of current job for employees who worked as IT Programmers in the past.

        Select * From Hr.Employees emp inner join (Select jbh.JOB_ID,jbh.EMPLOYEE_ID From Hr.Job_history jbh  
        where jbh.Job_id ='IT_PROG') t  
        on(emp.EMPLOYEE_ID=t.EMPLOYEE_ID) 
        
52.	Display the details of departments in which the max salary is greater than 10000 for employees who did a job in the past.

        Select * From Hr.Departments dept 
        Natural join (Select emp.Department_id ,max(emp.Salary) from Hr.employees emp 
        Group by Department_id) t  
        Natural Join Hr.job_History jbh 
        
53.	Display the departments into which no employee joined in last two years.
54.	Display employee name, job title, start date, and end date of past jobs of all employees with commission percentage null.
55.	Display details of manager who manages more than 5 employees.
56.	Display country name, city, and number of departments where department has more than 5 employees.
57.	Display job title and average salary for employees who did a job in the past.
58.	Display employees who did not do any job in the past.
59.	Display the month in which more than 5 employees joined in any department located in Sydney.
60.	Display details of departments in which the maximum salary is more than 10000.
61.	Display details of departments managed by ‘Smith’.
62.	Display jobs into which employees joined in the current year.
