const express = require('express');
const app = express();

app.get('/', (req,res)=>{
  res.send("CI/CD Pipeline Success!");
});

app.listen(3000);

