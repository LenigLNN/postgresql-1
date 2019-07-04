drop table if exists users, movies, taginfo, genres, ratings, tags, hasagenre;

CREATE TABLE users (
userid integer NOT NULL,
name text,
PRIMARY KEY (userid));

CREATE TABLE movies(
movieid integer NOT NULL,
title text,
PRIMARY KEY (movieid));

CREATE TABLE taginfo(
tagid integer NOT NULL,
content text,
PRIMARY KEY (tagid));

CREATE TABLE genres(
genreid integer NOT NULL,
name text NOT NULL,
PRIMARY KEY (genreid));

CREATE TABLE ratings(
userid integer NOT NULL,
movieid integer NOT NULL,
rating numeric NOT NULL CHECK (rating>=0 AND rating<=5),
timestamp BIGINT,
PRIMARY KEY (userid, movieid),
FOREIGN KEY (userid) REFERENCES users,
FOREIGN KEY (movieid) REFERENCES movies);

CREATE TABLE tags(
userid integer  NOT NULL,
movieid integer  NOT NULL,
tagid integer  NOT NULL,
timestamp BIGINT,
PRIMARY KEY (userid, movieid, tagid),
FOREIGN KEY (tagid) REFERENCES taginfo,
FOREIGN KEY (userid) REFERENCES users,
FOREIGN KEY (movieid) REFERENCES movies);

CREATE TABLE hasagenre(
movieid integer  NOT NULL,
genreid integer  NOT NULL,
FOREIGN KEY (movieid) REFERENCES movies,
FOREIGN KEY (genreid) REFERENCES genres);


Failed testcases are
-0.2 insert example data
-0.2 insert non-exist foreign key which references to movieid
-0.2 insert duplicate rating
-0.2 insert non-exist foreign key which references to genreid
-0.2 insert an invalid rating which is larger than 5

https://tecadmin.net/install-pgadmin4-on-ubuntu/

https://www.postgresql.org/docs/10/ddl-constraints.html
