const getAssignments = document.querySelector(".assignment");
const modal = document.querySelector(".modal");
const overlay = document.querySelector(".modal__overlay");

getAssignments.addEventListener("click", () => {
  modal.style.display = "flex";
});
//modal hidden
overlay.addEventListener("click", function (e) {
  modal.style.display = "none";
});
//slider img
window.addEventListener("load", function () {
  const sliderMain = document.querySelector(".slider-main");
  const sliderDots = document.querySelectorAll(".slider-dot-item");
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
});
//display answer box
const answer = document.querySelectorAll(".answer");
answer.forEach((item, index) => {
  item.addEventListener("click", () => {
    item.classList.add("selected");
    let itemNoSelected = [...answer].filter(
      (notSelect) => !notSelect.classList.contains("selected")
    );
    itemNoSelected.forEach((a) => a.parentNode.classList.add("display--none"));
    const answerArea = item.parentNode.parentNode.children[2];
    const answerBox = document.querySelectorAll(".answer__box");
    if (document.querySelector(".answer__content")) {
      answerBox[
        index
      ].innerHTML = `<textarea rows="5" id="answer__content__textarea" name="questionContent"
    placeholder="Nhập câu trả lời" spellcheck="false">${
      document.querySelector(".answer__content").textContent
    }</textarea>
<button class="btn__save_answer btn-answer">Xác nhận</button>`;
    } else {
      answerBox[
        index
      ].innerHTML = `<textarea rows="5" id="answer__content__textarea" name="questionContent"
        placeholder="Nhập câu trả lời" spellcheck="false"></textarea>
    <button class="btn__save_answer btn-answer">Xác nhận</button>`;
    }
    answerArea.appendChild(answerBox[index]);
    const answerConfirm = document.querySelector(".btn__save_answer");
    answerConfirm.addEventListener("click", () => {
      item.classList.remove("selected");
      itemNoSelected.forEach((a) =>
        a.parentNode.classList.remove("display--none")
      );
      if (document.getElementById("answer__content__textarea").value != "")
        answerBox[index].innerHTML = `<div class="answer__content">
        ${document.getElementById("answer__content__textarea").value}
    </div>`;
      else answerBox[index].innerHTML = ``;
    });
  });
});
