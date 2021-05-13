const Chart = require('chart.js');

document.addEventListener("DOMContentLoaded", (event) => {
    //var ctx = document.getElementById('myChart').getContext('2d');
    var ctx = document.getElementById('page-views')
    //debugger
    var chart = new Chart(ctx, {
        // The type of chart we want to create
        type: 'line',
        // The data for our dataset
        data: {
            labels: JSON.parse(ctx.dataset.labels),
            datasets: [{
                label: 'Page Views',
                backgroundColor: 'rgb(255, 99, 132)',
                borderColor: 'rgb(255, 99, 132)',
                data: JSON.parse(ctx.dataset.views),
            }]
        },
    });

    var ctx = document.getElementById('uniq-page-views')
    //debugger
    var chart = new Chart(ctx, {
        // The type of chart we want to create
        type: 'line',
        // The data for our dataset
        data: {
            labels: JSON.parse(ctx.dataset.labels),
            datasets: [{
                label: 'Unique Page Views',
                backgroundColor: 'rgb(255, 99, 132)',
                borderColor: 'rgb(255, 99, 132)',
                data: JSON.parse(ctx.dataset.views),
            }]
        },
    });
})