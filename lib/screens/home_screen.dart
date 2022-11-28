

import 'dart:convert';

import 'package:api_usage/data/api/category_api.dart';
import 'package:api_usage/models/category.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> categories = <Category>[];
  List<Widget> categoryWidgets = [];


  @override
  void initState() {
    // TODO: implement initState
    getCategoriesFromApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categoryWidgets,
            ),
          ),
          Text("Merhaba Dünya"),
        ],
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        this.categories = list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for(int i=0; i<categories.length; i++){
      categoryWidgets.add(createWidget(categories[i]));
    }

    return categoryWidgets;
  }

  Widget createWidget(Category category) {
    return ElevatedButton(onPressed: (){

    }, child: Text(category.categoryName));
  }
}
