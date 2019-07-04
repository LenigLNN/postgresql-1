create table users(
userid INT NOT NULL PRIMARY KEY,
name CHAR(100) NOT NULL);

create table movies(
movieid INT NOT NULL PRIMARY KEY,
title CHAR(100) NOT NULL);

create table taginfo(
tagid INT NOT NULL PRIMARY KEY,
content CHAR(100) NOT NULL);

create table genres(
genreid INT NOT NULL PRIMARY KEY,
name CHAR(100));

create table ratings(
rating INT NOT NULL CHECK (rating>=1 AND rating<=5),
timestamp BIGINT,
userid INT REFERENCES users(userid),
movieid INT REFERENCES movies(movieid));

create table tags(
timestamp BIGINT,
userid INT REFERENCES users(userid),
movieid INT REFERENCES movies(movieid),
tagid INT REFERENCES taginfo(tagid));

create table hasagenre(
movieid INT REFERENCES movies(movieid),
genreid INT REFERENCES genres(genreid));
