const mysql = require('mysql');
const express = require('express');

const port = 8080;

const db = mysql.createConnection({
  host: 'localhost',
  user: 'admin',
  database: 'budgetapp'
});
const app = express();
app.use(express.static('static'));

app.get('/months', (request, response) => {
  db.query('select * from MONTH', (error, results) => {
    if (error) {
      response.status(500);
      response.send("Database error.");
    } else {
      response.json(results);
    }
  });
});

app.get('/item/:id', (request, response) => {
  const id = parseInt(request.params.id);
  
  if (id && id > 0) {
    db.query(`select * from ITEM where id = ${id}`, (error, results) => {
      if (error) {
        response.status(500);
        response.send(error);
      } else if (results.length == 0) {
        response.status(404);
        response.send("No record found.");
      } else {
        response.json(results[0]);
      }
    });
  } else {
    response.status(400);
    response.send("Invalid id, must be positive integer!");
  }
});

app.get('/items/:month/:year', (request, response) => {
  const month = parseInt(request.params.month);
  const year = parseInt(request.params.year);
  
  if (month && year && month > 0 && year > 0 && month <= 12) {
    db.query(`select * from ITEM where month = ${month} and year = ${year}`, (error, results) => {
      if (error) {
        response.status(500);
        response.send(error);
      } else {
        response.json(results);
      }
    });
  } else {
    response.status(400);
    response.send("Invalid month and/or year!");
  }
});

app.get('/items/:month/:year/:category', (request, response) => {
  const month = parseInt(request.params.month);
  const year = parseInt(request.params.year);
  const category = ("" + request.params.category).replace(/[^A-Za-z0-9 ]/g, "");
  
  if (month && year && month > 0 && year > 0 && month <= 12 && category.length > 0) {
    db.query(`select * from ITEM where month = ${month} and year = ${year} and category_name = "${category}"`, (error, results) => {
      if (error) {
        response.status(500);
        response.send(error);
      } else {
        response.json(results);
      }
    });
  } else {
    response.status(400);
    response.send("Invalid month, year, and/or category!");
  }
});

app.get('/categories/:month/:year', (request, response) => {
  const month = parseInt(request.params.month);
  const year = parseInt(request.params.year);
  
  if (month && year && month > 0 && year > 0 && month <= 12) {
    db.query(`select * from CATEGORY where month = ${month} and year = ${year}`, (error, results) => {
      if (error) {
        response.status(500);
        response.send(error);
      } else {
        response.json(results);
      }
    });
  } else {
    response.status(400);
    response.send("Invalid month, and/or year!");
  }
});

app.listen(port, error => {
  if (error) {
    console.log("Something went wrong :(");
  } else {
    console.log(`Server listening on port ${port}`);
  }
});
