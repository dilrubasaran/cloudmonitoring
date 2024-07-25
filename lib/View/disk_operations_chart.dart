import 'dart:async';
import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:high_chart/high_chart.dart';

import '../consts_box.dart';

class DiskOperationsChart extends StatefulWidget {
  const DiskOperationsChart({Key? key}) : super(key: key);

  @override
  _DiskOperationsChartState createState() => _DiskOperationsChartState();
}

class _DiskOperationsChartState extends State<DiskOperationsChart> {
  List<Map<String, dynamic>> diskOperationsData = [];
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
      int read = random.nextInt(100);
      int write = random.nextInt(100);

      setState(() {
        var currentTime = DateTime.now().millisecondsSinceEpoch;
        diskOperationsData.add({
          'time': currentTime,
          'read': read,
          'write': write,
        });

        // Limit the length of the data list
        if (diskOperationsData.length > 20) {
          diskOperationsData.removeAt(0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String chartData = jsonEncode({
      'chart': {
        'type': 'column',
        'backgroundColor': 'transparent',
      },
      'title': {
        'text': 'Disk Operations',
      },
      'xAxis': {
        'type': 'datetime',
        'title': {
          'text': 'Time',
        },
      },
      'yAxis': {
        'title': {
          'text': 'Operations',
        },
      },
      'series': [
        {
          'name': 'Read',
          'data': diskOperationsData.map((data) => [data['time'], data['read']]).toList(),
        },
        {
          'name': 'Write',
          'data': diskOperationsData.map((data) => [data['time'], data['write']]).toList(),
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

    return ConstsBox(
      child: HighCharts(
        data: chartData,
        size: Size.infinite, // Use responsive size from ResponsiveBox
      ),
    );
  }
}
