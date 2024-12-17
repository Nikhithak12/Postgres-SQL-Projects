CREATE TABLE adverts (
    adId INT,
    view_s INT,
    clicks INT,
    costs DECIMAL(10, 2)
);
INSERT INTO adverts (adId, view_s, clicks, costs)
VALUES
    (1, 1000, 50, 20.5),
    (2, 800, 30, 15.2),
    (3, 1200, 80, 25.7),
    (4, 600, 20, 10.9),
    (5, 1500, 120, 40.3);
SELECT * FROM adverts;
SELECT 
    adId, 
    ROUND((clicks * 100.0 / view_s), 1) AS CTR,
    view_s,
    clicks,
    costs
FROM 
    adverts
ORDER BY 
    CTR DESC;


