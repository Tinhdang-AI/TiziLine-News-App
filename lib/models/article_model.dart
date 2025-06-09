// class ArticleModel {
//    String? title;
//    String? desc;
//    String? urlToImage;

//    ArticleModel({this.desc, this.title, this.urlToImage});
// }

class ArticleModel {
  final String? title;
  final String? desc;
  final String? urlToImage;
  final String? url;


  ArticleModel({this.title, this.desc, this.urlToImage, this.url});

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'] as String?,
      desc: json['description'] as String?,
      urlToImage: json['urlToImage'] as String?,
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': desc,
      'urlToImage': urlToImage,

    };
  }
}
