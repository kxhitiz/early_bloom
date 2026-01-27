import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from "chart.js"

Chart.register(...registerables)

export default class extends Controller {
  static values = {
    labels: Array,
    users: Array,
    posts: Array,
    comments: Array
  }

  connect() {
    this.renderChart()
  }

  renderChart() {
    const ctx = this.element.getContext("2d")

    new Chart(ctx, {
      type: "line",
      data: {
        labels: this.labelsValue,
        datasets: [
          {
            label: "Users",
            data: this.usersValue,
            borderColor: "#6366f1",
            backgroundColor: "rgba(99, 102, 241, 0.1)",
            borderWidth: 2,
            tension: 0.3,
            fill: true
          },
          {
            label: "Posts",
            data: this.postsValue,
            borderColor: "#10b981",
            backgroundColor: "rgba(16, 185, 129, 0.1)",
            borderWidth: 2,
            tension: 0.3,
            fill: true
          },
          {
            label: "Comments",
            data: this.commentsValue,
            borderColor: "#f59e0b",
            backgroundColor: "rgba(245, 158, 11, 0.1)",
            borderWidth: 2,
            tension: 0.3,
            fill: true
          }
        ]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
        interaction: {
          intersect: false,
          mode: "index"
        },
        plugins: {
          legend: {
            position: "top",
            labels: {
              usePointStyle: true,
              padding: 20
            }
          }
        },
        scales: {
          x: {
            grid: {
              display: false
            }
          },
          y: {
            beginAtZero: true,
            ticks: {
              stepSize: 1
            }
          }
        }
      }
    })
  }
}
