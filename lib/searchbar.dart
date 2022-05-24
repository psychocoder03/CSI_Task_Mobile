import 'package:flutter/material.dart';

class SearchBarOP extends StatefulWidget {
  const SearchBarOP({Key? key}) : super(key: key);

  @override
  _SearchBarOPState createState() => _SearchBarOPState();
}

class _SearchBarOPState extends State<SearchBarOP> {

  Widget appBarTitle = const Text(
    "Search Book Name",
    style: TextStyle(color: Colors.white),
  );
  Icon icon = const Icon(
    Icons.search,
    color: Colors.white,
  );

  Map data = {};
  List searchresult = [] ;
  String searchText = "";
  final globalKey = GlobalKey<ScaffoldState>();
  final TextEditingController controller = TextEditingController();

  List<String> bookNameList = [
    'Harry Potter and the Philosophers Stone',
    'Harry Potter and the Chamber of Secret',
    'Harry Potter and the Prisoner of Azkaban',
    'Harry Potter and the Goblet of Fire',
    'Harry Potter and the Order of Phoenix',
    'Harry Potter and the Half Blood Prince',
    'Harry Potter and the Deathly Hallows',
    'Chanakya Niti',
    'How to Become Great in Business',
    'IT',
    'Sherlock Holmes',
    'The Happiness of Pursuit',
    'The Subtle Art Of Not Giving A Fu*k',
    'Game of Thrones', 'The Alchemist',
  ];

  void searchOperation(String searchText) {
    searchresult.clear();
    for (int i = 0; i < bookNameList.length; i++) {
      String data1 = bookNameList[i] ;
      if (data1.toLowerCase().contains(searchText.toLowerCase())) {
        searchresult.add(data1);
      }
    }
  }

  _SearchBarOPState() {
    controller.addListener(() {
      if (controller.text.isEmpty) {
        setState(() {
          searchText = "";
        });
      } else {
        setState(() {
          searchText = controller.text;
        });
      }
    });
  }

    @override
    Widget build(BuildContext context) {

      return Scaffold(
        key: globalKey,
        appBar: AppBar( backgroundColor: Colors.grey[800],centerTitle: true, title: appBarTitle, actions: <Widget>[
          IconButton(
            icon: icon,
            onPressed: () {
              setState(() {
                if (icon.icon == Icons.search) {
                  icon = const Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  appBarTitle = TextField(
                    controller: controller,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Colors.white)),
                    onChanged: searchOperation,
                  );
                } else {
                  setState(() {
                    controller.clear();
                    searchresult.clear();
                    //Navigator.popAndPushNamed(context,'/');
                  });
                }
              });
            },
          ),
        ]),
        backgroundColor: Colors.grey[800],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: searchresult.isNotEmpty || controller.text.isNotEmpty
                  ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchresult.length,
                    itemBuilder: (BuildContext context, int index) {
                      String listData = searchresult[index];
                      return ListTile(
                        onTap: (){
                          Navigator.pushNamed(context, '/bookstats');
                        },
                        title: Text(
                            listData,
                          style: TextStyle(color: Colors.white)
                        ),
                      );
                    },
              )
                  : ListView.builder(
                    shrinkWrap: true,
                    itemCount: bookNameList.length,
                    itemBuilder: (BuildContext context, int index) {
                      String listData = bookNameList[index];
                      return ListTile(
                        onTap: (){
                          Navigator.pushNamed(context, '/bookstats');
                        },
                        title: Text(
                          listData,
                            style: TextStyle(color: Colors.white)
                        ),
                      );
                    },
              ),
            ),
          ],
        ),
      );
    }

}





