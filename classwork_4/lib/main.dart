import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'getMovies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies list',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Movies'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // idk
}

class _MyHomePageState extends State<MyHomePage> {
  List<Movies> listofmovies = [];

  @override
  void initState() {
    super.initState();
    // Simulating a data fetch or initialization
    _myMovies();
  }

  void _myMovies() async {
    Uri webUri = Uri.https('jsonplaceholder.typicode.com', '/photos');
    var res = await http.get(webUri);
    if (res.statusCode == 200) {
      var json_res = convert.jsonDecode(res.body) as List<dynamic>;

      setState(() {
        for (var movie in json_res) {
          // print(json_res);
          listofmovies.add(new Movies(movie["id"], movie["title"], movie["url"],
              movie["thumbnailUrl"]));
        }
      });
    } else {
      print('Request failed with status: ${res.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: ListView(
              children: <Widget>[
                for (var movie in listofmovies)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Text(movie.id.toString()),
                        title: Text(movie.title),
                        subtitle: Text(movie.imgURI),
                      ),
                    ),
                  )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
