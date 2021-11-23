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
var shoppingList = []; //tao list trong
const modalBodyInner = document.createElement("div");
modalBodyInner.classList.add("modal__body__inner");
const products = document.querySelectorAll(".product-link");
const modal = document.querySelector(".modal");
const overlay = document.querySelector(".modal__overlay");
const modalBody = document.querySelector(".modal__body");
const cartNumber = document.querySelector(".shopping__cart");
products.forEach(function (product) {
  product.addEventListener("click", function (e) {
    modal.style.display = "flex";
    let price = product.children[2].firstChild.textContent
      .match(/\d+/g)
      .join("");
    let number = 1;
    const productImage = product.children[0].childNodes[1].src;
    const productName = product.children[1].textContent;
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
      const priceUpdate = document.querySelector(
        ".product-link__price"
      ).firstChild;
      const btnBuy = document.querySelector(".btn__buy");
      plus.addEventListener("click", (e) => {
        number++;
        e.target.parentNode.children[1].textContent = number;
        priceUpdate.textContent =
          Intl.NumberFormat().format(price * number) + " ₫";
      });
      minus.addEventListener("click", (e) => {
        if (number > 1) {
          number--;
          e.target.parentNode.children[1].textContent = number;
          priceUpdate.textContent =
            Intl.NumberFormat().format(price * number) + " ₫";
        }
      });
      btnBuy.addEventListener("click", (e) => {
        let productCart = {
          img: productImage,
          name: productName,
          number: number,
          price: price,
          totalPrice: priceUpdate.textContent.match(/\d+/g).join(""),
        };
        if (shoppingList.length == 0) {
          // console.log("phat dau`");
          shoppingList.push(productCart); //them sp vao` list
        } else {
          let check = false;
          shoppingList.forEach((item) => {
            if (item.name === productCart.name) {
              // console.log("co roi");
              item.number += productCart.number;
              item.totalPrice = item.number * item.price;
              check = true;
              return;
            }
          });
          if (check == false) {
            // console.log("chua co");
            shoppingList.push(productCart);
          }
        }

        // console.log(shoppingList); In ra sp hien co
        overlay.click();
        if (shoppingList.length > 0) {
          cartNumber.childNodes[3].textContent = shoppingList.length;
          cartNumber.childNodes[3].classList.remove("display--none");
        } else cartNumber.childNodes[3].classList.add("display--none");
      });
    }
  });
});
overlay.addEventListener("click", function (e) {
  modal.style.display = "none";
  modalBodyInner.innerHTML = "";
});
cartNumber.addEventListener("click", function (e) {
  const cartList = document.querySelector(".shopping__cart__list");
  const listContainer = cartList.querySelector(".cart__list__container");
  if (shoppingList.length > 0) {
    cartList.style.display = "block";
    shoppingList.forEach(function (listItem) {
      let cartListItem = document.createElement("li");
      cartListItem.classList.add("cart__list__item");
      cartListItem.innerHTML = `
    <img src="${listItem.img}" alt="sản phẩm đã thêm" class="item__img">
            <div class="item__info">
              <div class="item__header">
                <h5 class="item__name">${listItem.name}</h5>
                <span class="item__price">${Intl.NumberFormat().format(
                  listItem.price
                )}đ</span>
                <span class="item__qnt">x${listItem.number}</span>
                <span class="item__update"></span>
              </div>
              <div class="item__body">
                <span class="items__price__total">Tổng: ${Intl.NumberFormat().format(
                  listItem.totalPrice
                )}đ</span>
                <span class="icon__update">
                <span class="item__cart__edit"><i class="fas fa-pencil-alt edit__cart"></i></span>
                <!-- <span class="item__cart__edit"><i class="far fa-trash-alt"></i></span> -->
                <span class="item__cart__edit"><i class="fas fa-trash-alt remove__cart"></i></span>
                </span>
              </div>
            </div>
    `;
      listContainer.appendChild(cartListItem);
    });
  }
  if (cartList.style.display == "block") {
    document.addEventListener("click", (outside) => {
      if (
        !cartList.contains(outside.target) &&
        !cartNumber.contains(outside.target)
      ) {
        cartList.style.display = "none";
        listContainer.innerHTML = "";
      }
    });
  }
  const editCart = document.querySelectorAll(".edit__cart");
  editCart.forEach((item, index) => {
    item.addEventListener("click", (e) => {
      item.classList.add("selected");
      let itemNoSelected = [...editCart].filter(
        (notSelect) => !notSelect.classList.contains("selected")
      );
      itemNoSelected.forEach((a) =>
        a.parentNode.parentNode.classList.add("display--none")
      );
      let newTotal = e.target.parentNode.closest(".item__body").childNodes[1];
      let editShoppingCart =
        e.target.parentNode.closest(".item__info").childNodes[1].childNodes[7];
      editShoppingCart.innerHTML = `<i class="fas fa-minus-circle minus"></i>
      <span class="number__update">${shoppingList[index].number}</span>
      <i class="fas fa-plus-circle plus"></i>
      <i class="far fa-save save"></i>`;
      editShoppingCart.classList.remove("display--none");
      const plus = document.querySelectorAll(".plus");
      const minus = document.querySelectorAll(".minus");
      const save = document.querySelectorAll(".save");
      let newQnt = document.querySelectorAll(".number__update");
      let numberUpdate = shoppingList[index].number;
      plus.forEach((plusItem, plusIndex) => {
        plusItem.addEventListener("click", (e) => {
          numberUpdate++;
          newQnt[plusIndex].textContent = numberUpdate;
          newTotal.textContent = `Tổng: ${Intl.NumberFormat().format(
            numberUpdate * shoppingList[index].price
          )}đ`;
        });
      });
      minus.forEach((minusItem, minusIndex) => {
        minusItem.addEventListener("click", (e) => {
          if (numberUpdate > 1) {
            numberUpdate--;
            newQnt[minusIndex].textContent = numberUpdate;
            newTotal.textContent = `Tổng: ${Intl.NumberFormat().format(
              numberUpdate * shoppingList[index].price
            )}đ`;
          }
        });
      });
      save.forEach((saveItem) => {
        saveItem.addEventListener("click", (e) => {
          shoppingList[index].number = numberUpdate;
          shoppingList[index].totalPrice =
            numberUpdate * shoppingList[index].price;
          document.querySelectorAll(".item__qnt")[
            index
          ].textContent = `x${shoppingList[index].number}`;
          editShoppingCart.classList.add("display--none");
          item.classList.remove("selected");
          itemNoSelected.forEach((a) =>
            a.parentNode.parentNode.classList.remove("display--none")
          );
        });
      });
    });
  });
  const removeCart = document.querySelectorAll(".remove__cart");
  removeCart.forEach((removeItem, index) => {
    removeItem.addEventListener("click", (e) => {
      let itemRemove = e.target.parentNode.closest(".cart__list__item");
      // test.classList.add("display--none");
      itemRemove.remove();
      shoppingList.splice(index, 1);
      cartNumber.childNodes[3].textContent = shoppingList.length;
      if (cartNumber.childNodes[3].textContent == "0") {
        cartNumber.childNodes[3].classList.add("display--none");
      }
    });
  });
  getCartList = () => {
    return {
      id: 1,
      cartList: shoppingList,
    };
  };
  const buyConfirm = document.querySelector(".buy__confirm");
  buyConfirm.addEventListener("click", function () {
    modalBody.classList.add("mini__box");
    modalBodyInner.innerHTML = `<h2>Bạn có muốn liên hệ với bác sĩ để được tư vấn không?</h2>
    <div class="info__container confirm__advice__container">
      <button class="advice__btn advice--yes">Có</button>
      <button class="advice__btn advice--no">Không</button>`;
    modalBody.appendChild(modalBodyInner);
    modal.style.display = "flex";
    const adviceYes = document.querySelector(".advice--yes");
    const adviceNo = document.querySelector(".advice--no");
    adviceYes.addEventListener("click", () => {
      window.open("https://youtube.com");
    });
    adviceNo.addEventListener("click", () => {
      // var script = document.createElement("script");
      // script.type = "text/javascript";
      // script.src="https://maps.googleapis.com/maps/api/js?libraries=places&language=vi&key=AIzaSyASFAoOdtLHSx-Twjx_jUwDa108QnnSWfg&callback=initMap&v=weekly&channel=2"
      // document.head.appendChild(script);
      // var script2 = document.createElement("script");
      // script2.type = "text/javascript";
      // script2.innerHTML=`$(function () {
      //   // add input listeners
      //   google.maps.event.addDomListener(window, 'load', function () {
      //     var from_places = new google.maps.places.Autocomplete(document.querySelector('.address__value'));
      //     google.maps.event.addListener(from_places, 'place_changed', function () {
      //       var from_place = from_places.getPlace();
      //       var from_address = from_place.formatted_address;
      //       $('#origin').val(from_address);
      //     });
      //   });
      // });`
      // document.body.appendChild(script2);
      modalBody.classList.remove("mini__box");
      overlay.click();
      modalBodyInner.innerHTML = `<h2>Nhập thông tin giao hàng</h2>
      <div class="info__container">
        <div class="name__container info__content">
          <span>Họ tên</span>
          <input type="text" required placeholder="vui lòng nhập tên của bạn" class="name__value">
        </div>
        <div class="tel__container info__content">
          <span>Số điện thoại</span>
          <input type="text" required placeholder="Vui lòng nhập số điện thoại" class="tel__value">
        </div>
        <div class="address__container info__content">
          <span>Địa chỉ</span>
          <input type="text" required placeholder="Vui lòng nhập địa chỉ" class="address__value">
          <input id="origin" name="origin" required="" type="hidden" /></div>
        </div>
        <div class="current__address">
          Chọn địa chỉ hiện tại
          <i class="fas fa-map-marker-alt"></i>
        </div>
        <div class="status__container">
       <div>Bắt đầu tìm kiếm</div>
        </div>
        <div class="btn__status__container">
          <button class="btn__status btn__seeking">Tìm kiếm</button>
        </div>
      </div>`;
      // <div class="status__seeking">Đang tìm nhà thuốc gần bạn...</div>
      // <div class="status__seeked">Đã tìm thấy</div>
      // <div class="status__fail">Không tìm nhà thuốc gần bạn</div>
      modalBody.appendChild(modalBodyInner);
      modal.style.display = "flex";
      const btnStatus = document.querySelector(".btn__status");
      const status = document.querySelector(".status__container");
      btnStatus.addEventListener("click", () => {
        if (btnStatus.classList.contains("btn__seeking")) {
          btnStatus.classList.add("btn__cancel");
          btnStatus.textContent = "Hủy";
          btnStatus.classList.remove("btn__seeking");
          status.style.display = "block";
          status.innerHTML = `<div class="status__seeking">Đang tìm nhà thuốc gần bạn...</div>`;
        } else {
          btnStatus.classList.add("btn__seeking");
          btnStatus.textContent = "Tìm kiếm";
          btnStatus.classList.remove("btn__cancel");
          status.innerHTML = `<div class="status__fail">Chưa tìm thấy nhà thuốc phù hợp</div>`;
        }
      });
    });
  });
});
