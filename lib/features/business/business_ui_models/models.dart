import 'dart:convert';

class PostBUiModel{
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  PostBUiModel({required this.title, required this.description, required this.url, required this.urlToImage});


  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'urlToImage': urlToImage,
      'title': title,
      'description': description,
    };
  }

  factory PostBUiModel.fromMap(Map<String, dynamic> map) {
    return PostBUiModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostBUiModel.fromJson(String source) => PostBUiModel.fromMap(json.decode(source));
}