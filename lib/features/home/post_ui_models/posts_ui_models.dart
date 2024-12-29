import 'dart:convert';

class PostUiModel{
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  PostUiModel({required this.title, required this.description, required this.url, required this.urlToImage});


  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'urlToImage': urlToImage,
      'title': title,
      'description': description,
    };
  }

  factory PostUiModel.fromMap(Map<String, dynamic> map) {
    return PostUiModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostUiModel.fromJson(String source) => PostUiModel.fromMap(json.decode(source));
}