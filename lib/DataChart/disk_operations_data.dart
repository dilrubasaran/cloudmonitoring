//disk_operations_data.dart
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:high_chart/high_chart.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class DiskOperationsChart extends StatefulWidget {
  const DiskOperationsChart({Key? key}) : super(key: key);

  @override
  _DiskOperationsChartState createState() => _DiskOperationsChartState();
}

class _DiskOperationsChartState extends State<DiskOperationsChart> {
  Map<String, int> diskData = {
    'Read': 0,
    'Write': 0,
  };
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
      fetchData();
    });
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(Uri.parse('http://www.sm.aeyazilim.com/'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        print('Fetched data: $data'); // Hata ayıklama için

        setState(() {
          diskData.update('Read', (value) => _parseInt(data['read']));
          diskData.update('Write', (value) => _parseInt(data['write']));
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  int _parseInt(dynamic value) {
    if (value is String) {
      return int.tryParse(value) ?? 0; // Eğer string parse edilemezse 0 döndür
    } else if (value is int) {
      return value;
    } else {
      return 0; // Beklenmeyen veri türü için 0 döndür
    }
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
        'categories': diskData.keys.toList(),
        'title': {
          'text': 'Type',
        },
      },
      'yAxis': {
        'min': 0,
        'title': {
          'text': 'Operations',
          'align': 'high',
        },
      },
      'series': [
        {
          'name': 'Operations',
          'data': diskData.values.toList(),
          'colorByPoint': true,
          'showInLegend': false,
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

    return LayoutBuilder(
      builder: (context, constraints) {
        double size = min(constraints.maxWidth, constraints.maxHeight) * 0.5;

        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 128, 124, 124), // Arka plan rengi
            borderRadius: BorderRadius.circular(10), // Border radius 10
          ),
          padding: EdgeInsets.all(8), // İçerik ile sınır arasındaki mesafe
          child: HighCharts(
            data: chartData,
            size: Size(size, size), // Responsive 
          ),
        );
      },
    );
  }
}
