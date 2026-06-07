-- CREATE DATABASE subscription_analytics;

 USE subscription_analytics;

SELECT *
FROM cleaned_subscriptions
LIMIT 5;

ALTER TABLE courses
MODIFY Course_ID BIGINT;

DESC cleaned_subscriptions;

DESC courses;



ALTER TABLE cleaned_subscriptions
MODIFY User_ID VARCHAR(20);

ALTER TABLE cleaned_subscriptions
ADD PRIMARY KEY (User_ID);

ALTER TABLE courses
ADD PRIMARY KEY (Course_ID);

ALTER TABLE cleaned_subscriptions
ADD CONSTRAINT fk_course
FOREIGN KEY (Course_ID)
REFERENCES courses(Course_ID);


