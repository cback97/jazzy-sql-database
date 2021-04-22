DROP TABLE "artist";

CREATE TABLE "artist" (
    "id" SERIAL PRIMARY KEY,
    "artist_name" varchar(80) not null,
    "year_born" DATE 
    );


INSERT INTO "artist"("id","artist_name","year_born") VALUES(1,'Ella Fitzgerald','4/25/1917') RETURNING "id","artist_name","year_born";
INSERT INTO "artist"("id","artist_name","year_born") VALUES(2,'Dave Brubeck','12/6/1920') RETURNING "id","artist_name","year_born";
INSERT INTO "artist"("id","artist_name","year_born") VALUES(3,'Miles Davis','05/26/1926') RETURNING "id","artist_name","year_born";
INSERT INTO "artist"("id","artist_name","year_born") VALUES(4,'Esperanza Spalding','10/18/1984') RETURNING "id","artist_name","year_born";
INSERT INTO "artist"("id","artist_name","year_born") VALUES(5,'Logic','1/22/1990') RETURNING "id","artist_name","year_born";

SELECT * FROM "artist";

DROP TABLE "song";


CREATE TABLE "song" (
    "id" SERIAL PRIMARY KEY,
    "track" varchar(120) not null,
    "time" TIME,
    "published" date
    );
    

INSERT INTO "song"("id","track","time","published") VALUES(1,'Take Five','5:24','4/25/1917') RETURNING "id", "track", "time", "published";
INSERT INTO "song"("id","track","time","published") VALUES(2,'So What','9:22','12/6/1920') RETURNING "id", "track", "time", "published";
INSERT INTO "song"("id","track","time","published") VALUES(3,'Black Gold','5:17','05/26/1926') RETURNING "id", "track", "time", "published";

SELECT * FROM "song";

