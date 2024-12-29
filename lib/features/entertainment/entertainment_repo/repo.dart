import 'dart:convert';
import 'dart:developer';

import 'package:newz_2/features/entertainment/entertainment_api_service/api_services.dart';
import 'package:newz_2/features/entertainment/entertainment_model/entertainment_ui_models.dart';
import 'package:http/http.dart' as http;
class PostERepo{
  static Future<List<PostEUiModel>> fetchpost() async {
    List<PostEUiModel> posts = [];
    var client = http.Client();

    try {
      var response = await client.get(
          Uri.parse('$EntertainmentApi'));
      if(response.statusCode == 200){


        var jsonResponse = jsonDecode(response.body);

        List<dynamic> result = jsonResponse['articles'];
        for(int i = 0;i<result.length;i++){
          PostEUiModel post = PostEUiModel.fromMap(result[i] as Map<String,dynamic>);
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