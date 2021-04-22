DROP TABLE "artists";

CREATE TABLE "artists" (
    "id" SERIAL PRIMARY KEY,
    "artist_name" varchar(80) not null,
    "year_born" date
    );


INSERT INTO "artists"("id","artist_name","year_born") VALUES(1,'Ella Fitzgerald','4/25/1917') RETURNING "id","artist_name","year_born";
INSERT INTO "artists"("id","artist_name","year_born") VALUES(2,'Dave Brubeck','12/6/1920') RETURNING "id","artist_name","year_born";
INSERT INTO "artists"("id","artist_name","year_born") VALUES(3,'Miles Davis','05/26/1926') RETURNING "id","artist_name","year_born";
INSERT INTO "artists"("id","artist_name","year_born") VALUES(4,'Esperanza Spalding','10/18/1984') RETURNING "id","artist_name","year_born";


DROP TABLE "songs";


CREATE TABLE "songs" (
    "id" SERIAL PRIMARY KEY,
    "track" varchar(120) not null,
    "time" TIME,
    "published" date
    );
    

INSERT INTO "songs"("id","track","time","published") VALUES(1,'Take Five','5:24','4/25/1917') RETURNING "id", "track", "time", "published";
INSERT INTO "songs"("id","track","time","published") VALUES(2,'So What','9:22','12/6/1920') RETURNING "id", "track", "time", "published";
INSERT INTO "songs"("id","track","time","published") VALUES(3,'Black Gold','5:17','05/26/1926') RETURNING "id", "track", "time", "published";

