import 'dart:convert';

import 'package:http/http.dart';
import 'package:task_18/model/recipemodel.dart';
import 'package:http/http.dart'as http;

class RecipeApi {
  late String query;
  get err => null;
  //late List<RecipeModel> data = [];

  //late List<String> data;
  Future <ApiResult>? getrecipe(String query) async {

    var Url = Uri.parse(
        "https://api.edamam.com/search?q=$query&app_id=91ab3bd2&app_key=140880fb359b458f78b06da74852e4c0");
    Response response = await http.get(Url);
    Map<String,dynamic> data = jsonDecode(response.body);
    print(data);
    ApiResult apiResult = ApiResult.fromjson(data);
    return apiResult;



    }


  }
