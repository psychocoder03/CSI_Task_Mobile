import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BookList {

  String bookName ;
  String author ;
  String year ;
  String image ;
  int wishList = 0;
  Icon _bookmark = const Icon(Icons.bookmark) ;

  BookList( { required this.bookName ,required this.author , required this.image , required this.year });

}


class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {


  List<BookList> searchList = [];
  List<BookList> booksList = [
    BookList(bookName: 'Harry Potter and the \nPhilosophers Stone', author: 'J.K.Rowling', image: 'assets/HPb1.jpeg', year: '2010'),
    BookList(bookName: 'Harry Potter and the \nChamber of Secret', author: 'J.K.Rowling', image: 'assets/HPb2.jpeg', year: '2011'),
    BookList(bookName: 'Harry Potter and the \nPrisoner of Azkaban', author: 'J.K.Rowling', image: 'assets/HPb3.jpeg', year: '2012'),
    BookList(bookName: 'Harry Potter and the \nGoblet of Fire', author: 'J.K.Rowling', image: 'assets/HPb4.png', year: '2013'),
    BookList(bookName: 'Harry Potter and the \nOrder of Phoenix', author: 'J.K.Rowling', image: 'assets/HPb5.png', year: '2014'),
    BookList(bookName: 'Harry Potter and the \nHalf Blood Prince', author: 'J.K.Rowling', image: 'assets/HPb6.png', year: '2015'),
    BookList(bookName: 'Harry Potter and the \nDeathly Hallows', author: 'J.K.Rowling', image: 'assets/HPb7.jpeg', year: '2016'),
    BookList(bookName: 'Chanakya Niti', author: 'gautam', image: 'assets/CN.jpeg', year: '2017'),
    BookList(bookName: 'How to Become\nGreat in Business', author: 'gautam', image: 'assets/HTBGIB.jpeg', year: '2018'),
    BookList(bookName: 'IT', author: 'gautam', image: 'assets/IT.jpeg', year: '2019'),
    BookList(bookName: 'Sherlock Holmes', author: 'gautam', image: 'assets/SH.jpeg', year: '2020'),
    BookList(bookName: 'The Happiness of \nPursuit', author: 'gautam', image: 'assets/THOP.jpeg', year: '2021'),
    BookList(bookName: 'The Subtle Art Of \nNot Giving A Fu*k', author: 'gautam', image: 'assets/TSAONGAF.png', year: '2021'),
    BookList(bookName: 'Game of Thrones', author: 'gautam', image: 'assets/GOT.jpeg', year: '2021'),
    BookList(bookName: 'The Alchemist', author: 'gautam', image: 'assets/TA.jpeg', year: '2021'),
  ];

  void searchResultRemove(BookList b){
    setState(() {
      for(int i=0 ; i<searchList.length ; i++) {
        if(searchList[i] == b ){
          searchList.remove(b);}
      }
      for(int i=0 ; i<booksList.length ; i++){
        if(booksList[i] == b){
          booksList[i].wishList = 0;
          booksList[i]._bookmark = const Icon(
            Icons.bookmark,
          );
        }
      }
    });
  }

  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search in Library');

  int _selectedIndex = 0;



  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      ' Library',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
    ),
    Text(
      ' Wish List',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28,
      )
    ),
    Text(
      ' Settings',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
        )
    ),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index ;

    });
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      bottomNavigationBar:BottomNavigationBar(
        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Library',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Wishlist',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.red,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        elevation: 20,
      ),

      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Top Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(onPressed: (){} , icon: const Icon(Icons.wifi_protected_setup_sharp),color: Colors.amber,),
                    const SizedBox(width: 15),
                    IconButton(onPressed: (){} , icon: const Icon(Icons.wifi),color: Colors.amber),
                    const SizedBox(width: 220),
                    IconButton(alignment: Alignment.topRight ,onPressed: (){} ,icon: const Icon(Icons.add),color: Colors.amber),
                  ]
            ),

            _widgetOptions.elementAt(_selectedIndex),

            //Search bar
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(10.0))),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 05),
              padding: const EdgeInsets.fromLTRB(10, 0, 100, 0),
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: customIcon,
                      onPressed: (){
                        setState(() {
                            Navigator.pushNamed(context, '/SearchBarOP');
                          });
                        },
                  ),
                  customSearchBar ,
                ],
              ),
            ),


            Flexible(
                child: _selectedIndex==0?
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: booksList.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, '/bookstats');
                      },
                      trailing: IconButton(onPressed: (){
                        setState(() {
                          if(booksList[index].wishList==0)
                          {
                            booksList[index].wishList = 1;
                            booksList[index]._bookmark = const Icon(
                              Icons.bookmark,
                              color: Colors.red,
                            );
                            searchList.add(booksList[index]);
                          }
                          else{
                            booksList[index].wishList = 0;
                            booksList[index]._bookmark = const Icon(
                              Icons.bookmark,
                            );
                            searchResultRemove(booksList[index]);
                          }
                        });
                      },
                        icon: booksList[index]._bookmark,
                      ),
                      title: Card(
                        elevation: 0,
                        child: Row(
                          children: [
                            Image.asset(booksList[index].image,height: 150,width: 90),
                            const SizedBox(width: 10,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    booksList[index].bookName,
                                    style: const TextStyle(
                                      textBaseline: TextBaseline.ideographic,
                                      letterSpacing: 2.0,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                                Text(
                                  booksList[index].author,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },

                ): (_selectedIndex==1?

                ListView.builder(
                  primary: true,
                  //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  //physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: searchList.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      onTap: (){
                        Navigator.pushNamed(context, '/bookstats');
                      },
                      trailing: IconButton(onPressed: (){
                        setState(() {
                          searchList[index].wishList = 0;
                          searchResultRemove(searchList[index]);
                        });
                      },
                        icon: searchList[index]._bookmark,
                      ),
                      title: Card(
                        elevation: 0,
                        child: Row(
                          children: [
                            Image.asset(searchList[index].image,height: 150,width: 90),
                            const SizedBox(width: 10,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    searchList[index].bookName,
                                    style: const TextStyle(
                                      textBaseline: TextBaseline.ideographic,
                                      letterSpacing: 2.0,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                                Text(
                                  searchList[index].author,
                                ),
                              ],
                            ),
                          ],
                        )
                      ),
                    );
                  },
                ): const Text('Settings'))
            )
          ],
        ),
      ),
    );
  }
}

