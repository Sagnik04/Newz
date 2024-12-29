import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:newz_2/features/business/api_service/api_services.dart';
import 'package:newz_2/features/home/api_service/api_services.dart';
import 'package:newz_2/features/home/post_ui_models/posts_ui_models.dart';
class PostsRepo{
  static Future<List<PostUiModel>> fetchpost()async{
    var client = http.Client();

    List<PostUiModel> posts = [];
    try {
      var response = await client.get(
          Uri.parse('$NewzApi'));
      if(response.statusCode == 200){


        var jsonResponse = jsonDecode(response.body);

        List<dynamic> result = jsonResponse['articles'];
        for(int i = 0;i<result.length;i++){
          PostUiModel post = PostUiModel.fromMap(result[i] as Map<String,dynamic>);
          posts.add(post);
        }
      }
      return posts;

    } catch(e){
        log(e.toString());
        return [];

    }
  }
}