const express = require('express');

const app = express();
const port = 3000;

const factorial = num => {

    if (num == 0 || num == 1){
        return 1;
    }
    else {
        return num * factorial(num - 1);
    }

}

app.get('/factorial', (req, res, next) => {
    const num = req.query.number;
    const path = req.path;
    if(!num) {
        res.send('not availiable');
    }
    else {
        res.redirect(`${path}/${num}`);
    }
})

app.get('/factorial/:number', (req, res) => {    
    const num = req.params.number;
    res.send(`${num}! = ${factorial(num)}`);
});


app.listen(port, () => { console.log('listening') });