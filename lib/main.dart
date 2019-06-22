import 'package:flutter_web/material.dart';
import 'package:flutter_web/rendering.dart';
import 'cards.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart' as Fontnew;


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

/*
      BottomNavigatIcon(Icons.grid_on,color: Colors.black,size: 40),
      Icon(Icons.tag_faces, color: Colors.black,size:40),
      Icon(Icons.bookmark_border, color: Colors.black,size:40) */

Widget accountPageDivider(){
  return Card(
    margin: EdgeInsets.fromLTRB(200, 0, 200, 0),
    elevation: 0,
    child:BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      onTap: (c){
      },
      //mainAxisAlignment: MainAxisAlignment.spaceAround,
      //crossAxisAlignment: CrossAxisAlignment.center,
      items:[
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_on,color: Colors.black,size: 20),
          title: Text("Posts")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.tag_faces,color: Colors.black,size: 20),
          title: Text("Tagged")
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.bookmark_border,color: Colors.black,size: 20),
          title: Text("Saved")
        )
    ],)
  );
}

Widget accountPageHeader(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children:[
      Hero(
      tag:"account-header",
      child:Container(child:CircleAvatar(radius: 75,backgroundColor: Colors.blue),margin: EdgeInsets.all(15),),
      ),
      Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("the_imperpetual_machine"),
          Text("133 posts 70 followers 524 following"),          
          Text("Sanchit"),
          Text("appendix")]))]
      );
}

Widget siteHeading(BuildContext context){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => MyApp()
        ));
      },
      child:Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Container(child:Image.network("http://www.transparentpng.com/thumb/logo-instagram/g3tCwR-logo-instagram-high-quality-pictures.png",height: 40,width: 40,),
        margin: EdgeInsets.fromLTRB(7, 0, 7,0),
      ),
      VerticalDivider(width: 15,),
      Container(child:Text("Instagram", style: TextStyle(color: Colors.black),
      ),
      margin: EdgeInsets.fromLTRB(7, 0,0,0),
      )
        ]
        )
      );
  }

Widget searchTitle(){
  return Container(
    width: 250,
    child: TextFormField(
      decoration: InputDecoration(
        
        fillColor: Colors.black,
        icon: Icon(Icons.search),
        hintText: "Search"
      ),
    )
  );
}

Widget trailingSite(BuildContext context){
  return Row(children:[
      Container(margin: EdgeInsets.all(7), 
        child: IconButton(icon:Icon(Icons.account_circle, size: 35, color: Colors.black,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountApp()));
          },
        )
      ), 
      Container(margin: EdgeInsets.all(7), child:Icon(Icons.explore,size: 35,color: Colors.black))
      ],
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround);
}

class MyHomePage extends StatelessWidget{

  TextStyle _font = TextStyle(color: Colors.black, fontSize: 15, );
  
  Widget accountHeader(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Hero(
        tag:"account-header",
        child:CircleAvatar(radius: 35,backgroundColor: Colors.blueGrey,foregroundColor: Colors.brown),
        ),Column(children: <Widget>[
          Text("the_imperpetual_machine"),
          Text("Sanchit")
        ],)
      ],
    );
  }

  Widget accountDetails(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      Column(children: <Widget>[
        Icon(Icons.person_outline),
        Text("Followers: 127"),
        ],
      ),
      Column(children: <Widget>[
        Icon(Icons.photo_album),
        Text("Posts: 51")
          ],
        )
      ],
    );
  }


  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            siteHeading(context),
            searchTitle(),
            trailingSite(context)
          ],
        )
      ),
      body: Center(child:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Container(width: 200
          ),
          Container(
            width: 650,
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 9,
              itemBuilder: (context, index){
                return CardData(
                  imageUrl: "https://www.designboom.com/wp-content/gallery/square-flower-leaf-art-baku-maeda/g2.jpg",
                  uploader: "this_test_machine",
                  isLiked: false,
                  likes: 45,
                );
              },
            ),
          ),
          SizedBox(
            width: 350,
            height: 350,
            child:Container(
              child:Card(
              elevation: 0.5,  
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                accountHeader(),
                accountDetails()
            ],)
          )
          )
          )
          ]
        )
      )
    );
  }
}

class AccountApp extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            siteHeading(context),
            searchTitle(),
            trailingSite(context)
          ],
        )
      ),
      body: Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          accountPageHeader(),
          accountPageDivider(),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.fromLTRB(200,10,200,0),
              mainAxisSpacing: 50,
              crossAxisCount: 3,
              children: List.generate(14, (index){
                return SizedBox(
                  child: Container(child:Image.network("https://www.designboom.com/wp-content/gallery/square-flower-leaf-art-baku-maeda/g2.jpg", height:10, width:10),
                    padding: EdgeInsets.fromLTRB(10,10,10,0),
                    width: 50,
                    ),
                  );
              })
            )
          )
          ],
      )
    ));
    }
}