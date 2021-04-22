const express = require('express');
const bodyParser = require('body-parser');
const pg = require('pg');
const { response } = require('express');

const app = express();
const PORT = 5000;

app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(express.static('server/public'));

app.listen(PORT, () => {
    console.log('listening on port', PORT)
});


// Setting up 'pool' and connecting with database

const Pool = pg.Pool;
const pool = new Pool({
    database: 'jazzy_sql',
    host: 'localhost',
    port: '5432',
    max: '10',
    idleTimeoutMillis: 30000
});

// handle connection events
pool.on('connect', () => {
    console.log('Postgresql, yeah baby!');
});

// handle errors from the DB
pool.on('error', error => {
    console.log('Error with postgres pool!', error);
});

// TODO - Replace static content with a database tables
// const artistList = [ 
//     {
//         name: 'Ella Fitzgerald',
//         birthdate: '04-25-1917'
//     },
//     {
//         name: 'Dave Brubeck',
//         birthdate: '12-06-1920'
//     },       
//     {
//         name: 'Miles Davis',
//         birthdate: '05-26-1926'
//     },
//     {
//         name: 'Esperanza Spalding',
//         birthdate: '10-18-1984'
//     },
// ]
// const songList = [
//     {
//         title: 'Take Five',
//         length: '5:24',
//         released: '1959-09-29'
//     },
//     {
//         title: 'So What',
//         length: '9:22',
//         released: '1959-08-17'
//     },
//     {
//         title: 'Black Gold',
//         length: '5:17',
//         released: '2012-02-01'
//     }
// ];

app.get('/artist', (req, res) => {
    let queryText = 'SELECT * FROM artist;';
    pool.query(queryText)
        .then(dbResults => {
            res.send(dbResults.rows);
        })
        .catch((error) => {
            console.log(`Error! It broke trying to query ${queryText}`, error);
            res.sendStatus(500);
        });

});

app.post('/artist', (req, res) => {
    let artistList = [];
    artistList.push(req.body);
    let queryText = `INSERT INTO "artist"("artist_name","year_born") VALUES(${artistList.name}, ${artistList.birthdate});`
    pool.query(queryText)
        .then(response => {
        console.log('new peep is this peep', response);
        res.sendStatus(201);
    })
        .catch((error) => {
            console.log(`Error! It broke trying to query ${queryText}`, error);
            res.sendStatus(500);
        });
});

app.get('/song', (req, res) => {
    let queryText = 'SELECT * FROM "song";';
    pool.query(queryText)
        .then(dbResults => {
            res.send(dbResults.rows);
        })
        .catch((error) => {
            console.log(`Error! It broke trying to query ${queryText}`, error);
            res.sendStatus(500);
        });
});

app.post('/song', (req, res) => {
    songList.push(req.body);
    res.sendStatus(201);
});