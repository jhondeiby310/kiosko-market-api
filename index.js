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

app.get('/categorias/productos/:id', (req, res, next) => {
    client.query('SELECT p.codigo,p.image, p.nombreproducto, p.descripcion, p.precio FROM categorias c INNER JOIN productos p ON  c.id = p.idproductocategoria WHERE c.id = $1 ORDER BY nombreproducto', [req.params.id],(err, result) => {
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