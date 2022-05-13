import 'package:boilerplate/app/infrastructures/app_component.dart';
import 'package:boilerplate/app/ui/pages/home/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // runApp(const MyApp());

  await Future.wait([
    dotenv.load(fileName: '.env'),
  ]);

  Future.wait([AppComponent.init()]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home App',
      home: HomePage(),
    );
  }
}
