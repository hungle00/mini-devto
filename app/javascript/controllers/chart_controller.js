import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from "chart.js"

export default class extends Controller {
  static targets = [ "output" ]
  canvasContext() { return this.outputTarget.getContext('2d'); }

  connect() {
    console.log(this.outputTarget.dataset)
    Chart.register(...registerables);
    new Chart(this.canvasContext(), {
      // The type of chart we want to create
      type: 'line',
      // The data for our dataset
      data: {
        labels: JSON.parse(this.outputTarget.dataset.labels),
        datasets: [{
          label: 'Page Views',
          backgroundColor: 'rgb(255, 99, 132)',
          borderColor: 'rgb(255, 99, 132)',
          data: JSON.parse(this.outputTarget.dataset.views),
        }]
      },
    })
  }
}
