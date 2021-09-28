import 'package:flutter/material.dart';
import 'package:flutter_app/widget_menubar.dart';
import 'package:http/http.dart' as http; //perform http request
import 'dart:convert'; // convert response string to JSON (map)
void main() {
  runApp(const HttpRequestExample());
}

class HttpRequestExample extends StatelessWidget {
  const HttpRequestExample({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter APP',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'HTTP Request:: http.get'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data="";
  String title="";
  performHTTPRequest() async {
    String output="";
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    if (response.statusCode == 200) {
      output=response.body;
      var json=jsonDecode(output);
      setState(() {
        this.data = output;
        this.title= json['title'];
      });
      print(response.body);
    } else {
      throw Exception('Failed to load data');
    }
    return output;
  }

  getHTTPRequestData(){
    performHTTPRequest();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              '::: HTTP Response :::\n',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '$data',
            ),
            Text(
              '\n::: The JSON title attribute :::\n',
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              '$title',
            ),
            TextButton(
              onPressed: () => getHTTPRequestData(),
              child: const Text('GET DATA FROM HTTP REQUEST'),
            ),
          ]
        ),
      ),
    );
  }
}
