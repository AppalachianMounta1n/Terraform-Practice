const express = require('express'); //Import ExpressJS for API-building
const { Pool } = require('pg'); //Import PostgreSQL client
const app = express(); //Create an ExpressJS app
app.use(express.json()); //Parse JSON request bodies