// disk operations chart created with coulmn chart

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:high_chart/high_chart.dart';
import 'package:http/http.dart' as http;

import '../consts_box.dart';

class DiskOperationsChart extends StatefulWidget {
  const DiskOperationsChart({Key? key}) : super(key: key);

  @override
  _DiskOperationsChartState createState() => _DiskOperationsChartState();
}

class _DiskOperationsChartState extends State<DiskOperationsChart> {
  String chartData = '';
  Timer? timer;

  @override
  void initState() {
    super.initState();
    fetchDiskOperationsData();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    const duration = Duration(seconds: 2);
    timer = Timer.periodic(duration, (Timer t) => fetchDiskOperationsData());
  }

  Future<void> fetchDiskOperationsData() async {
    final url = 'https://demo-live-data.highcharts.com/instance-details.json';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final currentInstance = data[0];
      final diskDetails = currentInstance['Details'];

      final theme = Theme.of(context);
      final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
      final blockBackgroundColor = theme.cardColor;

      final newChartData = jsonEncode({
        'chart': {
          'type': 'column',
          'backgroundColor': colorToHex(blockBackgroundColor),
        },
        'title': {
          'text': 'Disk Operations',
          'style': {
            'color': colorToHex(textColor),
          },
        },
        'xAxis': {
          'type': 'datetime',
          'title': {
            'text': 'Time',
            'style': {
              'color': colorToHex(textColor),
            },
          },
          'labels': {
            'style': {
              'color': colorToHex(textColor),
            },
          },
        },
        'yAxis': {
          'title': {
            'text': 'Operations',
            'style': {
              'color': colorToHex(textColor),
            },
          },
          'labels': {
            'style': {
              'color': colorToHex(textColor),
            },
          },
        },
        'legend': {
          'itemStyle': {
            'color': colorToHex(textColor), 
          },
        },
        'series': [
          {
            'name': 'Read',
            'data': diskDetails.map((data) => [data['timestamp'], data['readOpt']]).toList(),
            'color': '#33a29d',
          },
          {
            'name': 'Write',
            'data': diskDetails.map((data) => [data['timestamp'], data['writeOpt']]).toList(),
            'color': '#544fc5', 
          },
        ],
        'plotOptions': {
          'series': {
            'animation': {
              'duration': 2000,
            },
          },
        },
      });

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
