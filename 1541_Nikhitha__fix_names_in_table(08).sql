CREATE TABLE NAMES (
    NAME VARCHAR(255)
);
INSERT INTO NAMES (NAME)
VALUES
    ('rAVI kUMAR'),
    ('priya sharma'),
    ('amit PATEL'),
    ('NEHA gupta');
SELECT * FROM NAMES;

--correcting names
UPDATE NAMES
SET NAME = INITCAP(LOWER(NAME));
SELECT * FROM NAMES;








