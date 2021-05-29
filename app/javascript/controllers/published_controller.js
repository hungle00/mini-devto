import { Controller } from "stimulus"

export default class extends Controller {

  publish(event) {
    const [_data, _status, xhr] = event.detail
    //console.log(xhr.response)
    document.querySelector(".publish").innerHTML += xhr.response
    document.querySelector(".draft").removeChild(this.element)
  }

  unpublish(event) {
    const [_data, _status, xhr] = event.detail
    //console.log(xhr.response)
    document.querySelector(".draft").innerHTML += xhr.response
    document.querySelector(".publish").removeChild(this.element)
  }
}