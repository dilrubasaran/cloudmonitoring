import 'package:flutter/material.dart';

class InstancesTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columnSpacing: isMobile ? 15 : 30,
              columns: [
                DataColumn(
                  label: Container(
                    width: isMobile ? 60: null,
                    child: Text('ID', style: TextStyle(color: textColor)),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: isMobile ? 60: null,
                    child: Text('Type', style: TextStyle(color: textColor)),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: isMobile ? 60: null,
                    child: Text('State', style: TextStyle(color: textColor)),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: isMobile ? 60: null,
                    child: Text('Public IP', style: TextStyle(color: textColor)),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: isMobile ? 60 : null,
                    child: Text('Health', style: TextStyle(color: textColor)),
                  ),
                ),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Container(
                    width: isMobile ? 60: null,
                    child: Text('i-0abcdef1234567890', style: TextStyle(color: textColor)),
                  )),
                  DataCell(Container(
                    width: isMobile ? 60: null,
                    child: Text('t2.micro', style: TextStyle(color: textColor)),
                  )),
                  DataCell(Container(
                    width: isMobile ? 60 : null,
                    child: Text('running', style: TextStyle(color: textColor)),
                  )),
                  DataCell(Container(
                    width: isMobile ? 60 : null,
                    child: Text('54.123.45.67', style: TextStyle(color: textColor)),
                  )),
                  DataCell(Icon(Icons.check_circle, color: Colors.green)),
                ]),
                DataRow(cells: [
                  DataCell(Container(
                    width: isMobile ? 60 : null,
                    child: Text('i-1a2b3c4d5e6f78901', style: TextStyle(color: textColor)),
                  )),
                  DataCell(Container(
                    width: isMobile ? 60 : null,
                    child: Text('t3.small', style: TextStyle(color: textColor)),
                  )),
                  DataCell(Container(
                    width: isMobile ? 60 : null,
                    child: Text('running', style: TextStyle(color: textColor)),
                  )),
                  DataCell(Container(
                    width: isMobile ? 60 : null,
                    child: Text('354.123.45.67', style: TextStyle(color: textColor)),
                  )),
                  DataCell(Icon(Icons.warning, color: Colors.orange)),
                ]),
                DataRow(cells: [
                  DataCell(Container(
                    width: isMobile ? 60 : null,
                    child: Text('i-9876543210abcdef0', style: TextStyle(color: textColor)),
                  )),
                  DataCell(Container(
                    width: isMobile ? 60 : null,
                    child: Text('m5.large', style: TextStyle(color: textColor)),
                  )),
                  DataCell(Container(
                    width: isMobile ? 60 : null,
                    child: Text('stopped', style: TextStyle(color: textColor)),
                  )),
                  DataCell(Container(
                    width: isMobile ? 60 : null,
                    child: Text('54.321.67.89', style: TextStyle(color: textColor)),
                  )),
                  DataCell(Icon(Icons.error, color: Colors.red)),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
