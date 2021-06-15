import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ["commentList", "commentBody"]

  connect() {
    //console.log(this.commentBodyTarget)
  }

  createSuccess(event) {
    // Read more here: https://guides.rubyonrails.org/working_with_javascript_in_rails.html#rails-ujs-event-handlers

    const [_data, _status, xhr] = event.detail

    this.commentListTarget.innerHTML = xhr.response + this.commentListTarget.innerHTML
    this.commentBodyTarget.reset()
    //this.commentBodyTarget.value = ''
  }
}