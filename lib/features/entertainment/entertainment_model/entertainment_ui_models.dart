import 'dart:convert';

class PostEUiModel{
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  PostEUiModel({required this.title, required this.description, required this.url, required this.urlToImage});
  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'urlToImage': urlToImage,
      'title': title,
      'description': description,
    };
  }

  factory PostEUiModel.fromMap(Map<String, dynamic> map) {
    return PostEUiModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlToImage: map['urlToImage'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PostEUiModel.fromJson(String source) => PostEUiModel.fromMap(json.decode(source));
}