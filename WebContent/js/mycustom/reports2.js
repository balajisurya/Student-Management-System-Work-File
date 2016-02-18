$(function () {
	
    Morris.Bar({
        element: 'graph_bar',
        data: [
            {Year: '2010', TotalAmount: 136},
            {Year: '2011', TotalAmount: 137},
            {Year: '2012', TotalAmount: 275},
            {Year: '2013', TotalAmount: 380},
            {Year: '2014', TotalAmount: 655},
            {Year: '2015', TotalAmount: 275}
        ],
        xkey: 'Year',
        ykeys: ['TotalAmount'],
        labels: ['Fees Collected'],
        barRatio: 0.4,
        barColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
        xLabelAngle: 35,
        hideHover: 'auto'
    });

       Morris.Bar({
        element: 'graphx',
        data: [
            {Years: '2011', Pass:20, Failed:30, Discontinued:2},
            {Years: '2012', Pass:3,  Failed:27, Discontinued:3},
            {Years: '2013', Pass:25,  Failed:25, Discontinued:9},
            {Years: '2014', Pass:49,  Failed:1, Discontinued:3}
           
        ],
        xkey: 'Years',
        ykeys: ['Pass', 'Failed','Discontinued'],
        barColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
        hideHover: 'auto',
        labels: ['PASS', 'FAILED','DISCONTINUED']
    }).on('click', function (i, row) {
        console.log(i, row);
    });



    Morris.Donut({
        element: 'graph_donut',
        data: [
            {label: 'Paid', value: 72},
            {label: 'Pending', value:25}
        ],
        colors: ['#26B99A', '#FF3300', '#ACADAC', '#3498DB'],
        formatter: function (y) {
            return y + "%"
        }
    });
    
    new Morris.Line({
        element: 'graph_line',
        xkey: 'year',
        labels: ['Students Admitted'],
        ykeys: ['value'],
        hideHover: 'auto',
        lineColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
        data: [
            
            {year: '2010', value: 50},
            {year: '2011', value: 80},
            {year: '2012', value: 120},
            {year: '2013', value: 100},
            {year: '2014', value: 80},
            {year: '2015', value: 170}
            
        ]
    });
    
});

var randomScalingFactor = function () {
    return Math.round(Math.random() * 100)
};

var sharePiePolorDoughnutData = [
    {
        value: 150,
        color: "#26B99A",
        highlight: "#34495E",
        label: "Morning Batch"
    },
    {
        value: 70,
        color: "#FF3377",
        highlight: "#34495E",
        label: "Evening Batch"
    },
    {
        value: 10,
        color: "#BDC3C7",
        highlight: "#34495E",
        label: "Distance Education"
    }
];

$(document).ready(function () {
    window.myPie = new Chart(document.getElementById("canvas_pie").getContext("2d")).Pie(sharePiePolorDoughnutData, {
        responsive: true,
        tooltipFillColor: "rgba(51, 51, 51, 0.55)"
    });

});
