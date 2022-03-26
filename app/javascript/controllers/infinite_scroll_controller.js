import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["entries", "pagination"]

  initialize() {
    let options = {
      rootMargin: '200px',
    }

    this.intersectionObserver = new IntersectionObserver(entries => this.handleIntersectionEntries(entries), options)
  }

  connect() {
    this.intersectionObserver.observe(this.paginationTarget)
  }

  disconnect() {
    this.intersectionObserver.unobserve(this.paginationTarget)
  }

  handleIntersectionEntries(entries) {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        this.loadMore()
      }
    })
  }

  loadMore() {
    let next_page = this.paginationTarget.querySelector("a[rel='next']")
    console.log(next_page)
    if (next_page == null) { return }
    let url = next_page.href
    fetch(url, {
      headers : { 
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    })
    .then(resp => resp.json())
    .then((data) => {
      this.entriesTarget.insertAdjacentHTML('beforeend', data.entries)
      this.paginationTarget.innerHTML = data.pagination
    })
  }


}