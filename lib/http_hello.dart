import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpHelloView extends StatefulWidget {
  const HttpHelloView({Key? key}) : super(key: key);

  @override
  State<HttpHelloView> createState() => _HttpHelloViewState();
}

class _HttpHelloViewState extends State<HttpHelloView> {
  late Future<http.Response> apiResponse;

  @override
  void initState() {
    super.initState();
    apiResponse = getApiName();
  }

  Future<http.Response> getApiName() async {
    return await http.get(Uri.parse(
        "https://hwasampleapi.firebaseio.com/api/books/0/author.json"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: apiResponse,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                var responseData = jsonDecode(snapshot.data!.body);
                return Text(responseData.toString());
              } else {
                return const Text("API'den veri alınamadı. Hata olabilir.");
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Text("API isteği sırasında bir hata oluştu.");
            }
          },
        ),
      ),
    );
  }
}
