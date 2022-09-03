import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Images").snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
              ),
            );
          } else {
            return GridView.builder(
                itemCount: snapshot.data.docs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot data = snapshot.data.docs[index];
                  return GridTile(
                      child: Card(
                        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15),side: BorderSide(color: Colors.lightGreenAccent,width: 3)),
                          color: Colors.amberAccent,
                          shadowColor: Colors.amber,
                          surfaceTintColor: Colors.blue,
                          margin: EdgeInsets.all(3),
                          child: Image.network(
                            data["img"],
                            scale: .5,
                            fit: BoxFit.cover,
                          )));
                });
          }
        },
      )),
    );
  }
}
