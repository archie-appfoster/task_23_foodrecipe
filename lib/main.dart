import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:task_18/Provider.dart';
import 'package:task_18/model/recipemodel.dart';
import 'package:task_18/service/api.dart';
import 'package:http/http.dart'as http;


import 'home.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecipeProvider>(
      create :(context) => RecipeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: MyHome(),
      ),
    );
  }
}


