# All testDesigners without a test.
SELECT *
FROM TestDesigner
WHERE ID != ALL (SELECT test_designer_ID
                 FROM TestTestDesigners);
