import 'dart:convert';

class PostTUiModel{
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  PostTUiModel({required this.title, required this.description, required this.url, required this.urlToImage});


  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'urlToImage': urlToImage,
      'title': title,
      'description': description,
    };
  }

  factory PostTUiModel.fromMap(Map<String, dynamic> map) {
    return PostTUiModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostTUiModel.fromJson(String source) => PostTUiModel.fromMap(json.decode(source));
}