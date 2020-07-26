SET search_path TO public;

SELECT FacRank, AVG(FacSalary) AvgSalary
FROM Faculty
GROUP BY FacRank
ORDER BY AvgSalary DESC;

/* The query below will list average GPA by major for upper class students in which the average GPA is greater than 3.1 */

SELECT StdMajor, AVG(StdGPA) AvgGPA
FROM Student
WHERE StdClass IN ('JR', 'SR')
GROUP BY StdMajor
HAVING AVG(StdGPA) > 3.1;
