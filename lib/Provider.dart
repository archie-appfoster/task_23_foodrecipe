import 'package:flutter/cupertino.dart';
import 'package:task_18/service/api.dart';

import 'model/recipemodel.dart';

class RecipeProvider extends ChangeNotifier{
  List<RecipeModel> _recipemodel = [];

  List <RecipeModel> get recipemodel => _recipemodel;



  Future<List<RecipeModel>> getallrecipe(String query) async{

    ApiResult apiResult = (await RecipeApi().getrecipe(query))!;

      _recipemodel = apiResult.recipes;
      notifyListeners();



    return _recipemodel;



  }

  }
