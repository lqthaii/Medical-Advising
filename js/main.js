const newNotify = document.querySelectorAll(".notify-info-new");
const numOfNotify = document.querySelector(".notify-number");
const navbarUser = document.querySelectorAll(".navbar__menu")[1];
numOfNotify.innerText = newNotify.length;
newNotify.forEach(function(item) {
    item.addEventListener("click", function(e) {
        e.target.parentNode.classList.remove("notify-info-new");
        let newNotify = document.querySelectorAll(".notify-info-new");
        if(newNotify.length > 0){
            numOfNotify.innerText = newNotify.length;
            numOfNotify.classList.remove("no-notify-number");
        }
        else {
            numOfNotify.classList.add("no-notify-number");
        }
        console.log(newNotify);

    })
})
const logOut = document.getElementById("log-out");
logOut.addEventListener("click", function(e){
    navbarUser.classList.remove("menu-user")
})
const userInfo = document.getElementById("user-info");
userInfo.addEventListener("click", function(e){
    const userName = document.getElementById("user-name");
    const userAvt = document.querySelector(".navbar__menu__user__avt");
    console.log(userName);
    console.log(userAvt);
    navbarUser.classList.add("menu-user")
    userName.innerText= "Khoa";
    userAvt.src = "https://scontent.xx.fbcdn.net/v/t1.6435-1/p100x100/52161636_1064694103715214_75803037448273920_n.jpg?_nc_cat=108&ccb=1-5&_nc_sid=dbb9e7&_nc_ohc=OwLo2wdhXuoAX8ncaMf&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=b5057126446a9061dd2660dd74cd1ef9&oe=615D4554";
})