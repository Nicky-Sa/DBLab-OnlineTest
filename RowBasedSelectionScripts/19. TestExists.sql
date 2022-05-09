# Tests that their course_ID has at least 1 designer and the id is less than 40.
SELECT *
FROM Test
WHERE EXISTS(
              SELECT *
              FROM CourseTestDesigners
              WHERE CourseTestDesigners.course_ID = Test.course_ID
                AND CourseTestDesigners.course_ID < 40
          );
