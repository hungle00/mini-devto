import { Controller } from "stimulus"

export default class extends Controller {
  // Read more about targets in the Stimulus reference guide: https://stimulusjs.org/reference/targets

  static targets = ["commentList", "commentBody"]

  // The connect lifecycle method runs each time our controller is connected to the DOM

  // Read more about lifecycle methods in the Stimulus reference guide: https://stimulusjs.org/reference/lifecycle-callbacks

  connect() {
    console.log(this.commentBodyTarget)
  }

  createSuccess(event) {
    // This might look a little magical but its just deconstructing the standard rails-ujs event detail

    // Read more here: https://guides.rubyonrails.org/working_with_javascript_in_rails.html#rails-ujs-event-handlers

    const [_data, _status, xhr] = event.detail

    this.commentListTarget.innerHTML = xhr.response + this.commentListTarget.innerHTML
    this.commentBodyTarget.reset()
    //this.commentBodyTarget.value = ''
  }
}