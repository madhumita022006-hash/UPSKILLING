CREATE DATABASE EM;
USE EM;


-- 1. USERS TABLE


CREATE TABLE users (
    user_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    registration_date DATE
);


-- 2. EVENTS TABLE


CREATE TABLE events (
    event_id INT PRIMARY KEY,
    title VARCHAR(150),
    description TEXT,
    city VARCHAR(50),
    status VARCHAR(20),
    start_date DATETIME,
    end_date DATETIME,
    organizer_id INT,

    FOREIGN KEY (organizer_id)
    REFERENCES users(user_id)
);


-- 3. SESSIONS TABLE


CREATE TABLE sessions (
    session_id INT PRIMARY KEY,
    event_id INT,
    title VARCHAR(150),
    speaker_name VARCHAR(100),
    start_time DATETIME,
    end_time DATETIME,

    FOREIGN KEY (event_id)
    REFERENCES events(event_id)
);


-- 4. REGISTRATIONS TABLE


CREATE TABLE registrations (
    registration_id INT PRIMARY KEY,
    user_id INT,
    event_id INT,
    registration_date DATE,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id),

    FOREIGN KEY (event_id)
    REFERENCES events(event_id)
);


-- 5. FEEDBACK TABLE


CREATE TABLE feedback (
    feedback_id INT PRIMARY KEY,
    user_id INT,
    event_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    feedback_date DATE,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id),

    FOREIGN KEY (event_id)
    REFERENCES events(event_id)
);


-- 6. RESOURCES TABLE


CREATE TABLE resources (
    resource_id INT PRIMARY KEY,
    event_id INT,
    resource_type VARCHAR(20),
    resource_url TEXT,
    uploaded_at DATETIME,

    FOREIGN KEY (event_id)
    REFERENCES events(event_id)
);


-- INSERT USERS


INSERT INTO users VALUES
(1,'Alice Johnson','alice@example.com','New York','2025-05-20'),
(2,'Bob Smith','bob@example.com','Los Angeles','2025-05-22'),
(3,'Charlie Lee','charlie@example.com','Chicago','2025-05-25'),
(4,'Diana King','diana@example.com','New York','2025-05-27'),
(5,'Ethan Hunt','ethan@example.com','Los Angeles','2025-05-28'),
(6,'Sophia Turner','sophia@example.com','Chicago','2025-05-30'),
(7,'Ryan Clark','ryan@example.com','Boston','2025-06-01');


-- INSERT EVENTS


INSERT INTO events VALUES
(1,
'Tech Innovators Meetup',
'A meetup for tech enthusiasts',
'New York',
'upcoming',
'2025-06-10 10:00:00',
'2025-06-10 16:00:00',
1),

(2,
'AI & ML Conference',
'Conference on AI and ML advancements',
'Chicago',
'completed',
'2025-05-15 09:00:00',
'2025-05-15 17:00:00',
2),

(3,
'Frontend Development Bootcamp',
'Hands-on training on frontend technologies',
'Los Angeles',
'upcoming',
'2025-07-01 10:00:00',
'2025-07-03 16:00:00',
3),

(4,
'Cloud Computing Summit',
'Cloud technologies conference',
'Boston',
'cancelled',
'2025-08-10 09:00:00',
'2025-08-10 17:00:00',
1),

(5,
'Cyber Security Workshop',
'Security awareness workshop',
'Chicago',
'upcoming',
'2025-09-12 10:00:00',
'2025-09-12 15:00:00',
2),

(6,
'Data Science Expo',
'Data science and analytics event',
'Seattle',
'upcoming',
'2025-10-05 09:00:00',
'2025-10-05 18:00:00',
3);

-- =========================
-- INSERT SESSIONS
-- =========================

INSERT INTO sessions VALUES
(1,
1,
'Opening Keynote',
'Dr. Tech',
'2025-06-10 10:00:00',
'2025-06-10 11:00:00'),

(2,
1,
'Future of Web Development',
'Alice Johnson',
'2025-06-10 11:15:00',
'2025-06-10 12:30:00'),

(3,
2,
'AI in Healthcare',
'Charlie Lee',
'2025-05-15 09:30:00',
'2025-05-15 11:00:00'),

(4,
3,
'Intro to HTML5',
'Bob Smith',
'2025-07-01 10:00:00',
'2025-07-01 12:00:00'),

(5,
3,
'Advanced CSS',
'Bob Smith',
'2025-07-01 11:00:00',
'2025-07-01 13:00:00'),

(6,
5,
'Ethical Hacking',
'Dr. Cyber',
'2025-09-12 10:00:00',
'2025-09-12 11:30:00');

-- =========================
-- INSERT REGISTRATIONS
-- =========================

INSERT INTO registrations VALUES
(1,1,1,'2025-05-01'),
(2,2,1,'2025-05-02'),
(3,3,2,'2025-04-30'),
(4,4,2,'2025-04-28'),
(5,5,3,'2025-06-15'),
(6,1,2,'2025-04-15'),
(7,2,3,'2025-06-10'),
(8,6,5,'2025-05-21'),
(9,6,5,'2025-05-22');

-- =========================
-- INSERT FEEDBACK
-- =========================

INSERT INTO feedback VALUES
(1,3,2,4,'Great insights!','2025-05-16'),
(2,4,2,5,'Very informative.','2025-05-16'),
(3,2,1,2,'Could be better.','2025-06-11'),
(4,1,2,1,'Poor organization.','2025-05-17'),
(5,5,3,5,'Excellent workshop.','2025-07-04');

-- =========================
-- INSERT RESOURCES
-- =========================

INSERT INTO resources VALUES
(1,
1,
'pdf',
'https://portal.com/resources/tech_meetup_agenda.pdf',
'2025-05-01 10:00:00'),

(2,
2,
'image',
'https://portal.com/resources/ai_poster.jpg',
'2025-04-20 09:00:00'),

(3,
3,
'link',
'https://portal.com/resources/html5_docs',
'2025-06-25 15:00:00'),

(4,
5,
'pdf',
'https://portal.com/resources/security_guide.pdf',
'2025-08-20 12:00:00');


-- Q1 USER UPCOMING EVENTS


SELECT u.user_id,u.full_name,e.event_id,e.title,e.city,e.start_date
FROM users u
JOIN registrations r
ON u.user_id = r.user_id
JOIN events e
ON r.event_id = e.event_id
WHERE e.status = 'upcoming'
AND u.city = e.city
ORDER BY e.start_date;

-- Q2 TOP RATED EVENTS


SELECT e.event_id,e.title,
AVG(f.rating) AS avg_rating,
COUNT(f.feedback_id) AS total_feedbacks
FROM events e
JOIN feedback f
ON e.event_id = f.event_id
GROUP BY e.event_id, e.title
HAVING COUNT(f.feedback_id) >= 1
ORDER BY avg_rating DESC;


-- Q3 INACTIVE USERS


SELECT u.user_id,u.full_name
FROM users u
WHERE u.user_id NOT IN (
    SELECT DISTINCT r.user_id
    FROM registrations r
    WHERE r.registration_date >= CURDATE() - INTERVAL 90 DAY
);


-- Q4 PEAK SESSION HOURS


SELECT e.event_id,e.title,
COUNT(s.session_id) AS sessions_between_10_12
FROM events e
JOIN sessions s
ON e.event_id = s.event_id
WHERE TIME(s.start_time)
BETWEEN '10:00:00' AND '12:00:00'
GROUP BY e.event_id, e.title;


-- Q5 MOST ACTIVE CITIES


SELECT u.city,
COUNT(DISTINCT r.user_id) AS total_users
FROM users u
JOIN registrations r
ON u.user_id = r.user_id
GROUP BY u.city
ORDER BY total_users DESC
LIMIT 5;


-- Q6 EVENT RESOURCE SUMMARY


SELECT e.event_id,e.title,
SUM(CASE WHEN r.resource_type='pdf' THEN 1 ELSE 0 END) AS pdf_count,
SUM(CASE WHEN r.resource_type='image' THEN 1 ELSE 0 END) AS image_count,
SUM(CASE WHEN r.resource_type='link' THEN 1 ELSE 0 END) AS link_count
FROM events e
LEFT JOIN resources r
ON e.event_id = r.event_id
GROUP BY e.event_id, e.title;


-- Q7 LOW FEEDBACK ALERTS


SELECT u.user_id,u.full_name,e.title AS event_name,f.rating,f.comments
FROM feedback f
JOIN users u
ON f.user_id = u.user_id
JOIN events e
ON f.event_id = e.event_id
WHERE f.rating < 3;


-- Q8 SESSIONS PER UPCOMING EVENT


SELECT e.event_id,e.title,
COUNT(s.session_id) AS total_sessions
FROM events e
LEFT JOIN sessions s
ON e.event_id = s.event_id
WHERE e.status = 'upcoming'
GROUP BY e.event_id, e.title;


-- Q9 ORGANIZER EVENT SUMMARY


SELECT u.user_id,u.full_name AS organizer_name,e.status,
COUNT(e.event_id) AS total_events
FROM users u
JOIN events e
ON u.user_id = e.organizer_id
GROUP BY u.user_id, u.full_name, e.status
ORDER BY u.full_name;


-- Q10 FEEDBACK GAP


SELECT DISTINCTe.event_id,e.title
FROM events e
JOIN registrations r
ON e.event_id = r.event_id
LEFT JOIN feedback f
ON e.event_id = f.event_id
WHERE f.feedback_id IS NULL;


-- Q11 DAILY NEW USER COUNT


SELECT registration_date,COUNT(user_id) AS new_users
FROM users
WHERE registration_date >= CURDATE() - INTERVAL 7 DAY
GROUP BY registration_date
ORDER BY registration_date;


-- Q12 EVENT WITH MAXIMUM SESSIONS


SELECT e.event_id,e.title,
COUNT(s.session_id) AS total_sessions
FROM events e
JOIN sessions s
ON e.event_id = s.event_id
GROUP BY e.event_id, e.title
HAVING COUNT(s.session_id) = (
    SELECT MAX(session_count)
    FROM (
        SELECT COUNT(*) AS session_count
        FROM sessions
        GROUP BY event_id
    ) AS temp
);


-- Q13 AVERAGE RATING PER CITY


SELECT e.city,
AVG(f.rating) AS average_rating
FROM events e
JOIN feedback f
ON e.event_id = f.event_id
GROUP BY e.city;


-- Q14 MOST REGISTERED EVENTS


SELECT e.event_id,e.title,
COUNT(r.registration_id) AS total_registrations
FROM events e
JOIN registrations r
ON e.event_id = r.event_id
GROUP BY e.event_id, e.title
ORDER BY total_registrations DESC
LIMIT 3;


-- Q15 EVENT SESSION TIME CONFLICT


SELECT s1.event_id,s1.title AS session_1,s2.title AS session_2,s1.start_time,s1.end_time,s2.start_time,s2.end_time
FROM sessions s1
JOIN sessions s2
ON s1.event_id = s2.event_id
AND s1.session_id < s2.session_id
AND s1.start_time < s2.end_time
AND s1.end_time > s2.start_time;


-- Q16 UNREGISTERED ACTIVE USERS


SELECT u.user_id,u.full_name,u.registration_date
FROM users u
LEFT JOIN registrations r
ON u.user_id = r.user_id
WHERE u.registration_date >= CURDATE() - INTERVAL 30 DAY
AND r.registration_id IS NULL;


-- Q17 MULTI SESSION SPEAKERS


SELECT speaker_name,COUNT(session_id) AS total_sessions
FROM sessions
GROUP BY speaker_name
HAVING COUNT(session_id) > 1;


-- Q18 RESOURCE AVAILABILITY CHECK


SELECT e.event_id,e.title
FROM events e
LEFT JOIN resources r
ON e.event_id = r.event_id
WHERE r.resource_id IS NULL;


-- Q19 COMPLETED EVENTS WITH FEEDBACK SUMMARY


SELECT e.event_id,e.title,
COUNT(DISTINCT r.registration_id) AS total_registrations,
AVG(f.rating) AS average_rating
FROM events e
LEFT JOIN registrations r
ON e.event_id = r.event_id
LEFT JOIN feedback f
ON e.event_id = f.event_id
WHERE e.status = 'completed'
GROUP BY e.event_id, e.title;


-- Q20 USER ENGAGEMENT INDEX


SELECT u.user_id,u.full_name,COUNT(DISTINCT r.event_id) AS events_attended,
COUNT(DISTINCT f.feedback_id) AS feedbacks_submitted
FROM users u
LEFT JOIN registrations r
ON u.user_id = r.user_id
LEFT JOIN feedback f
ON u.user_id = f.user_id
GROUP BY u.user_id, u.full_name;


-- Q21 TOP FEEDBACK PROVIDERS


SELECT u.user_id,u.full_name,
COUNT(f.feedback_id) AS total_feedbacks
FROM users u
JOIN feedback f
ON u.user_id = f.user_id
GROUP BY u.user_id, u.full_name
ORDER BY total_feedbacks DESC
LIMIT 5;


-- Q22 DUPLICATE REGISTRATIONS CHECK


SELECT user_id,event_id,
COUNT(*) AS registration_count
FROM registrations
GROUP BY user_id, event_id
HAVING COUNT(*) > 1;


-- Q23 REGISTRATION TRENDS


SELECT 
DATE_FORMAT(registration_date,'%Y-%m') AS month,
COUNT(registration_id) AS total_registrations
FROM registrations
WHERE registration_date >= CURDATE() - INTERVAL 12 MONTH
GROUP BY month
ORDER BY month;


-- Q24 AVERAGE SESSION DURATION PER EVENT


SELECT e.event_id,e.title,
AVG(
	TIMESTAMPDIFF(
            MINUTE,
            s.start_time,
            s.end_time
        )
    ) AS avg_session_duration_minutes
FROM events e
JOIN sessions s
ON e.event_id = s.event_id
GROUP BY e.event_id, e.title;


-- Q25 EVENTS WITHOUT SESSIONS


SELECT e.event_id,e.title,e.city,e.status
FROM events e
LEFT JOIN sessions s
ON e.event_id = s.event_id
WHERE s.session_id IS NULL;




