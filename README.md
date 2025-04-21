# sql-queries
We must master SQL

SELECT
    e.employeeid,
    e.employee_name AS employee_name,
    manager.employee_name AS manager_name,
    COALESCE(manager.email,e.email) AS contact_email
FROM employees e
RIGHT JOIN employees manager
ON manager.employeeid = manager.managerid
WHERE manager.department = 'Sales' AND e.department = 'Sales


SELECT
    e.employeeid,
    e.employee_name AS employee_name,
    manager.employee_name AS manager_name,