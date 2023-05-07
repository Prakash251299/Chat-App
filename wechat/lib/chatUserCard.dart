import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'home_screen.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return
    //  ListView.builder(
    //   scrollDirection: Axis.vertical,
    //   itemCount: 10,
    //   itemBuilder: (context,index)=>
        Card(
          margin: EdgeInsets.symmetric(horizontal:mq.width*0.04,vertical:4),
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
          child:InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap:(){
              // print("tapped");
            },
            child: ListTile(
              leading: CircleAvatar(child:Icon(Icons.person)),
              title: Text("ishu"), 
              subtitle: Text("This is a trial"),
              trailing:Text('12:00PM'),
            ),
          ),
        );
      // );
  }
}