import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:practice_swap/models/screenings_models.dart';
import 'package:practice_swap/models/trending_models.dart';

class Api {
  Future<List<Trending>> fetchTrendingScreenings() async {
    final url = Uri.parse(
        'https://screenwave.co.uk/api/v2/dev/test/trending?see-all=true');
    final response = await http.get(
      url,
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      List<dynamic> results = data['results'];
      return results.map((json) => Trending.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch screenings');
    }
  }

  Future<List<Screenings>> fetchScreenings() async {
    final url = Uri.parse(
        'https://screenwave.co.uk/api/v2/dev/test/screening?see-all=true');
    final response = await http.get(
      url,
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['data'];
      List<dynamic> results = data['results'];
      return results.map((json) => Screenings.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch screenings');
    }
  }
}
