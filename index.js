const client = require("./client/clientdb");
const nJwt = require('njwt');
const express = require("express");
const cors = require("cors");
const app = express();
const bodyParser = require("body-parser");
const KEY = 'kenfenkfnkefnkef';
const bearerToken = require('express-bearer-token');

app.use(express.json()); // <==== parse request body as JSON
app.use(cors({credentials: true, origin: 'http://localhost:4200'}))
  app.use(bodyParser.json())
  //.use(cookieParser())
  app.use(bearerToken());

app.get("/login", (req, res, next) => {
  res.json({ usuario: "juan" });
});

app.get("/categorias", (req, res, next) => {
  client.query("SELECT * FROM categorias ORDER BY nombre", (err, result) => {
    if (err) {
      console.error(err);
      res.status(500).send(err);
    }
    res.status(200).json(result.rows);
  });
});

app.get("/categorias/:id", (req, res, net) => {
  client.query(
    `select * from categorias where id = ${req.params.id}`,
    (err, result) => {
      if (err) {
        console.error(err);
        res.status(500).send(err);
      }
      res.status(200).json(result.rows);
    }
  );
});

app.get("/categorias/productos/:id", (req, res, next) => {
  client.query(
    "SELECT p.codigo,p.image, p.nombreproducto, p.descripcion, p.precio FROM categorias c INNER JOIN productos p ON  c.id = p.idproductocategoria WHERE c.id = $1 ORDER BY nombreproducto",
    [req.params.id],
    (err, result) => {
      if (err) {
        console.error(err);
        res.status(500).send(err);
      }
      res.status(200).json(result.rows);
    }
  );
});

app.get("/productos", (req, res, net) => {
  client.query(
    "SELECT p.codigo,p.image, p.nombreproducto, p.descripcion, p.precio FROM productos p ORDER BY codigo",
    (err, result) => {
      if (err) {
        console.error(err);
        res.status(500).send(err);
      }
      res.status(200).json(result.rows);
    }
  );
});

app.get("/productos/:id", (req, res, net) => {
  client.query(
    `select * from productos where codigo = ${req.params.id}`,
    (err, result) => {
      if (err) {
        console.error(err);
        res.status(500).send(err);
      }
      res.status(200).json(result.rows);
    }
  );
});

app.get('/comprar/:codigo', (req, res, next) => {
    client.query(`SELECT image, nombreproducto, descripcion, precio  FROM productos WHERE codigo = ${req.params.codigo}`, (err, result) => {
        if(err) {
            console.error(err);
            res.status(500).send(err);
        }
        res.status(200).json(result.rows[0]);
    });
});


app.post("/productos", (req, res, next) => {
  client.query(
    `INSERT INTO productos (nombreproducto, precio, descripcion, idproductocategoria, image) VALUES ('${req.body.nombreproducto}', '${req.body.precio}', '${req.body.descripcion}', '${req.body.idproductocategoria}', '${req.body.image}')`,
    (err, result) => {
      if (err) {
        console.error(err);
        res.status(500).send(err);
      }
      res.status(200).json(result.rows);
    }
  );
});

app.delete("/productos/:id", (req, res, next) => {
  if (!req.header('Authorization')) {
    return res.status(403).send({ auth: false, message: 'No token provided' });
  }
  let sub = req.header('Authorization').split(' ')
  let token = sub[1];
  nJwt.verify(token, KEY, function(err) {
    if (err) {
      return res.status(403).send({ auth: false, message: err });
    }
    client.query(
      `DELETE FROM productos WHERE codigo = ${req.params.id}`,
      (err, result) => {
        if (err) {
          console.error(err);
          res.status(500).send(err);
        }
        res.status(200).json({result: result.rows, auth: true});
      }
    );
  });
});

app.put("/productos", (req, res, net) => {
  client.query(
    `update productos set nombreproducto = '${req.body.nombreproducto}', precio = '${req.body.precio}', descripcion = '${req.body.descripcion}' , image = '${req.body.image}', idproductocategoria = ${req.body.idproductocategoria} WHERE codigo = ${req.body.codigo}`,
    (err, result) => {
      if (err) {
        console.error(err);
        res.status(500).send(err);
      }
      res.status(200).json(result.rows);
    }
  );
});

app.post("/usuarios", (req, res, next) => {
  client.query(
    `INSERT INTO usuarios (nombre, apellido, correo, contrasena) VALUES ('${req.body.nombre}', '${req.body.apellido}', '${req.body.correo}', '${req.body.contrasena}')`,
    (err, result) => {
      if (err) {
        console.error(err);
        res.status(500).send(err);
      }
      res.status(200).json(result.rows);
    }
  );
});


app.post('/login', (req, res, next) => {
  client.query(`SELECT u.nombre, u.apellido, u.correo, u.contrasena FROM usuarios u WHERE u.correo = '${req.body.correo}' AND u.contrasena = '${req.body.contrasena}'`, (err, result) => {
      if(err) {
          console.error(err);
          res.status(500).send(err);
      }
      let jwt = nJwt.create({}, KEY);
      jwt.setExpiration(new Date().getTime() + (2 * 60 * 1000));
      jwt.setNotBefore(0);
      res.status(200).json({result : result.rows[0], token: jwt.compact()})
  });
});

app.listen("8010", () => {
  console.log("Listening on port 8010");
});
