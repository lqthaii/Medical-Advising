const editInfo = document.querySelectorAll(".edit-info");
function editUser(name) {
  name.setAttribute("contenteditable", "true");
  name.style.cursor = "text";
  name.focus();
  name.addEventListener("keypress", function(e){
    if(e.key == "Enter")
    blurUser(name);
  })
}
function blurUser(name) {
  name.removeAttribute("contenteditable");
  name.style.removeProperty("cursor");
}
editInfo.forEach(function (editInfo, index) {
  if (index == 0) {
    editInfo.addEventListener("click", function (e) {
      editUser(e.target.parentNode.childNodes[1]);
      e.target.parentNode.childNodes[1].addEventListener("blur", function (name) {
        blurUser(name.target);
    })
    });
  } else {
    editInfo.addEventListener("click", function (e) {
      editUser(e.target.parentNode.childNodes[3]);
      e.target.parentNode.childNodes[3].addEventListener("blur", function (name) {
        blurUser(name.target);
    })
    });
  }
});
//change avatar
const avatarImg = document.querySelector(".avatar__img");
const profileImg = document.querySelector(".navbar__menu__user__avt")
const avatarUpload = document.getElementById("upload-avatar");
avatarUpload.onchange = (evt) => {
    const [file] = avatarUpload.files;
    if (file) {
      avatarImg.src = URL.createObjectURL(file);
      profileImg.src = avatarImg.src;
      console.log(avatarImg.src);
    }
};
