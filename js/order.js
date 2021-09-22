const categories = document.querySelectorAll(".category-item__link");
console.log(categories)
categories.forEach(function(item){
    item.addEventListener("click",function(e){
        if(!e.target.classList.contains("category-item__link--selected")){
            categories.forEach(function(items){
                items.classList.remove("category-item__link--selected");
            })
         item.classList.add("category-item__link--selected");
        }
    })
})