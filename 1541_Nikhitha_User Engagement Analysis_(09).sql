CREATE TABLE Posts (
    post_id INT PRIMARY KEY,
    post_content VARCHAR(255),
    post_date DATE
);
INSERT INTO Posts (post_id, post_content, post_date)
VALUES
(1, 'Lorem ipsum dolor sit amet', '2023-08-25'),
(2, 'Exploring the beauty of nature', '2023-08-26'),
(3, 'Unveiling the latest tech trends', '2023-08-27'),
(4, 'Journey into the world of literature', '2023-08-28'),
(5, 'Capturing the essence of city life', '2023-08-29');
CREATE TABLE UserReactions (
    reaction_id INT PRIMARY KEY,
    user_id INT,
    post_id INT,
    reaction_type VARCHAR(50),
    reaction_date DATE,
    FOREIGN KEY (post_id) REFERENCES Posts(post_id)
);
INSERT INTO UserReactions (reaction_id, user_id, post_id, reaction_type, reaction_date)
VALUES
(1, 101, 1, 'like', '2023-08-25'),
(2, 102, 1, 'comment', '2023-08-25'),
(3, 103, 1, 'share', '2023-08-26'),
(4, 101, 2, 'like', '2023-08-26'),
(5, 102, 2, 'comment', '2023-08-27'),
(6, 104, 2, 'like', '2023-08-27'),
(7, 105, 3, 'comment', '2023-08-27'),
(8, 101, 3, 'like', '2023-08-28'),
(9, 103, 4, 'like', '2023-08-28'),
(10, 105, 4, 'share', '2023-08-29'),
(11, 104, 5, 'like', '2023-08-29'),
(12, 101, 5, 'comment', '2023-08-30');

--Post Reaction Summary Query
SELECT
    p.post_id,
    p.post_content,
    SUM(CASE WHEN ur.reaction_type = 'like' THEN 1 ELSE 0 END) AS num_likes,
    SUM(CASE WHEN ur.reaction_type = 'comment' THEN 1 ELSE 0 END) AS num_comments,
    SUM(CASE WHEN ur.reaction_type = 'share' THEN 1 ELSE 0 END) AS num_shares
FROM
    Posts p
LEFT JOIN
    UserReactions ur ON p.post_id = ur.post_id
WHERE
    p.post_id = 2
GROUP BY
    p.post_id, p.post_content;
 
 --Daily User Engagement Query
 SELECT
    ur.reaction_date AS reaction_day,
    COUNT(DISTINCT ur.user_id) AS distinct_users,
    COUNT(*) AS total_reactions,
    ROUND(COUNT(*) * 1.0 / COUNT(DISTINCT ur.user_id), 4) AS avg_reactions_per_user
FROM
    UserReactions ur
GROUP BY
    ur.reaction_date
ORDER BY
    ur.reaction_date;


--Top 3 Engaging Posts Query
SELECT
    p.post_id,
    p.post_content,
    COUNT(*) AS total_reactions
FROM
    UserReactions ur
JOIN
    Posts p ON ur.post_id = p.post_id
GROUP BY
    p.post_id, p.post_content
ORDER BY
    total_reactions DESC
LIMIT 3;


