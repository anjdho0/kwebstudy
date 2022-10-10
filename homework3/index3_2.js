const express = require('express');

const app = express();
const port = 3000;

app.get('/', (req, res) => { res.send('for test') });


app.get('/board/page/:page', (req, res) => {
    res.send(`this is page ${req.params.page}`);
});




app.listen(port, () => { console.log('listening') });