const express = require('express');

const app = express();
const port = 3000;

const dataToString = (obj) =>  Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n'); 

app.use(express.urlencoded({ extended: true }));

app.get('/', (req, res) => {
    const data = dataToString(req.query);
    console.log(data);
    res.send(data);
});

app.post('/', (req, res) => {
    const data = dataToString(req.body);
    console.log(data);
    res.send(data);
});

app.put('/', (req, res) => {
    const data = dataToString(req.body);
    console.log(data);
    res.send(data);
});

app.delete('/', (req, res) => {
    const data = dataToString(req.body);
    console.log(data);
    res.send(data);
});


app.listen(port, () => { console.log(`server is listening on port ${port}`) });