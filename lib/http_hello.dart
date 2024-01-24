import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpHelloView extends StatefulWidget {
  const HttpHelloView({Key? key}) : super(key: key);

  @override
  State<HttpHelloView> createState() => _HttpHelloViewState();
}

class _HttpHelloViewState extends State<HttpHelloView> {
  late bool isHaveData;
  late String data;

  @override
  void initState() {
    super.initState();
    isHaveData = false;
    data = "";
  }

  Future<void> getApiName() async {
    var response = await http.get(Uri.parse(
        "https://hwasampleapi.firebaseio.com/api/books/0/author.json"));
    var data = response.body;

    data = jsonDecode(data);
    setState(() {
      isHaveData = !isHaveData;
      this.data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    var columnCenter = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isHaveData ? Text(data) : const CircularProgressIndicator(),
          TextButton(
            onPressed: () async {
              const CircularProgressIndicator();
              await getApiName();
            },
            child: const Text('Send Request'),
          )
        ],
      ),
    );
    return Scaffold(
      body: columnCenter,
    );
  }
}
