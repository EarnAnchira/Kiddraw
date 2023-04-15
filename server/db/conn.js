const mysql = require("mysql2");
const conn = mysql.createConnection({
    user:"root",
    password:"root",
    host:"localhost",
    database:"kidkid", //database name
    port:"3000" // MySQL port in xamp or mamp
});
conn.connect((error)=>{
    if(error) throw error;
    console.log("connected!")
});

module.exports = conn