import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["card"];
  static values = { url: String };

  connect() {
    console.log(this.urlValue)
  }

  show() {
    if(this.hasCardTarget) {
      this.cardTarget.classList.remove("d-none")
    } else {
      fetch(this.urlValue)
      .then(r => r.text())
      .then(html => {
        //console.log(html);
        const fragment = document.createRange().createContextualFragment(html);
        this.element.appendChild(fragment);
      });
    }
  }

  hide() {
    if (this.hasCardTarget) {
      this.cardTarget.classList.add("d-none");
    }
  }

  disconnect() {
    if (this.hasCardTarget) {
      this.cardTarget.remove();
    }
  }
}