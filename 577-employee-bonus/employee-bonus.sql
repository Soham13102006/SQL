/* Write your T-SQL query statement below */
SELECT 
e.name,
b.bonus
FROM Employee as e
LEFT JOIN BONUS as b
ON e.empId = b.empId
WHERE b.bonus IS NULL OR b.bonus<1000