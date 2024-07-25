import 'package:flutter/material.dart';
import 'Theme/theme.dart';
import 'chart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: lightTheme, 
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: ChartPage(),
    );
  }
}
