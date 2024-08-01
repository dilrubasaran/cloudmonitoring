import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:high_chart/high_chart.dart';

import '../consts_box.dart';

class NetworkChart extends StatefulWidget {
  const NetworkChart({Key? key}) : super(key: key);

  @override
  _NetworkChartState createState() => _NetworkChartState();
}

class _NetworkChartState extends State<NetworkChart> {
  List<Map<String, dynamic>> networkInData = [];
  List<Map<String, dynamic>> networkOutData = [];
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const duration = Duration(seconds: 2);
    timer = Timer.periodic(duration, (Timer t) {
      var random = Random();
      var currentTime = DateTime.now().millisecondsSinceEpoch;

      setState(() {
        // Yeni veri ekle
        networkInData.add({
          'x': currentTime,
          'y': random.nextInt(1000),
        });

        networkOutData.add({
          'x': currentTime,
          'y': random.nextInt(1000),
        });

        // Sadece son 20 değeri tutmak için eski verileri kaldır
        if (networkInData.length > 20) {
          networkInData.removeAt(0);
        }

        if (networkOutData.length > 20) {
          networkOutData.removeAt(0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String chartData = '''
    {
      "chart": {
        "type": "line",
        "animation": true,
        "marginRight": 10
      },
      "title": {
        "text": "Network Usage"
      },
      "xAxis": {
        "type": "datetime",
        "tickPixelInterval": 150,
        "tickPixelInterval": 150,
        "tickAmount": 20
      },
      "yAxis": {
        "title": {
          "text": "Bytes"
        },
        "plotLines": [{
          "value": 0,
          "width": 1,
          "color": "#808080"
        }]
      },
      "tooltip": {
        "formatter": function() {
          return '<b>' + this.series.name + '</b><br/>' +
          Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) + '<br/>' +
          Highcharts.numberFormat(this.y, 2);
        }
      },
      "legend": {
        "enabled": true
      },
      "exporting": {
        "enabled": false
      },
      "series": [{
        "name": "Network In",
        "data": ${jsonEncode(networkInData)},
        "color": "#33a29d",
        "animation": {
          "duration": 2000
        }
      }, {
        "name": "Network Out",
        "data": ${jsonEncode(networkOutData)},
        "color": "#544fc5",
        "animation": {
          "duration": 2000
        }
      }],
      "plotOptions": {
        "series": {
          "animation": {
            "duration": 2000
          }
        }
      }
    }
    ''';

     return ConstsBox(
      child: HighCharts(
        data: chartData,
        size: Size.infinite, // Use responsive size from ResponsiveBox
      ),
    );
  }
}
