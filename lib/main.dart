import 'package:flutter_web/material.dart';
import 'package:flutter_web/rendering.dart';
import 'detailWidgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Roboto",
        backgroundColor: Color.fromRGBO(250, 250, 250, 1)
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{  
  
  Widget build(BuildContext context){
    return MediaQuery.of(context).size.width>1000?bigBuild(context):smallBuild(context);
  }
}
