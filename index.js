const client = require('./client/clientdb');

const express = require('express');
const cors = require('cors')
const app = express();
const bodyParser = require('body-parser');

app.use(express.json())    // <==== parse request body as JSON
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

app.get('/categorias/:id', (req, res, net) => {
    client.query(`select * from categorias where id = ${req.params.id}`, (err, result) => {
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

app.get('/productos', (req, res, net) => {
    client.query('SELECT p.codigo,p.image, p.nombreproducto, p.descripcion, p.precio FROM productos p ORDER BY codigo', (err, result) => {
        if(err) {
            console.error(err);
            res.status(500).send(err);
        }
        res.status(200).json(result.rows);
    });
});

app.get('/productos/:id', (req, res, net) => {
    client.query(`select * from productos where codigo = ${req.params.id}`, (err, result) => {
        if(err) {
            console.error(err);
            res.status(500).send(err);
        }
        res.status(200).json(result.rows);
    });
});

app.post('/productos', (req, res, next) => {
    client.query(`INSERT INTO productos (nombreproducto, precio, descripcion, idproductocategoria, image) VALUES ('${req.body.nombreproducto}', '${req.body.precio}', '${req.body.descripcion}', '${req.body.idproductocategoria}', '${req.body.image}')`, (err, result) => {
        if(err) {
            console.error(err);
            res,status(500).send(err);
        }
        res.status(200).json(result.rows);
    });
});

app.post('/categorias', (req, res, next) => {
    client.query(`INSERT INTO categorias (nombre, descripcion, image) VALUES ('${req.body.nombre}', '${req.body.descripcion}', '${req.body.image}')`, (err, result) => {
        if(err) {
            console.error(err);
            res,status(500).send(err);
        }
        res.status(200).json(result.rows);
    });
});

app.delete('/productos/:id', (req, res, net) => {
    client.query(`DELETE FROM productos WHERE codigo = ${req.params.id}`, (err, result) => {
        if(err) {
            console.error(err);
            res.status(500).send(err);
        }
        res.status(200).json(result.rows);
    });
});

app.delete('/categorias/:id', (req, res, net) => {
    client.query(`DELETE FROM categorias WHERE id = ${req.params.id}`, (err, result) => {
        if(err) {
            console.error(err);
            res.status(500).send(err);
        }
        res.status(200).json(result.rows);
    });
});

app.put('/productos', (req, res, net) => {
    client.query(`update productos set nombreproducto = '${req.body.nombreproducto}', precio = '${req.body.precio}', descripcion = '${req.body.descripcion}' , image = '${req.body.image}', idproductocategoria = ${req.body.idproductocategoria} WHERE codigo = ${req.body.codigo}`, (err, result) => {
        if(err) {
            console.error(err);
            res.status(500).send(err);
        }
        res.status(200).json(result.rows);
    });
});

app.put('/categorias', (req, res, net) => {
    client.query(`update categorias set nombre = '${req.body.nombre}', image = '${req.body.image}', descripcion = '${req.body.descripcion}', id = ${req.body.id}, WHERE id = ${req.body.id}`, (err, result) => {
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