SET search_path TO public;


SELECT OfferNo, Offering.CourseNo, OffDays, CrsUnits, OffLocation, OffTime
FROM Faculty, Course, Offering
WHERE Faculty.FacNo = Offering.FacNo
	AND Offering.CourseNo = Course.CourseNo
	AND OffYear='2016' AND OffTerm='FALL'
	AND FacFirstName = 'LEONARD'
	AND FacLastName = 'VINCE';
	
	/* The Faculty table is required in the FROM clause even though no columns from the Faculty table 
	appear in the result. The Faculty table is needed because the WHERE clause contains conditions to test 
	against the rows of the Faculty table.*/
	
	/* The query below does the same using an Inner Join */
	
SELECT OfferNo, Offering.CourseNo, OffDays, CrsUnits, OffLocation, OffTime
FROM Offering 
INNER JOIN Course ON Offering.CourseNo = Course.CourseNo
INNER JOIN Faculty ON Offering.FacNo = Faculty.FacNo
WHERE OffYear='2016' AND OffTerm='FALL'
	AND FacFirstName = 'LEONARD'
	AND FacLastName = 'VINCE';