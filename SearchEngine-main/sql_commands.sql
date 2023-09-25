CREATE DATABASE search_engine;
SHOW DATABASES;
USE search_engine;


CREATE TABLE pages(
	pageTitle VARCHAR(200),
    pageLink TEXT,
    pageText MEDIUMTEXT
);

SELECT * FROM pages;


CREATE TABLE history(
	keyword TEXT,
    link TEXT
);

SELECT * FROM history;
