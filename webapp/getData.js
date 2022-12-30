// Viết function kéo về dữ liệu user từ trang https://jsonplaceholder.typicode.com/posts, sau đó convert nó sang array of object
getText("https://jsonplaceholder.typicode.com/posts");


async function getText(url) {
    let request = await fetch(url);
    let response = await request;
    let data = (JSON.parse(await response.text()));
    console.log(data);  
    writeToPage(data);
}

function writeToPage(data) {
    let alreadyPick = {};
    let htmlResult = "";
    for (let i = 1; i <= 5; ) {
        let chosen = Math.floor(Math.random()* 101);
        if(!alreadyPick[chosen]) {
            alreadyPick[chosen] = true;
            i++;
            let post = data[chosen];
            htmlResult += '<div class="row"><h3>' + post["title"] + '</h3><p>Post ID: <span>' + post["id"] + '</span></p><p>'
                        + post["body"] + '</p></div><hr>';
        }
    }

    document.getElementById("postBoard").innerHTML = htmlResult;
}


// Dữ liệu kéo về là 1 array có 100 posts, viết function dùng hàm random bốc ra 5 post không trùng nhau và ghi lên trang web như ví dụ