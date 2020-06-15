const client = require('./client/clientdb');

const express = require('express');
const cors = require('cors')

const app = express();

app.use(cors())
app.get('/login', (req, res, next) => {
    res.json({usuario: 'juan'})
});

app.get('/categorias', (req, res, next) => {
    client.query('SELECT * FROM categorias ORDER BY nombre', (err, result) => {
        if(err) {
            console.error(err);
            res.status(500).send(err);
        }
        res.status(200).json(result.rows);
    });
});

app.get('/productos', (req, res, next) => {
    client.query('SELECT * FROM productos ORDER BY nombreproducto', (err, result) => {
        if(err) {
            console.error(err);
            res.status(500).send(err);
        }
        res.status(200).json(result.rows);
    });
});





app.listen('8010', () => {
    console.log('Listening on port 8010')
})