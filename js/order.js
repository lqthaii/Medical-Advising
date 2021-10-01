const categories = document.querySelectorAll(".category-item__link");
categories.forEach(function (item) {
  item.addEventListener("click", function (e) {
    if (!e.target.classList.contains("category-item__link--selected")) {
      categories.forEach(function (items) {
        items.classList.remove("category-item__link--selected");
      });
      item.classList.add("category-item__link--selected");
    }
  });
});
var shoppingList = [];//tao list trong
const products = document.querySelectorAll(".product-link");
const modal = document.querySelector(".modal");
const overlay = document.querySelector(".modal__overlay");
const modalBody = document.querySelector(".modal__body");
products.forEach(function (product) {
  product.addEventListener("click", function (e) {
    modal.style.display = "flex";
    let price = product.children[2].firstChild.textContent.match(/\d+/g).join("");
    let number = 1;
    const productImage = product.children[0].childNodes[1].src;
    const productName = product.children[1].textContent;
    const modalBodyInner = document.createElement("div");
    modalBodyInner.classList.add("modal__body__inner");
    modalBodyInner.innerHTML = `<a href="#" class="product-link product-link--click">
    <div class="product__image__wrapper">
      <img
        src="${productImage}"
        alt="${productName}">
    </div>
    <p class="product__name">${productName}</p>
    <div class="product__price product-link__price">${Intl.NumberFormat().format(
      price
    )} ₫
      <div class="product__number">
        <i class="fas fa-minus-circle minus"></i>
        <span class="number">1</span>
        <i class="fas fa-plus-circle plus"></i>
      </div>
    </div>
    <div class="product-buy">
      <button class="btn__buy">Thêm vào giỏ hàng</button>
    </div>
  </a>`;
    modalBody.appendChild(modalBodyInner);
    //cap nhat so luong, gia
    if (modalBodyInner) {
      const plus = document.querySelector(".plus");
      const minus = document.querySelector(".minus");
      const priceUpdate = document.querySelector(".product-link__price").firstChild;
      const btnBuy = document.querySelector(".btn__buy");
      plus.addEventListener("click", (e) => {
        number++;
        e.target.parentNode.children[1].textContent = number;
        priceUpdate.textContent =
          Intl.NumberFormat().format(price * number) + " ₫";
      });
      minus.addEventListener("click", (e) => {
        if (number > 0) {
          number--;
          e.target.parentNode.children[1].textContent = number;
          priceUpdate.textContent =
            Intl.NumberFormat().format(price * number) + " ₫";
        }
      });
      btnBuy.addEventListener("click",(e) =>{
        let productCart = {
          name: productName,
          number: number,
          price: priceUpdate.textContent.match(/\d+/g).join(""),
        };
        shoppingList.push(productCart);//them sp vao` list
        console.log(shoppingList);
        overlay.click();
        const CartNumber = document.querySelector(".shopping__cart");
        let updateCartNumber =  document.createElement("span");
        updateCartNumber.classList.add("shopping__cart__number");
        updateCartNumber.textContent = shoppingList.length;
        CartNumber.appendChild(updateCartNumber);
      })
    }
  });
});
overlay.addEventListener("click", function (e) {
  modal.style.display = "none";
  modalBody.childNodes[3].remove(); //remove modalBodyInner
});
