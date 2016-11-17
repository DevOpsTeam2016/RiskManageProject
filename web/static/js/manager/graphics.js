/**
 * Created by zsmy on 16/11/17.
 */
// 路径配置
require.config({
    paths: {
        echarts: 'http://echarts.baidu.com/build/dist'
    }
});

// 使用
require(
    [
        'echarts',
        'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
    ],
    function (ec) {
        // 基于准备好的dom，初始化echarts图表
        var myChart = ec.init(document.getElementById('main'));

//                var option = {
//                    tooltip: {
//                        show: true
//                    },
//                    legend: {
//                        data:['销量']
//                    },
//                    xAxis : [
//                        {
//                            type : 'category',
//                            data : ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
//                        }
//                    ],
//                    yAxis : [
//                        {
//                            type : 'value'
//                        }
//                    ],
//                    series : [
//                        {
//                            "name":"销量",
//                            "type":"bar",
//                            "data":[5, 20, 40, 10, 10, 20]
//                        }
//                    ]
//                };

        var option = {
            title : {
                text: '风险统计图',
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['被识别最多的风险','演变成问题最多的风险']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : ['风险1','风险1','风险1','风险1','风险1','风险1','风险1','风险1','风险1','风险1','风险1','风险1']
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'被识别最多的风险',
                    type:'bar',
                    data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],

                },
                {
                    name:'演变成问题最多的风险',
                    type:'bar',
                    data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
                }
            ]
        };

        // 为echarts对象加载数据
        myChart.setOption(option);
    }
);