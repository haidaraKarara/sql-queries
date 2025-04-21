-- Business problem: Pulling employee and manager data for the Sales department
-- Check the sales data model in the images folder
SELECT
    e.employeeid,
    e.name AS employee_name,
    manager.name AS manager_name,
    COALESCE(manager.email,e.email) AS contact_email
FROM employees e
left JOIN employees manager
ON manager.employeeid = e.managerid
WHERE e.department = 'Sales'