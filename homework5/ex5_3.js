const express = require('express');
const { runQuery } = require('./database');

const app = express();
const port = 3000;

app.get('/fare', async (req, res) => {

    const { uid } = req.query;
    const dbquery = `select Round(Sum(types.fare_rate * trains.distance) * 0.001, -2)
                    from users inner join tickets on users.id=tickets.user
                    inner join trains on tickets.train=trains.id
                    inner join types on trains.type=types.id
                    where users.id=?;`;
    console.log(dbquery);
    const { totalfare } = await runQuery(dbquery, [uid])
    return res.send(`total fare of ${uid}: ${totalfare}`)


});

app.get('/train/status', async (req, res) => {

    const { tid } = req.query;    
    const dbquery = `select types.max_seats - Count(*)
                    from trains inner join types on trains.type=types.id
                    inner join stations as source on source.id=trains.source
                    inner join stations as destination on destination.id=trains.destination
                    left join tickets on tickets.train=trains.id
                    where trains.id=?;`;
    const { emptyseats } = await runQuery(dbquery, [tid])
    if (emptyseats > 0){
        return res.send(`the train ${tid} is not sold out`);
    }
    else
    {
        return res.send(`the train ${tid} is sold out`);
    }

});

app.listen(port, () => console.log('listening'));