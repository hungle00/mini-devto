import { Controller } from "stimulus"

export default class extends Controller {
  static values = { url: String };

  connect() {
    console.log(this.urlValue)

    fetch(this.urlValue)
    .then(resp => resp.json())
    .then(articles => {
      articles.forEach(article => {
        const template = `<li><a href="/articles/${article['slug']}">${article['title']}</a></li>`;
        const fragment =  document.createRange().createContextualFragment(template)
        this.element.appendChild(fragment);
      });
    })
  }
}
