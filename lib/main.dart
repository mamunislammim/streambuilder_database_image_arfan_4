import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:streambuilder_firebase_database_arfan_4/screen/firebase_data_write_afran_5.dart';
import 'package:streambuilder_firebase_database_arfan_4/screen/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DataSent(),
    );
  }
}
