SELECT TTD.test_ID, TD.creator_ID
FROM TestTestDesigners TTD
         RIGHT JOIN TestDesigner TD on TTD.test_designer_ID = TD.ID;