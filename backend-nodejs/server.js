const express = require("express")
const app = express()
const PORT = {
    BACKEND: 8080,
    DATABASE: 3306,
}
const mysql = require("mysql2")
const connection = mysql.createConnection({
    host: "127.0.0.1",
    user: "root",
    password: "McGill2022*",
    database: "bdermaplus",
    port: PORT.DATABASE,
})
// connection.connect(function (err) {
//     if (err) {
//         return console.error("error: " + err.message)
//     }

//     connection.query("SELECT * FROM customer", function (err, result) {
//         if (err) {
//             return console.error("error: " + err.message)
//         }
//         console.log(result)
//     })
// })

// // connection.end()
app.get("/", (req, res) => {
    res.json({ message: "hi" })
})

app.listen(PORT.BACKEND, () => {
    console.log("listening on PORT " + PORT.BACKEND)
})