SELECT DISTINCT TD.user_name
FROM CourseTestDesigners CTD
         JOIN TestDesigner TD on CTD.testDesigner_ID = TD.ID;