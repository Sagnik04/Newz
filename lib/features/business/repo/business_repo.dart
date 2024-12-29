import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:newz_2/features/business/api_service/api_services.dart';
import 'package:newz_2/features/home/api_service/api_services.dart';
import 'package:newz_2/features/home/post_ui_models/posts_ui_models.dart';

import '../business_ui_models/models.dart';
class PostsBRepo{
  static Future<List<PostBUiModel>> fetchpost()async{
    var client = http.Client();

    List<PostBUiModel> posts = [];
    try {
      var response = await client.get(
          Uri.parse('$BusinessApi'));
      if(response.statusCode == 200){


        var jsonResponse = jsonDecode(response.body);

        List<dynamic> result = jsonResponse['articles'];
        for(int i = 0;i<result.length;i++){
          PostBUiModel postB = PostBUiModel.fromMap(result[i] as Map<String,dynamic>);
          posts.add(postB);
        }
      }
      return posts;

    } catch(e){
      log(e.toString());
      return [];

    }
  }
}