// blocks are called which from page 

import 'package:cloudmonitoring/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'View/ami.dart';
import 'View/cpu_chart.dart';
import 'View/cpu_utilization_chart.dart';
import 'View/disk_operations_chart.dart';
import 'View/disk_space_chart.dart';
import 'View/disk_usage_chart.dart';
import 'View/health_chart.dart';
import 'View/instance_type.dart';
import 'View/instances_table.dart';
import 'View/memory_chart.dart';
import 'View/network_chart.dart';
import 'View/os.dart';
import 'View/zone.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  bool _isDarkTheme = false;

  void _toggleTheme(bool value) {
    setState(() {
      _isDarkTheme = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkTheme ? darkTheme : lightTheme,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cloud Monitoring'),
          actions: [
            Switch(
              value: _isDarkTheme,
              onChanged: _toggleTheme,
              activeColor: Colors.white,
              inactiveThumbColor: Color.fromARGB(255, 103, 99, 99),
              inactiveTrackColor: Color.fromARGB(255, 242, 239, 239),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            bool isMobile = screenWidth < 600;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 4.0 : 8.0),
                child: Column(
                  children: isMobile
                      ? [
                          InstanceType(),
                          SizedBox(height: 8),
                          Zone(),
                          SizedBox(height: 8),
                          AMI(),
                          SizedBox(height: 8),
                          OS(),
                          SizedBox(height: 8),
                          InstancesTable(),
                          SizedBox(height: 8),
                          CpuChart(),
                          SizedBox(height: 8),
                          MemoryChart(),
                          SizedBox(height: 8),
                          HealthChart(),
                          SizedBox(height: 8),
                          DiskSpaceChart(),
                          SizedBox(height: 8),
                          DiskUsageChart(),
                          SizedBox(height: 8),
                          CpuUtilizationChart(),
                          SizedBox(height: 8),
                          NetworkChart(),
                          SizedBox(height: 8),
                          DiskOperationsChart(),
                        ]
                      : [
                          Row(
                            children: [
                              Expanded(child: InstanceType()),
                              SizedBox(width: 8),
                              Expanded(child: Zone()),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(child: AMI()),
                              SizedBox(width: 8),
                              Expanded(child: OS()),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(child: InstancesTable()),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(child: CpuChart()),
                                        SizedBox(width: 8),
                                        Expanded(child: MemoryChart()),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Expanded(child: HealthChart()),
                                        SizedBox(width: 8),
                                        Expanded(child: DiskSpaceChart()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(child: DiskUsageChart()),
                              SizedBox(width: 8),
                              Expanded(child: CpuUtilizationChart()),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(child: NetworkChart()),
                              SizedBox(width: 8),
                              Expanded(child: DiskOperationsChart()),
                            ],
                          ),
                        ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
