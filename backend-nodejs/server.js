const express = require("express");
const app = express();
const http = require("http"); // for serving HTTP requests
const fs = require("fs").promises; // for reading files
const querystring = require("querystring"); // for parsing form fields from POST

const PORT = {
  BACKEND: 8080,
  DATABASE: 3306,
};

//database connection
const mysql = require("mysql2");
const connection = mysql.createConnection({
  host: "127.0.0.1",
  user: "root",
  password: "McGill2022*",
  database: "bdermaplus",
  port: PORT.DATABASE,
});

//show the result
app.get("/customer-list", (req, res) => {
  connection.connect(function (err) {
    if (err) {
      return console.error("error: " + err.message);
    }
    try {
      connection.query("SELECT * FROM customer", function (err, result) {
        if (err) {
          return console.error("error: " + err.message);
        }
        // console.log(result);
        res.json({ result });
      });
    } finally {
      connection.end();
    }
  });
});

//landing api point
app.get("/", (req, res) => {
  res.json({ message: "hi" });
});

app.get("/add-new-user", (req, res) => {
  fs.readFile(__dirname + "/form.html")
    .then((content) => {
      res.setHeader("Content-Type", "text/html");
      res.writeHead(200);
      res.end(content);
    })
    .catch((err) => {
      res.writeHead(500);
      res.end(err);
    });
});

app.post("/insert-data", (req, res) => {
  let body = "";
  req.on("data", (chunk) => {
    body += chunk.toString();
    req.on("end", () => {
      const fields = querystring.parse(body);
      let first_name = fields.first_name;
      let last_name = fields.last_name;
      let ramq_number = fields.ramq_number;
      let email = fields.email;
      let age = fields.age;
      let gender = fields.gender;
      let telephone = fields.telephone;
      let address = fields.address;
      let status = fields.status;
      let is_vip = fields.is_vip;

      connection.connect(function (err) {
        if (err) {
          return console.error("error: " + err.message);
        }
        try {
          const str = `'${first_name}',
            '${last_name}',
            '${ramq_number}',
            '${email}',
            '${age}',
            '${gender}',
            '${telephone}',
            '${address}',
            '${status}',
            '${is_vip}', '0'`;
          // const str='test'
          console.log("str=", str);
          connection.query(
            "INSERT INTO customer(first_name,last_name,ramq_number,email,age,gender,telephone,address,status,is_vip,is_deleted) VALUES(" +
              str +
              ")",
            function (err, result) {
              if (err) {
                return console.error("error: " + err.message);
              }
            }
            );
        } finally {
            connection.end();
            res.redirect(301, 'http://localhost:8080/customer-list');
            res.end();
        }
      });
    });
  });
});

app.listen(PORT.BACKEND, () => {
  console.log("listening on PORT " + PORT.BACKEND);
});
