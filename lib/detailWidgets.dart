import 'package:flutter_web/material.dart';
import 'package:flutter_web.examples.gallery/main.dart';
import 'AccountApp.dart';
import 'photolinks.dart';
import 'cards.dart';

List<BottomNavigationBarItem> bottomBar = [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.black),
            title: Container(height: 0,width: 0)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,color: Colors.black),
            title: Container(height: 0,width: 0)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box,color: Colors.black),
            title: Container(height: 0,width: 0)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,color: Colors.black),
            title: Container(height: 0,width: 0)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box,color: Colors.black),
            title: Container(height: 0,width: 0)
          )
    ]; 

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
        Icon(Icons.photo),
        Text("Posts: 51")
          ],
        )
      ],
    );
  }

Widget smallBuild(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            siteHeading(context),
            searchTitle(),
            trailingSite(context)
          ]
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.directions),
            onPressed: (){}
          )
        ],
      ),
      bottomNavigationBar: bottomBarWidget(context),
        body: Center(child:Container(
          width: 650,
          child:cardListBuilder(context))
    ));
  }

Widget bigBuild(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            siteHeading(context),
            searchTitle(),
            MediaQuery.of(context).size.width>1000?trailingSite(context): IconButton(icon: Icon(Icons.account_circle, color: Colors.black),
              onPressed: (){},
            )
          ],
        )
      ),
      body: Center(child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Expanded(child:Container(

          )),
          Container(
            width: 650,
            margin: EdgeInsets.fromLTRB(0,0,7,0),
            child: cardListBuilder(context),
          ),
          SizedBox(
            width: 350,
            height: 350,
            
            child:Center(child:Container(
              child:Card(
              elevation: 1,  
              margin: EdgeInsets.fromLTRB(7, 0, 7, 0),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                accountHeader(),
                accountDetails()
            ],))
          )
          )
          ),
          Expanded(child: Container())
          ]
        )
      ),
    );
  }

Widget cardListBuilder(BuildContext context){
    return ListView.builder(
          itemCount: photosforCards.length,
          itemBuilder: (context, index){
            return CardData(
              imageUrl: photosforCards[index],
              uploader: artists[index],
              isLiked: false,
              likes: 45
        );
      }
    );
  }

Widget bottomBarWidget(BuildContext context){
   return BottomNavigationBar(
        currentIndex: 2,
        elevation: 0,
        selectedFontSize: 30,
        unselectedFontSize: 30,
        onTap: (index){
          if(index == 4){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountApp()));
          }
        },
        items:bottomBar
    );
}

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
          icon: Icon(Icons.grid_on,color: Colors.black,size: 25),
          title: Text("Posts")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.my_location,color: Colors.black,size: 25),
          title: Text("Tagged")
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.bookmark_border,color: Colors.black,size: 25),
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
      VerticalDivider(),
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
    margin: EdgeInsets.fromLTRB(5,0,5,0),
    width: 250,
    height: 30,
    child: TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(2),
        fillColor: Colors.black,
        icon: Icon(Icons.search),
        hintText: "Search..."
        ),
      ),
  );
}

Widget trailingSite(BuildContext context){
  return Row(children:[
      Container(margin: EdgeInsets.fromLTRB(7,0,7,0), 
        child: IconButton(icon:Icon( Icons.person, size: 35, color: Colors.black,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AccountApp()));
          },
        )
      ), 
      Container(margin: EdgeInsets.all(7), child:Icon(Icons.map,size: 35,color: Colors.black))
      ],
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround);
}