const btnQuestion = document.querySelector(".btn_question_submit");
const questionImg = document.getElementById("upload-photo");
const imgReview = document.querySelector(".question__form__img-review");
let count = 0;
btnQuestion.addEventListener("click", (e) => {
  console.log(getQuestionContent());
});
getQuestionContent = () => {
  const questionContent = document.getElementById("question__content__textarea");
  if (questionContent.value != "") {
    let imgLinks = [];
    for (let i = 0; i <imgReview.children.length; i++) {
      imgLink.push(imgReview.children[i].firstChild.src)
    }
    return {
        question: questionContent.value,
        img: imgLinks
    }
  }
};
questionImg.onchange = (evt) => {
  if (count < 4) {
    const [file] = questionImg.files;
    if (file) {
      count++;
      const imgWrapper = document.createElement("div");
      imgWrapper.className = "img__wrapper";
      imgWrapper.innerHTML = `<img src="${URL.createObjectURL(file)}" alt="">
                <i class="far fa-times-circle remove-img"></i>`;
      imgReview.appendChild(imgWrapper);
      const removeImg = document.querySelectorAll(".remove-img");
      removeImg.forEach((item) => {
        item.addEventListener("click", (e) => {
          e.target.parentNode.remove();
          count--;
        });
      });
    }
  }
};
