import 'dart:developer';

import 'package:flutter/material.dart';
import 'login_screen.dart';
import './main.dart';
import 'chatUserCard.dart';
import 'apis.dart';
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(onPressed: (){
            Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage(title: "title")));
          },
          icon:Icon(Icons.home)),
        actions:[
          IconButton(onPressed: (){},icon:Icon(Icons.search)),
          IconButton(onPressed: (){},icon:Icon(Icons.more_vert)),
        ],
        title: Text(widget.title),
      ),
      body: 
      StreamBuilder(
        stream: APIs.firestore.collection('users').snapshots(),
        builder: (context, snapshot){ 
          final list = [];
          if(snapshot.hasData){
            final data = snapshot.data?.docs;
            for(var i in data!){
              log('${i.data}');
              list.add(i.data()['name']);
            }
          }
          return
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 10,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>
            // Text('Name: ${list[index]}'),
            ChatUserCard(),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Contacts',
        child: const Icon(Icons.add_comment_rounded),
      ),
    );
  }
}
