import 'package:flutter_web/material.dart';
import 'photolinks.dart';
import 'detailWidgets.dart';

class AccountApp extends StatelessWidget{
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: screenWidth<1000? bottomBarWidget(context):null,
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
              padding: EdgeInsets.fromLTRB(screenWidth/10,10,screenWidth/10,0),
              crossAxisCount: 3,
              children: List.generate(7, (index){
                return SizedBox(
                  child: Container(child:Image.network("${photosforCards[index]}"),
                    padding: EdgeInsets.fromLTRB(10,10,10,0),
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