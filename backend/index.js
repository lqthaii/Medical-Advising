const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const port = 3000;
const db = require('./queries')

app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);
app.post('/login', db.login)
app.post('/register', db.register);
app.get('/users', db.getUsers)

app.listen(port, () => {
  console.log(`App running on port ${port}.`);
});
