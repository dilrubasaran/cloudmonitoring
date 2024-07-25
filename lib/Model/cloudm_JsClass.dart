import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchData() async {
  final response = await http.get(Uri.parse('https:///demo-live-data.highcharts.com'));

  if (response.statusCode == 200) {
    final List<dynamic> responseData = json.decode(response.body);
    // Assuming the first element of the list contains the needed data
    if (responseData.isNotEmpty && responseData[0] is Map<String, dynamic>) {
      return responseData[0] as Map<String, dynamic>;
    } else {
      throw Exception('Unexpected data format');
    }
  } else {
    throw Exception('Failed to load data');
  }
}
