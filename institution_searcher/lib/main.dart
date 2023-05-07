import 'package:flutter/material.dart';
// import 'dart:ui' as ui;
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class MyPainter extends CustomClipper<Path>{
// class MyPainter extends CustomPainter{
  @override
  @override
  Path getClip(Size size){
    Path path = Path();
    path.moveTo(size.width,0);
    path.lineTo(0,size.height);
    // path.lineTo(0,0);
    // path.lineTo(size.width,0);
    final firstStart1 = Offset(size.width/5,size.height);
    final firstEnd1 = Offset(size.width/2.25,size.height-50.0);
    // final firstEnd = Offset(30,size.height-50.0);
    path.quadraticBezierTo(firstStart1.dy,firstStart1.dx,firstEnd1.dy,firstEnd1.dx);


    path.moveTo(size.width,0);
    path.lineTo(0,size.height);
    // path.lineTo(0,0);
    // path.lineTo(size.width,0);
    // final firstStart = Offset(size.width/5,size.height);
    // final firstEnd = Offset(size.width/2.25,size.height-50.0);
    final firstStart = Offset(size.width/10,size.height);
    final firstEnd = Offset(size.width/5,size.height-50.0);
    // final firstEnd = Offset(30,size.height-50.0);
    path.quadraticBezierTo(firstStart.dx,firstStart.dy,firstEnd.dx,firstEnd.dy);
    // path.quadraticBezierTo(firstEnd.dx,firstEnd.dy,firstStart.dx,firstStart.dy);
    // path.lineTo(size.width,size.height);
    // path.quadraticBezierTo(0,size.height,0,0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper)=>true;
}

class _MyHomePageState extends State<MyHomePage> {
  var imgTapped = 0,i=0;

  Widget popUpOptions(var contWidth){
    return 
    Container(
      // color: Colors.brown,
      width:contWidth,
      child:
    Column(children:[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              Text("adfsa"),
              Spacer(),
              Icon(Icons.add),
          ]),
          // SizedBox(height: 100,),
            ])
            );
  }

  Widget popUp(var contWidth){
    return 
    Container(
      padding: EdgeInsets.only(top:100),
      child:
    Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
    Container(
      decoration: BoxDecoration(
        color:Colors.yellow,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
      ),
      padding: EdgeInsets.only(top:MediaQuery.of(context).size.width<260?260*4/100:MediaQuery.of(context).size.width*4/100,left:MediaQuery.of(context).size.width<260?260*4/100:MediaQuery.of(context).size.width*4/100,right:MediaQuery.of(context).size.width<260?260*4/100:MediaQuery.of(context).size.width*4/100
      ),
      height: MediaQuery.of(context).size.height<490?490/2:MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width<260?260:MediaQuery.of(context).size.width,
      child: 
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            child:SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: 
            Stack(
              alignment: Alignment.topCenter,

              children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:
                Container(
                  margin: EdgeInsets.only(top:30),
                  child: 
              Column(children: [
            for(i=0;i<18;i++)...[
              popUpOptions(contWidth),
            ],
              ]),
              ),
            ),

            // Stack(
            //   alignment: Alignment.topLeft,
            //   // mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            Container(
              // Visibility(),
              width:contWidth,
              height: 30,
              decoration: BoxDecoration(
                color:Colors.yellow,
                border: Border(bottom: BorderSide(width: 2,color:Colors.black))
              ),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                    Text("Sort by"),

                    // Divider(thickness: 2,color: Colors.black,),
                  ]),
              ),

            // ]),

            ]),
          ),
        ),
      ]),
    ),
    ]),
    );
  }


  Widget imgBox(var name,var data, var img,var contWidth){
    return Column(

      children: [
    Stack(
      alignment: Alignment.bottomRight,
      children: [
        GestureDetector(child: 
    Container(
      // color:Colors.red,
      margin:EdgeInsets.only(top:MediaQuery.of(context).size.height<490?490*4/100:MediaQuery.of(context).size.height*4/100),
      // height:MediaQuery.of(context).size.height<490?490*14/100:MediaQuery.of(context).size.height*14/100,
      // width:MediaQuery.of(context).size.width<260?260:MediaQuery.of(context).size.width,
      width:contWidth,
      child: 
    //   Text("kdsfk"),
    // ),
      // Center(child: Text("jshdk"),),
      // decoration:BoxDecoration(
      //   image:DecorationImage(
      //       image:new NetworkImage(
      //         img[0],
      //       ),
      //     )
      //   ),
      // ),
      // Image(image:
      // AssetImage


      
      ClipRRect(
        // decoration: BoxDecoration(
        //   color:Colors.pink,
          borderRadius: BorderRadius.circular(30),
        // ),
        child:
      Image.network
      // (img,fit: BoxFit.fill,height:MediaQuery.of(context).size.height<490?490*14/100:MediaQuery.of(context).size.height*14/100),
      (img,fit: BoxFit.fill
      // height:MediaQuery.of(context).size.height<490?490*14/100:MediaQuery.of(context).size.height*14/100),
      ),
      ),

    ),
    onTap:(){
      setState(() {
        if(imgTapped==0){
          imgTapped = 1;
        }else{
          imgTapped = 0;
        }
      });
    }
    ),


    // Column(
    //   mainAxisAlignment: MainAxisAlignment.end,
    //   // crossAxisAlignment: CrossAxisAlignment.end,
    //   children: [
    //     Container(child:
    //       Text("ksdhfk"),
    //     ),
    // // Text("jahsdkslkjdlkasjdjasljdlsad"),

    // ],),


    // CustomPaint(
    //   size:Size(300,300),
    //   painter:MyPainter(),
    // ),
  

    // ClipPath(
    //   clipper:MyPainter(),
    //   child:Container(
    //     // margin: EdgeInsets.only(right: 100),
    //     height: 30,
    //     width:125,
    //     // width:30,
    //     decoration: BoxDecoration(
    //       color:Colors.green,
    //       borderRadius: BorderRadius.only(topRight: Radius.circular(10)),
    //     ),
    //   ),
    // ),


    // Container(
    //   child: Text("jdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfl"),
    // ),
    Container(
      decoration: BoxDecoration(
      color:Colors.white,
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(-10)),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
      ),
      height:40,
      width:100,
      child: Center(child:Text("+126 Colleges")),
    ),



    ]),
    // Flexible(child:
    //   // margin:EdgeInsets.only(top:MediaQuery.of(context).size.height<490?490*4/100:MediaQuery.of(context).size.height*4/100),
    //   // direction: Axis.horizontal,
    //   // children: [
    //     Text("jdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfljdsfl"),
    //   // ],
    //   // ),
    // ),
    ]);
    
  }
  var tap=0;
  Widget footerOptions(var i,var icName,var val){
    // var tap=0;
    return 
    GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Icon(i,color: tap==val?Colors.white:Colors.white54,size:MediaQuery.of(context).size.width<260?260*6/100:MediaQuery.of(context).size.width>600?600*6/100:MediaQuery.of(context).size.width*6/100,),
        Text(icName,style:TextStyle(fontSize:MediaQuery.of(context).size.width<260?260*3/100:MediaQuery.of(context).size.width>600?600*3/100:MediaQuery.of(context).size.width*3/100,color: val==tap?Colors.white:Colors.white54)),
          SizedBox(
            // height:1,
          width:30,
          child:
          // Stack(children: [
          //   if(val==tap)
            // Divider(color: Colors.black,thickness: 1,),
            Divider(color: tap==val?Colors.white:Colors.blue[900],thickness: 1,),
          // ],)
          ),
        
      ],),
      // child: Icon(i),
      onTap: (){
        setState((){
          tap = val;
        });
        // print(val);
      },
    );
  }

  Widget footer(){
    var ic = [Icons.home,Icons.saved_search,Icons.save_as_outlined,Icons.account_circle];
    var icName = ['Search','Save','Saved','Account'];
    return 
    Row(children: [
      for(i=0;i<4;i++)...[
        Spacer(),
        footerOptions(ic[i],icName[i],i),
        // Divider(color:Colors.red),
        Spacer(),
      ],
    ],);
  }


  @override
  Widget build(BuildContext context) {
    var contWidth=MediaQuery.of(context).size.width<260?260*80/100:MediaQuery.of(context).size.width>700?700*80/100:MediaQuery.of(context).size.width*80/100;
    var contHeight = MediaQuery.of(context).size.height<490?490*25/100:MediaQuery.of(context).size.height*25/100;
    var name = ["Top colleges","Top schools","Exams"];
    var data = ["","",""];
    var img = ['images/collegeImages.jpg','images/schoolImages.jpg','images/ExamImages.jpg'];
    return Scaffold(
      body: 
      GestureDetector(child: 
        Stack(
          alignment:Alignment.bottomCenter,
          children: [
        Container(
          // height:MediaQuery.of(context).size.height-50,
          margin:EdgeInsets.only(bottom:80),
          child:
        ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:


            Column(
              // mainAxisAlignment:MainAxisAlignment.center,
              children: [
              Container(
                decoration: BoxDecoration(
                              // color:Colors.red,
                  color:Colors.black,
                  // color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight: Radius.circular(30)),
                ),
                width:MediaQuery.of(context).size.width<260?260:MediaQuery.of(context).size.width,
                height: contHeight,
                child:Container(
                  width:contWidth,
                  margin: EdgeInsets.only(left:MediaQuery.of(context).size.width<260?260*10/100:MediaQuery.of(context).size.width*10/100,right:MediaQuery.of(context).size.width<260?260*10/100:MediaQuery.of(context).size.width*10/100),
                  color:Colors.amber,
                  child:Center(child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                    Container(
                      color: Colors.green,
                      // width: contWidth*80/100,
                      width: contWidth,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:MainAxisAlignment.center,
                        children: [
                          // Container(
                          // child: Stack(children: [
                            Row(children:[
                              Text("Find your own way",style:TextStyle(fontSize:contWidth>580?(580*96/100)*6/100:(contWidth)*6/100,fontWeight:FontWeight.bold)),
                              Spacer(),
                              Icon(Icons.menu),
                            ]),
                            SizedBox(height:contWidth>580?(580*80/100)*1/100:(contWidth)*1/100),
                            Text("Search in 600 colleges around",style:TextStyle(fontSize:contWidth>580?(580*96/100)*3/100:(contWidth)*3/100,fontWeight:FontWeight.bold)),
                        //   ]),
                        // ),
                        // Spacer(),
                        SizedBox(height:20),
                        Row(children:[

                        // ]),
                        Container(
                          decoration: BoxDecoration(
                            color:Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          // width: contWidth,
                          width: (contWidth*50/100),
                          height: contHeight*20/100,
                        ),
                        // SizedBox(width:5),
                        Spacer(),
                        Container(
                            decoration: BoxDecoration(
                              // color:Colors.red,
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            width: (contHeight*20/100),
                            height: (contHeight*20/100),
                            child:Icon(Icons.mic,size:contHeight*15/100),
                          ),
                        ]),
                      ],),
                    ),
                  ]),
                  ),
                ),
              ),

              imgBox(name,data,img[0],contWidth),
              imgBox(name,data,img[1],contWidth),
              imgBox(name,data,img[2],contWidth),
              Container(
                height: 10,
                // child: ,
              ),
              // footer(),
            ]),
          ),),
        ),


        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
          Container(
            height:80,
            color:Colors.blue[900],
            // color:Colors.white,
            width:MediaQuery.of(context).size.width<260?260:MediaQuery.of(context).size.width,
            // child:Text("dhfjaljdajsdlhajdiajodja;osjd;sajdoasjodas"),
            child:footer(),
          ),
        ),

          // ]),)),

          if(imgTapped==1)...[
            popUp(contWidth),
          ]
          
        ]),
        onTap:(){
          setState(() {
            imgTapped = 0;
          });
        }
        ),
      );
  }
}