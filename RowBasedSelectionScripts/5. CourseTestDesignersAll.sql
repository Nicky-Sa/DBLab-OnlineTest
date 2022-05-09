# All testDesigners with at least 1 test.
SELECT *
FROM CourseTestDesigners
WHERE testDesigner_ID = ALL (SELECT testDesigner_ID
                             FROM TestTestDesigners);