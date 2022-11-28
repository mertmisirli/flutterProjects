

import 'dart:convert';

import 'package:api_usage/data/api/category_api.dart';
import 'package:api_usage/data/api/product_api.dart';
import 'package:api_usage/models/category.dart';
import 'package:api_usage/models/product.dart';
import 'package:api_usage/widgets/product_list_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> categories = <Category>[];
  List<Widget> categoryWidgets = [];

  List<Product> products = <Product>[];


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
          ProductListWidget(products),
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
        getProductsByCategoryId(category);
    }, child: Text(category.categoryName));
  }

  void getProductsByCategoryId(Category category) {
    ProductApi.getProductsByCategoryId(category.id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.products = list.map((product) =>Product.fromJson(product)).toList();
      });
    });
  }


}
