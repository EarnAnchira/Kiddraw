const express = require("express")
const path = require('path');
const app = express();
const fs = require('fs');
// port server
const port = 3001; 
require("./db/conn");
const cors = require("cors")
const router = require("./routes/router")

app.use(express.json());
app.use(express.static('public'));
app.use(cors());
app.use("/uploads",express.static("./uploads"))
app.use(router);

app.listen(port,()=>{
    console.log("server start")
})