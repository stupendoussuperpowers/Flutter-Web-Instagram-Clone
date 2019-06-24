import 'package:flutter_web/material.dart';
import 'package:flutter_web/widgets.dart';

class CardData extends StatefulWidget{
  String imageUrl;
  String uploader;
  int likes;
  bool isLiked;

  CardData({this.imageUrl,this.isLiked, this.likes, this.uploader});
  
  CardDataState createState() => CardDataState(imageUrl: this.imageUrl,
    uploader: this.uploader,
    likes: this.likes,
    isLiked: this.isLiked
  );
}


class CardDataState extends State<CardData>{
  String imageUrl;
  String uploader;
  int likes;
  bool isLiked;

  CardDataState({this.imageUrl,this.isLiked, this.likes, this.uploader});

  Widget uploaderDetails(){
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(child:CircleAvatar(radius: 20, backgroundColor: Colors.cyan),
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        ),
        Container( child:
        Text("${this.uploader}"),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0)),
        Spacer(),
        Container(child:Icon(Icons.more_horiz), margin: EdgeInsets.fromLTRB(0, 10, 10, 0))
      ]
    );
  }

  Widget imageDetails(){
    return Container(
      child:Image.network("${this.imageUrl}", height: 650, width: 650),
    );
  }

  Widget interactBar(){
    return Row(
      children: <Widget>[
        Container(child:IconButton(
          icon:
                Icon(this.isLiked? Icons.favorite: Icons.favorite_border,
          color: this.isLiked?Colors.redAccent:null,
          size: 30,
          ),
          onPressed: (){
            setState(() {
              this.isLiked = !this.isLiked; 
            });
          },
  
        ), margin: EdgeInsets.fromLTRB(7,0,0,7)),
        Container(child:Icon(Icons.chat_bubble_outline, size:30), margin: EdgeInsets.fromLTRB(7,0,7,7)),
        Container(child:Icon(Icons.send, size:30), margin: EdgeInsets.fromLTRB(7,0,7,7))
      ],
    );
  }


  Widget build(BuildContext context){
    return (
      Container(
        width: 650,
        child: Card(
          
          elevation: 1,
          margin: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              uploaderDetails(),
              imageDetails(),
              interactBar()
            ],
          )
        )
      )
    );
  }
}