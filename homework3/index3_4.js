const express = require('express');

const app = express();
const port = 3000;


app.use(express.urlencoded({ extended: true }));

app.set('views', `${__dirname}/views`);
app.set('view engine', 'pug');


app.get('/', (req, res) => {
    res.render('index3_4.pug');
});

app.post('/login', (req, res) => {
    const username = req.body.username;
    const password = req.body.password;
    console.log(`${username}, ${password}`);
    res.send(`Username: ${username} and Password: ${password}`);
});


app.listen(port, () => { console.log('listening') });