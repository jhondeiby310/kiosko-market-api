const db = require('../config/dbconfig');
const {Client} = require('pg');

const connectionString = `postgres://${db.username}:${db.password}@${db.host}:${db.port}/${db.dbname}`;

const client = new Client({
    connectionString: connectionString
});

client.connect();

module.exports = client;