
import 'package:flutter/cupertino.dart';

import '../models/product.dart';

class ProductListWidget extends StatefulWidget {
  late List<Product> products;


  ProductListWidget(this.products);

  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(context);
  }

  Widget buildProductList(BuildContext context) {
    return ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: ((context, index) {
          return Text(widget.products[index].productName);
    }));
  }
}
