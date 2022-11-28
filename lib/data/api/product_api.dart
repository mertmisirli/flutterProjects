import 'package:http/http.dart' as http;

class ProductApi {
  static Future getProducts(){
    var url = Uri.http("127.0.0.1:3000", "/products");
    return http.get(url);
  }

  static Future getProductsByCategoryId(int categoryId){
    var url = Uri.http("127.0.0.1:3000", "/products", {"categoryId" : categoryId});
    return http.get(url);
  }
}