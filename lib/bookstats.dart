import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:async';



class BookStats extends StatefulWidget {
  const BookStats({Key? key}) : super(key: key);

  @override
  _BookStatsState createState() => _BookStatsState();
}

class _BookStatsState extends State<BookStats> {
  @override
  Widget build(BuildContext context) {
    double rating = 3.0 ;
    double width = MediaQuery. of(context). size. width ;
    double height = MediaQuery. of(context). size. height;
    print(width);
    print(height);
    return Scaffold(
      
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("assets/IT.jpeg"), fit: BoxFit.cover)),
            child: ClipRRect( // make sure we apply clip it properly
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.grey.withOpacity(0.2),
                ),
              ),
            ),
          ),

          SingleChildScrollView(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Padding( padding: EdgeInsets.only(top: 30.0)),

                    ],
                  ),
                  
                  new Row(
                    children: [
                      TextButton.icon(
                        onPressed: (){setState(() {
                        Navigator.popAndPushNamed(context, '/');
                        });},
                        icon: Icon(Icons.arrow_back_ios),
                        label: Text('Library',style: TextStyle(fontSize: 15,),),
                        style: TextButton.styleFrom(primary: Colors.orange),
                      ),
                      SizedBox(
                        height: 60.0,
                        width: 125.0+(393-width).abs(),
                      ),
                      IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.bookmark,color: Colors.red,size: 35,)
                      ),
                      SizedBox(
                        height: 60.0,
                        width: 7.0,
                      ),
                      IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.book,color: Colors.orange,size: 30,)
                      ),
                      SizedBox(
                        height: 60.0,
                        width: 7.0,
                      ),
                      IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.saved_search ,color: Colors.orange,size: 30,)
                      ),
                      SizedBox(
                        height: 60.0,
                        width: 7.0,
                      ),
                    ],
                  ),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/IT.jpeg",)
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                        width: null,
                      ),
                    ]
                  ),
                  
                  new Row(
                    children: [
                      SizedBox(
                        height: 25.0,
                        width: 15.0,
                      ),
                      new Text('Have you read it?',style: TextStyle(color: Colors.grey[50],fontSize: 13.0),),
                      SizedBox(
                        height: 25.0,
                        width: 190.0+(400-width).abs(),
                      ),
                      IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.library_add_check_rounded ,color: Colors.orange,size: 35,)
                      ),
                      SizedBox(
                        height: 25.0,
                        width: 10.0,
                      ),
                    ],
                  ),

                  new Row(
                    children: [
                      SizedBox(
                        height: 25.0,
                        width: 15.0,
                      ),
                      new Text('$rating' ,style: TextStyle(color: Colors.grey[50],fontSize: 23.0),),
                      SizedBox(
                        height: 25.0,
                        width: 7.0,
                      ),
                      new Container(
                        child: RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 30,
                          itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )
                      )
                    ],
                  ),

                  new Row(
                    children: [
                      SizedBox(
                        height: 35.0,
                        width: 15.0,
                      ),
                      Text("Ender's Game",style: TextStyle(color: Colors.grey[50],fontSize: 20.0))
                    ],
                  ),

                  new Row(
                    children: [
                      SizedBox(
                        height: 35.0,
                        width: 15.0,
                      ),
                      Text("Orson Scott Card",style: TextStyle(color: Colors.grey[50],fontSize: 17.0))
                    ],
                  ),

                  new Row(
                    children: [
                      SizedBox(
                        height: 25.0,
                        width: 15.0,
                      ),
                      Text("Fiction",style: TextStyle(color: Colors.grey[50],fontSize: 14.0))
                    ],
                  ),

                  new Row(
                    children: [
                      SizedBox(
                        height: 25.0,
                        width: 15.0,
                      ),
                      Text("Tor Books",style: TextStyle(color: Colors.grey[50],fontSize: 14.0))
                    ],
                  ),

                  new Row(
                    children: [
                      SizedBox(
                        height: 25.0,
                        width: 15.0,
                      ),
                      Text("448 pages",style: TextStyle(color: Colors.grey[50],fontSize: 14.0))
                    ],
                  ),

                  new Row(
                    children: [
                      SizedBox(
                        height: 25.0,
                        width: 15.0,
                      ),
                      Text("October 17, 2017",style: TextStyle(color: Colors.grey[50],fontSize: 14.0))
                    ],
                  ),
                  new Row(
                    children: [
                      SizedBox(
                        height: 25.0,
                        width: 15.0,
                      ),
                      Text('"The classic of modern science fiction"-- ',style: TextStyle(color: Colors.grey[50],fontSize: 14.0))
                    ],
                  ),

                  new Row(
                    children: [
                      SizedBox(
                        height: 5.0,
                        width: 15.0,
                      ),
                      Text('Front cover.',style: TextStyle(color: Colors.grey[50],fontSize: 14.0))
                    ],
                  ),


                  new Row(
                    children: <Widget>[
                      SizedBox(
                        height: 25.0,
                        width: 15.0,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Divider(
                                color: Colors.grey[350],
                                thickness: 1.0,

                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                        width: 15.0,
                      ),
                    ],
                  ),

                  new Row(
                    children: [
                      SizedBox(
                        height: 15.0,
                        width: 15.0,
                      ),
                      Text('Tags', style:TextStyle(color: Colors.grey[50],fontSize: 18.0),),
                    ],
                  ),

                  new Row(
                    children: [
                      SizedBox(
                        height:35.0,
                        width: 10.0,
                      ),
                      Container(
                        height: 25.0,
                        width: 70.0,
                        color: Colors.transparent,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.green[800],
                                borderRadius: BorderRadius.all(Radius.circular(20.0))),
                            child: new Center(
                              child: new Text("Kindle",
                                style: TextStyle(color: Colors.grey[50], fontSize: 18),
                                textAlign: TextAlign.center,),
                            )),
                      ),
                    ],
                  ),
                ]
              )
            ),
          ),
        ],
      ),
    );
  }
}
