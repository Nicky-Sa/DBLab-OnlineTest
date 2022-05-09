# All courses in which their customer package_ID is less than 30.
SELECT *
FROM Course
WHERE EXISTS(
              SELECT * FROM Customer WHERE Course.creator_ID = Customer.ID AND Customer.current_package_ID < 30
          );
