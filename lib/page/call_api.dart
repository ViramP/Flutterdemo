import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/post.dart';

import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final response =
  await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}
class CallAPI extends StatefulWidget{

  final post = fetchPost();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return new CallAPIState();
  }


}
class CallAPIState extends State<CallAPI>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Post>(
          future: widget.post,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.body);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      ),
    );

  }

}