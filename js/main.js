const newNotify = document.querySelectorAll(".notify-info-new");
const numOfNotify = document.querySelector(".notify-number");
numOfNotify.innerText = newNotify.length;
newNotify.forEach(function(item) {
    item.addEventListener("click", function(e) {
        e.target.parentNode.classList.toggle("notify-info-new");
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