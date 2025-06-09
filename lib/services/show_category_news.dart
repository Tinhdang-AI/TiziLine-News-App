import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/show_category.dart';

class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];

  Future<void> getCategoryNews(String category) async {
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=14806c3a30114cdeb717d32b112e3d02");

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("HTTP ${response.statusCode}: ${response.reasonPhrase}");
    }

    final jsonData = jsonDecode(response.body);
    if (jsonData['status'] != 'ok') {
      throw Exception("API error: ${jsonData['message'] ?? 'unknown'}");
    }

    final articlesJson = jsonData['articles'] as List;
    categories = articlesJson
        .where((e) => e['urlToImage'] != null && e['description'] != null)
        .map((e) => ShowCategoryModel(
              title: e['title'],
              desc: e['description'],
              urlToImage: e['urlToImage'],
              url: e['url'],
            ))
        .toList();
  }
}
