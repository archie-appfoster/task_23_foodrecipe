import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_18/Provider.dart';
import 'package:task_18/service/api.dart';

import 'model/recipemodel.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  late List<RecipeModel> _recipemodel = [];
  late String query = "";
  TextEditingController textcontroller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("App recipe"),
        centerTitle: true,
      ),
      body: Consumer<RecipeProvider>(
        builder: (context,rp,child)
        =>Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: textcontroller,
                //onChanged: (_){getdata();},
                decoration: InputDecoration(

                    hintText: "Enter your ingredients",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 20),
                    border: OutlineInputBorder(),
                    suffixIcon: GestureDetector(
                      onTap: () async {
                        final String q = textcontroller.text.toString();
                        rp.getallrecipe(q);
                      },
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
            if (textcontroller.text.isNotEmpty)
              Expanded(
                // height: 300,
                child: ListView.builder(
                    itemCount: rp.recipemodel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return RecipeCard(
                        title: rp.recipemodel[index].label.toString(),
                        img: rp.recipemodel[index].image.toString(),
                        lab: rp.recipemodel[index].dietlabels.toString(),
                      );
                    }),
              )
            else
              CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }


}

class RecipeCard extends StatelessWidget {
  late String title, img, lab;
  RecipeCard({required this.title, required this.img, required this.lab});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(img),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Container(
              height: 30,
              decoration: BoxDecoration(),
              child: Text(
                lab,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ))
        ],
        alignment: Alignment.center,
      ),
    );
  }
}
