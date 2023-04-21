import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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

class _MyHomePageState extends State<MyHomePage> {



  Widget imgBox(var name,var data, var img,var contWidth){
    return 
    Stack(
      alignment: Alignment.bottomRight,
      children: [
    Container(
      // color:Colors.red,
      margin:EdgeInsets.only(top:MediaQuery.of(context).size.height<490?490*4/100:MediaQuery.of(context).size.height*4/100),
      // height:MediaQuery.of(context).size.height<490?490*14/100:MediaQuery.of(context).size.height*14/100,
      // width:MediaQuery.of(context).size.width<260?260:MediaQuery.of(context).size.width,
      width:contWidth,
      child:
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
    Container(
      decoration: BoxDecoration(
      color:Colors.white,
        // borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(-10)),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),topRight: Radius.circular(-100)),
      ),
      height:40,
      width:100,
      child: Center(child:Text("+126 Colleges")),
    ),
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
        print(val);
      },
    );
  }

  Widget footer(){
    var ic = [Icons.home,Icons.saved_search,Icons.save_as_outlined,Icons.account_circle];
    var icName = ['Search','Save','Saved','Account'];
    return 
    Row(children: [
      for(int i=0;i<4;i++)...[
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
          
        ]),


        // ),
      );
  }
}