import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Movies {
  int id = 4;
  String title = "";
  String imgURI = "";
  String thumbnailURI = "";

  Movies(int id, String title, String imgURI, String thumbnailURI) {
    this.id = id;
    this.title = title;
    this.imgURI = imgURI;
    this.thumbnailURI = thumbnailURI;
  }

  Future<void> getMovies(String url) async {
    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      var json_res = convert.jsonDecode(res.body) as Map<String, dynamic>;
      this.id = json_res["id"];
      this.title = json_res["title"];
      this.imgURI = json_res["imgURI"];
      this.thumbnailURI = json_res["thumbnailURI"];
      print('hello world');
    } else {
      print('Request failed with status: ${res.statusCode}.');
    }
  }
}
