CREATE TABLE users (
userid INTEGER,
name CHAR(100),
PRIMARY KEY (userid));

CREATE TABLE movies(
movieid INTEGER,
title CHAR(100),
PRIMARY KEY (movieid));

CREATE TABLE taginfo(
tagid INTEGER,
content CHAR(100),
PRIMARY KEY (tagid);

CREATE TABLE genres(
genreid INTEGER,
name CHAR(100),
PRIMARY KEY (genreid));

CREATE TABLE ratings(
userid INTEGER,
movieid INTEGER,
rating REAL,
timestamp BIGINT,
CHECK (rating>=0.5 AND rating<=5),
PRIMARY KEY (userid, movieid),
FOREIGN KEY (userid) REFERENCES users,
FOREIGN KEY (movieid) REFERENCES movies);

CREATE TABLE tags(
userid INTEGER,
movieid INTEGER,
tagid INTEGER,
timestamp BIGINT,
PRIMARY KEY (userid, movieid, tagid),
FOREIGN KEY (tagid) REFERENCES taginfo,
FOREIGN KEY (userid) REFERENCES users,
FOREIGN KEY (movieid) REFERENCES movies);

CREATE TABLE hasagenre(
movieid INTEGER,
genreid INTEGER,
PRIMARY KEY (movieid, genreid),
FOREIGN KEY (movieid) REFERENCES movies,
FOREIGN KEY (genreid) REFERENCES genres);


Failed testcases are
-0.2 insert example data
-0.2 insert non-exist foreign key which references to movieid
-0.2 insert duplicate rating
-0.2 insert non-exist foreign key which references to genreid
-0.2 insert an invalid rating which is larger than 5
