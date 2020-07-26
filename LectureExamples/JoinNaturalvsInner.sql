SET search_path TO public; 

SELECT * 
FROM student S NATURAL JOIN enrollment E;

SELECT * 
FROM student S INNER JOIN enrollment E ON S.stdno = e.stdno; 