import 'package:flutter/material.dart';
import 'login_screen.dart';
import './main.dart';
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
      body: Container(),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add_comment_rounded),
      ),
    );
  }
}
