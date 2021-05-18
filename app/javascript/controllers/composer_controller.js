import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "tweet", "output" ]

  preview(event) {
    event.preventDefault();
    const content = this.tweetTarget.value;
    console.log(content)
    let preview = this.outputTarget
    fetch('/articles/new/preview', {
      method: "post",
      dataType: "text/plain",
      body: content,
      credentials: "include",
      headers: {
        "X-CSRF-Token": document.querySelector('meta[name=csrf-token]').content
      },
    })
    .then(resp => resp.text())
    .then(data => preview.innerHTML = data)
    //this.outputTarget.innerHTML = content
  }
}
