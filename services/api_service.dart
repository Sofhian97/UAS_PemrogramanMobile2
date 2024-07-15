import 'package:http/http.dart' as http;
import 'dart:convert';

class APIService {
  final String baseUrl = 'http://your_api_url';

  Future<List<Map<String, dynamic>>> fetchTransactions() async {
    final response = await http.get(Uri.parse('$baseUrl/transactions'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => e as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load transactions');
    }
  }
}
