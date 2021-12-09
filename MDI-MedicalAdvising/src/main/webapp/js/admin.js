const imgUpload = document.getElementById("upload-photo");
const imgReview = document.querySelector(".question__form__img-review");
const btnReset = document.querySelector(".btn-reset");
const btnSubmit = document.querySelector(".btn-submit");
const btnGoToTop = document.querySelector(".go-to-top");
const btnEdit = document.querySelectorAll(".btn-edit");
const btnDelete = document.querySelectorAll(".btn-delete");
const modal = document.querySelector(".modal");
const overlay = document.querySelector(".overlay");
const modalBody = document.querySelector(".modal__body");
const tableContainer = document.querySelector("tbody")
const typeColor={
  "Kháng sinh": "success",
  "Covid-19": "info",
  "Huyết áp": "danger",
  "Tiêu hóa": "warning"
}
//img preview
imgUpload.onchange = (e) => {
  const [file] = imgUpload.files;
  if (file) {
    const imgWrapper = document.createElement("div");
    imgWrapper.className = "img__wrapper";
    imgWrapper.innerHTML = `<img src="${URL.createObjectURL(
      file
    )}" alt="ảnh thuốc">`;
    imgReview.appendChild(imgWrapper);
  }
};
//btn go to top
const goToTop = () => {
  if (window.scrollY > 400) {
    btnGoToTop.style.display = "block";
  } else {
    btnGoToTop.style.display = "none";
  }
};
window.addEventListener("scroll", goToTop);

// control sua xoa
// khai Báo
const inputElement = document.querySelectorAll(".form-control");
//btn sửa
btnEdit.forEach((item) => {
  item.onclick = () => {
    inputElement[0].value = item.parentNode.closest("tr").children[0].textContent;
    inputElement[1].value = item.parentNode.closest("tr").children[1].textContent;
    inputElement[2].value = item.parentNode.closest("tr").children[2].textContent.trim();
      inputElement[3].value = item.parentNode.closest("tr").children[3].textContent.match(/\d+/g).join("");
  };
});
// btn xóa
btnDelete.forEach((item) => {
  item.onclick = () => {
    modal.style.display = "block";
    document.querySelector(".btn-agree").onclick = () => {
      modal.style.display = "none";
      console.log("delete");
      item.parentNode.closest("tr").remove();
    };
    document.querySelector(".btn-reject").onclick = () => {
      modal.style.display = "none";
      console.log("btn-reject clicked");
    };
  };
});

// btn thêm
btnSubmit.addEventListener("click", (e) => {
  e.preventDefault();
  // const newItem = document.createElement("tr");
  // const newEditBtn = document.createElement("button")
  // const newDeleteBtn = document.createElement("button")
  // newItem.innerHTML =`<td> ${inputElement[0].value} </td>
  // <td> ${inputElement[1].value} </td>
  // <td>
  //   <label class="badge badge-${typeColor[inputElement[2].value]}"> ${inputElement[2].value} </label>
  // </td>
  // <td> ${Intl.NumberFormat().format(inputElement[3].value)}đ </td>
  // <td> T${tableContainer.childElementCount+1<10?"0"+(tableContainer.childElementCount+1):tableContainer.childElementCount+1} </td>
  // <td>
  // </td>`
  // newEditBtn.classList.add("btn","btn-sm", "btn-icon-text", "btn-gradient-dark", "btn-edit")
  // newEditBtn.innerHTML=`<i
  // //     class=" btn-icon-prepend far fa-edit"></i>Sửa`
  // newDeleteBtn.classList.add("btn","btn-sm", "btn-icon-text", "btn-gradient-danger", "btn-delete")
  // newDeleteBtn.innerHTML=`<i
  // //       class=" btn-icon-prepend fas fa-trash-alt"></i>Xóa`
  // // btnEdit.push(newEditBtn)
  // btnEdit[4].parentNode.insertBefore(newEditBtn,btnEdit[4])
  // console.log(btnEdit);
  // newItem.lastChild.appendChild(newEditBtn);
  // newItem.lastChild.appendChild(newDeleteBtn);
  // tableContainer.appendChild(newItem);
  let newItem = {
    name: inputElement[0].value,
    desc: inputElement[1].value,
    type: inputElement[2].value,
    price: inputElement[3].value,
    img: inputElement[4].parentNode.children[1].children[0].children[0].src
  }
  console.log(newItem);
  btnReset.click();
})
// btn reset
btnReset.addEventListener("click", (e) => {
  e.preventDefault();
  if (imgReview.children[0]) {
    imgReview.children[0].remove();
  }
  document.querySelectorAll(".form-control").forEach((item) => {
    item.value = "";
  });
});