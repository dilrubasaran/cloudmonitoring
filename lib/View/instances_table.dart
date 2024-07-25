
import 'package:flutter/material.dart';

class InstancesTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Tema renkleri
    Color backgroundColor = theme.cardColor;
    Color textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
  

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Instances", style: TextStyle(color: textColor)),
          DataTable(
            columns: [
              DataColumn(label: Text('ID', style: TextStyle(color: textColor))),
              DataColumn(label: Text('Type', style: TextStyle(color: textColor))),
              DataColumn(label: Text('State', style: TextStyle(color: textColor))),
              DataColumn(label: Text('Public IP', style: TextStyle(color: textColor))),
              DataColumn(label: Text('Health', style: TextStyle(color: textColor))),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('i-0abcdef1234', style: TextStyle(color: textColor))),
                DataCell(Text('t2.micro', style: TextStyle(color: textColor))),
                DataCell(Text('running', style: TextStyle(color: textColor))),
                DataCell(Text('54.123.45.67', style: TextStyle(color: textColor))),
                DataCell(Icon(Icons.check_circle, color: Colors.green)),
              ]),
              DataRow(cells: [
                DataCell(Text('i-1a2b3c4d5e', style: TextStyle(color: textColor))),
                DataCell(Text('t3.small', style: TextStyle(color: textColor))),
                DataCell(Text('running', style: TextStyle(color: textColor))),
                DataCell(Text('354.123.45.6', style: TextStyle(color: textColor))),
                DataCell(Icon(Icons.warning, color: Colors.orange)),
              ]),
              DataRow(cells: [
                DataCell(Text('i-9876543210', style: TextStyle(color: textColor))),
                DataCell(Text('m5.large', style: TextStyle(color: textColor))),
                DataCell(Text('stopped', style: TextStyle(color: textColor))),
                DataCell(Text('54.321.67.89', style: TextStyle(color: textColor))),
                DataCell(Icon(Icons.error, color: Colors.red)),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
