import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:streambuilder_firebase_database_arfan_4/screen/home_page.dart';

class DataSent extends StatefulWidget {
  const DataSent({Key? key}) : super(key: key);

  @override
  State<DataSent> createState() => _DataSentState();
}

class _DataSentState extends State<DataSent> {
  Future<void> _sentData() async {
    final db = FirebaseFirestore.instance.collection("Users").add({
      "Name": "Mamun",
      "roll": "102614",
      "dep": "COM",
      "mobile": 01761810531.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  _sentData();
                },
                child: Text("Data Sent")),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomepage()));
                },
                child: Text("View Image")),
          )
        ],
      ),
    );
  }
}
