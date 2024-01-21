import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/shadow.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Basics',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Basics Series'),
          ),
          body: const Center(child: TutorialPage())),
    );
  }
}

void _buttonFunc() {
  print("Whats upp?");
}

class TutorialPage extends StatelessWidget {
  // stateless means taking a value and show it
  const TutorialPage({super.key}); //this line for taking data from outsource
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const ShadowWidget(
          child: Text(
            'Hello World',
            style: TextStyle(
                fontFamily: "Rubik", fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            _buttonFunc();
          },
          child: const Icon(Icons.favorite),
        ),
      ],
    );
  }
}
