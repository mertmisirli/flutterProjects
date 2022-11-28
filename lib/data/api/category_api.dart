
import 'package:http/http.dart' as http;

class CategoryApi {

  static Future getCategories() {
    var url = Uri.http("127.0.0.1:3000", "/categories");

    return http.get(url);
  }

}