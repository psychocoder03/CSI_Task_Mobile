import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class BookStats extends StatefulWidget {
  const BookStats({Key? key}) : super(key: key);

  @override
  _BookStatsState createState() => _BookStatsState();
}

class _BookStatsState extends State<BookStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Book Stats"),
        centerTitle: true,
        elevation: 0.0,
        leading: Row(
          children: [
            IconButton(
              onPressed: (){
                setState(() {
                  Navigator.popAndPushNamed(context,'/');
                });

              },
             icon: Icon(Icons.arrow_back_ios),
            ),

      ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/IT.jpeg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.grey.withOpacity(0.1),
                    BlendMode.darken
                )
            ),
          ),
        child: Center(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Text(''),
                expandedHeight: 350.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network("https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.none,
                    alignment: Alignment.topCenter,
                    height: 90,
                    width: 45,),
                ),
              ),
              SliverFillRemaining(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text(
                          "Have you read it?",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),

                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text(
                          "Have you read it?",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text(
                          "Book's Name",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text(
                          "Author's Name",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text(
                          "Type of Book",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text(
                          "Tor Books",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text(
                          "No. of Pages",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text(
                          "Date ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Container(
                        child: Text(
                          "Should be left",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      )
    );
  }
}