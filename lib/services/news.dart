

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:news_app/models/article_model.dart';

// class News{
//   List<ArticleModel> news = [];

//   Future<void> getNews()async{
//     String url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=14806c3a30114cdeb717d32b112e3d02";
    
//     var response = await http.get(Uri.parse(url));

//     var jsonData = jsonDecode(response.body);

//     if(jsonData['status' ] == 'ok'){
//       jsonData['articles'].forEach((element) {
//         if(element ['urlToImage'] != null && element ['description'] != null) {
//           ArticleModel  articleModel = ArticleModel(
//             urlToImage : element["urlToImage"],
//             desc: element["description"],
//             title: element["title"],
//           );
//           news.add(articleModel);
//         }
//       });

//     }
//   }

// }

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:news_app/models/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=14806c3a30114cdeb717d32b112e3d02"
    );

    final resp = await http.get(url);
    if (resp.statusCode != 200) {
      throw Exception("HTTP ${resp.statusCode}: ${resp.reasonPhrase}");
    }

    final Map<String, dynamic> jsonData = jsonDecode(resp.body);
    if (jsonData['status'] != 'ok') {
      throw Exception("API error: ${jsonData['message'] ?? 'unknown'}");
    }

    final articlesJson = jsonData['articles'] as List;
    news = articlesJson
      .where((e) => e['urlToImage'] != null && e['description'] != null)
      .map((e) => ArticleModel(
            urlToImage: e['urlToImage'],
            desc: e['description'],
            title: e['title'],
            url: e['url'],
          ))
      .toList();
  }
}

