const express = require('express');
const app = express();
const port = process.env.PORT || 80

app.get('/', (req, res) => {
  res.send(process.env);
})

app.get('/health', (req, res) => {
  res.send({
    status: 'OK',
  });
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`);
})
