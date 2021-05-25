import { Controller } from "stimulus"

export default class extends Controller {

  publish() {
    console.log(this.element)
  }

  unpublish() {
    console.log(this.element)
  }
}