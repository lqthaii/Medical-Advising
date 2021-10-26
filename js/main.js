const newNotify = document.querySelectorAll(".notify-info-new");
const numOfNotify = document.querySelector(".notify-number");
const navbarUser = document.querySelectorAll(".navbar__menu")[1];
numOfNotify.innerText = newNotify.length;
newNotify.forEach(function (item) {
  item.addEventListener("click", function (e) {
    e.target.parentNode.classList.remove("notify-info-new");
    let newNotify = document.querySelectorAll(".notify-info-new");
    if (newNotify.length > 0) {
      numOfNotify.innerText = newNotify.length;
      numOfNotify.classList.remove("no-notify-number");
    } else {
      numOfNotify.classList.add("no-notify-number");
    }
    console.log(newNotify);
  });
});
const logOut = document.getElementById("log-out");
logOut.addEventListener("click", function (e) {
  navbarUser.classList.remove("menu-user");
});
const userInfo = document.getElementById("user-info");
userInfo.addEventListener("click", function (e) {
  const userName = document.getElementById("user-name");
  const userAvt = document.querySelector(".navbar__menu__user__avt");
  console.log(userName);
  console.log(userAvt);
  navbarUser.classList.add("menu-user");
  userName.innerText = "Quốc";
  userAvt.src = "../assets/image/maxresdefault.jpg";
});

// Slider JS
window.addEventListener("load", function () {
  const sliderMain = document.querySelector(".slider-main");
  // const sliderItems = document.querySelectorAll(".slider-item");
  const sliderDots = document.querySelectorAll(".slider-dot-item");
  // let interval = 0;
  // let indexDot = 0;
  // let slideEnd = false;
  // function indexActive(index) {
  //   let dotActive;
  //   sliderDots.forEach(function (items) {
  //     if (items.classList.contains("active")) {
  //       dotActive = items.getAttribute("data-index");
  //     }
  //     items.classList.remove("active");
  //   });
  //   sliderDots[index].classList.add("active");
  // }
  function removeActive() {
    sliderDots.forEach(function (items) {
      items.classList.remove("active");
    });
  }

  sliderDots.forEach(function (item) {
    item.addEventListener("click", function (e) {
      if (!e.target.classList.contains("active")) {
        removeActive();
        sliderMain.style = `transform: translateX(${-e.target.getAttribute(
          "data-index"
        )}00%);`;
        e.target.classList.add("active");
      }
    });
  });
  // Hàm slide tự trượt
  //   setInterval(function () {
  //     if (interval < sliderItems.length - 1 && slideEnd == false) {
  //       interval++;
  //     } else if (interval == sliderItems.length - 1) {
  //       slideEnd = true;
  //       interval--;
  //     } else if (interval == 0) {
  //       slideEnd = false;
  //       interval++;
  //     } else {
  //       interval--;
  //     }
  //     indexActive(interval);
  //     sliderMain.style = `transform: translateX(${-interval}00%);`;
  //   }, 4000);
});
// Render Blog
// const blogCreate = document.querySelector(".news__container");
// function createBlog() {
//   fetch("https://jsonplaceholder.typicode.com/posts") //Test
//     .then((response) => response.json())
//     .then(function (posts) {
//       var htmls = posts.map(function (post) {
//         return `<div class="news__blog">
//       <div class="news__blog__img">
//           <img src="assets/image/nho.jpg" alt="">
//       </div>
//       <div class="news__blog__info">
//           <h4 class="news__blog__info__header">${post.title}</h4>
//           <div class="news__blog__info__content"><span>${post.body}</span>
//               <a href="#" class="news__blog__link">xem thêm...</a>
//           </div>
//       </div>
//     </div>`;
//       });
//       var html = htmls.join("");
//       // console.log(htmls[99]);
//       blogCreate.innerHTML = html;
//     });
// }
