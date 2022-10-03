const path = require('path');
const fs = require('fs');
const util = require('util');

const testdir = path.join('./test');

const readdir = util.promisify(fs.readdir);
const stat = util.promisify(fs.stat)

// const searchJS = dir => {

//     const dirlist = fs.readdir(dir, (err, data) => {

//         if (err) {
//             console.log('err');
            
//         }
//         else {
//             return data;
//         }

//     });

//     return dirlist;


// };

const searchJS = async dir => {

    
    const dirlist = await readdir(dir);

    //const dirlist = await readdir(dir, ['utf8', true]);
    //
    // for (var i = 0; i < dirlist.length; i++){
    //     console.log(dirlist[i].name);
    //     if (dirlist[i].isDirectory()) {
    //         searchJS(path.join(dir, dirlist[i].name));
    //     }
    //     else {
    //         console.log(path.join(dir, dirlist[i].name));
    //     }
    // }

    for (var i = 0; i < dirlist.length; i++){
        const filepath = path.join(dir, dirlist[i]);
        const filestat = await stat(filepath);

        if (filestat.isDirectory()){
            searchJS(filepath);
        }
        else if (path.extname(filepath) == '.js'){
            console.log(filepath);
        }
    }

    //console.log(dirlist);

    return dirlist;

};

const files = searchJS(testdir);
