-- QUERY 1: Number of lessons per month during a specified time, ordered in descending order
CREATE VIEW lessons_per_month AS
SELECT
    TO_CHAR(ls.start_time, 'Mon') AS Month,
    COUNT(*) AS Total,
    COUNT(CASE WHEN lc.lesson_type = 'individual' THEN 1 END) AS Individual,
    COUNT(CASE WHEN lc.lesson_type = 'group' THEN 1 END) AS Group,
    COUNT(CASE WHEN lc.lesson_type = 'ensemble' THEN 1 END) AS Ensemble
FROM
    lesson_schedule AS ls
JOIN
    lesson_combination AS lc ON ls.lesson_combination_id = lc.id
WHERE
    EXTRACT(YEAR FROM ls.start_time) = 2023
GROUP BY
    Month,
    EXTRACT(MONTH FROM ls.start_time)
ORDER BY
    EXTRACT(MONTH FROM ls.start_time) ASC;


-- QUERY 2: Number of students with no sibling, one sibling, and with two siblings, etc.
CREATE VIEW number_of_siblings AS
SELECT
  CASE WHEN sibling_count IS NULL THEN 0 ELSE sibling_count END AS "No of Siblings",
  COUNT(*) AS "No of Students"
FROM (
  SELECT
    s.id AS student_id,
    COUNT(sibling.id) AS sibling_count
  FROM
    student AS s
    LEFT JOIN student AS sibling ON s.sibling_id = sibling.sibling_id AND s.id != sibling.id
  GROUP BY
    s.id
  HAVING
    COUNT(sibling.id) <= 2
)
GROUP BY
  sibling_count
ORDER BY
  "No of Siblings";


-- QUERY 3: Ids and names of all instructors who has given more than a specific number (0) of lessons during the current month
CREATE VIEW instructor_monthly_lesson AS
 SELECT
  ins.id AS "Instructor Id",
  per.first_name AS "First Name",
  per.last_name AS "Last Name",
  COUNT(*) AS "No of Lessons"
FROM
  instructor AS ins
JOIN
  person AS per ON ins.person_id = per.id
JOIN
  lesson_schedule AS ls ON ins.id = ls.instructor_id
WHERE
  EXTRACT(MONTH FROM ls.start_time) = 12
GROUP BY
  ins.id, per.first_name, per.last_name
HAVING
  COUNT(*) > 0 -- More than 0 lessons
ORDER BY
  COUNT(*) DESC;


 -- QUERY 4: All ensembles held during a specific week
CREATE VIEW ENSEMBLES_NEXT_WEEK AS

SELECT 
	TO_CHAR(start_time, 'Dy') AS day,
	lg.genre_type AS "Genre",
	CASE
		WHEN COUNT(b.student_id) >= sc.max_student THEN 'No Seats'
		WHEN (sc.max_student - COUNT(b.student_id)) = 1 THEN '1 Seat'
        WHEN (sc.max_student - COUNT(b.student_id)) = 2 THEN '2 Seats'
		ELSE 'Many Seats'
	END AS "No of Free Seats"

FROM 
	lesson_schedule AS ls
--All Joined tables
JOIN 
	lesson_combination AS lc ON ls.lesson_combination_id = lc.id 
JOIN 
	student_capacity AS sc ON lc.id = sc.lesson_combination_id
JOIN 
	lesson_genre AS lg ON lc.id = lg.lesson_combination_id

LEFT JOIN
	booking AS b ON ls.id = b.lesson_schedule_id	
-- The week we are searching
WHERE
    EXTRACT(WEEK FROM start_time) = 49 
GROUP BY 
	ls.id, day, "Genre", sc.min_student, sc.max_student;
