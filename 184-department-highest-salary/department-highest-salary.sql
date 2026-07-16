/* Write your T-SQL query statement below */
SELECT 
Department,
Employee,
Salary
FROM (SELECT 
Employee.id,
Employee.name as Employee,
Employee.salary as Salary,
Department.name as Department,
MAX(Employee.salary) OVER(PARTITION BY Department.name) as max
FROM Employee
LEFT JOIN Department
ON Employee.departmentId = Department.id)t
WHERE Salary = t.max
ORDER BY id
