class ApiResult{
  List<RecipeModel> recipes;

  ApiResult({required this.recipes});


  factory ApiResult.fromjson(Map<String,dynamic>json){
    List<dynamic> hits= json["hits"];
    List<RecipeModel> recipes = [];
    for(var recipe in hits){
      recipes.add(RecipeModel.fromjson(recipe["recipe"]));
    }
    return ApiResult(recipes: recipes);
  }
  
  
}
class RecipeModel {

  late String label;
  late String image;
  late String dietlabels;

  RecipeModel(
      {required this.label, required this.image, required this.dietlabels});

  factory RecipeModel.fromjson(Map<String,dynamic> json){
    return RecipeModel(label: json['label'] as String,
      image: json['image'] as String,
      dietlabels: json['source'] as String,
    );
  }
}
