import 'package:flutter/material.dart';
import 'package:sqf_demo_project/controller/home_page_controller.dart';
import 'package:sqf_demo_project/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HomePageController.initDb();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
