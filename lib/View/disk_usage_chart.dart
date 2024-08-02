//disk usage chart created with bar chart 

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:high_chart/high_chart.dart';
import 'package:http/http.dart' as http;
import '../consts_box.dart';

class DiskUsageChart extends StatefulWidget {
  const DiskUsageChart({Key? key}) : super(key: key);

  @override
  _DiskUsageChartState createState() => _DiskUsageChartState();
}

class _DiskUsageChartState extends State<DiskUsageChart> {
  String chartData = '';
  Timer? timer;

  @override
  void initState() {
    super.initState();
    fetchDiskData();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const duration = Duration(seconds: 2);
    timer = Timer.periodic(duration, (Timer t) => fetchDiskData());
  }

  Future<void> fetchDiskData() async {
    final url = 'https://demo-live-data.highcharts.com/instances.json';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final currentInstance = data[0]; // Varsayılan olarak ilk örneği kullanıyoruz
      final diskSpace = currentInstance['DiskSpace']['RootDisk'];

      // Verileri ve temayı güncelle
      final theme = Theme.of(context);
      final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
      final blockBackgroundColor = theme.cardColor;

      final newChartData = jsonEncode({  
        'chart': {
          'type': 'bar',
          'backgroundColor': colorToHex(blockBackgroundColor),
          'marginRight': 10,
        },
        'title': {
          'text': 'Disk Usage',
          "style": { 
          "color":colorToHex(textColor),
          "text-alig": "left",
          },
        },
        'xAxis': {
          'categories': ['MediaGB', 'RootGB', 'Documents', 'Downloads'],
          'title': {
            'text': null,
          },
          'labels': {
            'style': {
              'color': colorToHex(textColor),
              
            }
          }
        },
        'yAxis': {
          'min': 0,
          'title': {
            'text': 'GB',
            'align': 'high',
            'style': {
              'color': colorToHex(textColor),
            }
          },
          'labels': {
            'style': {
              'color': colorToHex(textColor),
            }
          }
        },
        'series': [
          {
            'name': 'Kullanım',
            'data': [
               {
                'y': diskSpace['MediaGB'],
                'color': '#33a29d',
              },
              {
                'y': diskSpace['RootGB'],
                'color': '#544fc5', 
              },
              {
                'y': diskSpace['Documents'],
                'color': '#fe9d00',
              },
              {
                'y': diskSpace['Downloads'],
                'color': '#fe6a35',
              }
            ],
            'colorByPoint': true,
            'showInLegend': false,
            'dataLabels': {
              'enabled': true,
              'color': colorToHex(textColor),
            }
          },
        ],
        'plotOptions': {
          'series': {
            'animation': {
              'duration': 2000,
            },
            'dataLabels': {
              'color': colorToHex(textColor),
            }
          },
        },
      });

      // Grafik verilerini güncelle
      setState(() {
        chartData = newChartData;
      });
    }
  }

  String colorToHex(Color color) => '#${color.value.toRadixString(16).substring(2).padLeft(6, '0')}';

  @override
  Widget build(BuildContext context) {
    return ConstsBox(
      child: chartData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : HighCharts(
              data: chartData,
              size: Size.infinite,
            ),
    );
  }
}
