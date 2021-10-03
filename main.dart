import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(
    )
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var bitcoin, binance, cardano, ethereum, tether, xrp ;

  final TextEditingController t1 = TextEditingController(text: "0");

  void doCalculate (){
    setState((){
      bitcoin = (int.parse(t1.text))/200 ;
      binance = (int.parse(t1.text))/10 ;
      cardano = (int.parse(t1.text))/500 ;
      ethereum = (int.parse(t1.text))/400 ;
      tether = (int.parse(t1.text))/100 ;
      xrp = (int.parse(t1.text))/1 ;
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cryptocurrency Calculator"),
          centerTitle: true,
          backgroundColor: Colors.redAccent[600],
          foregroundColor: Colors.amber[400],
          // titleTextStyle: ,

        ),

        body: Container(
          padding : EdgeInsets.all(4.0),
          child :Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row( //ROW TYPE1
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(

                          child: Text(
                            "                 Cryptocurrency                                ",
                          ),
                      )
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            child: Text(
                              "Value",
                            )
                        )
                    )

                  ]
              ),

              Row( //ROW TYPE1
                  children: [
                    Container(
                      color: Colors.orange,
                      margin: EdgeInsets.all(25.0),
                      child: Image.asset("images/bitcoin.png",
                      ),
                    ),
                    Text('Bitcoin                                  ',textAlign : TextAlign.left),
                    Text("$bitcoin",
                    textAlign: TextAlign.right
                    )
                  ]
              ),
              Row( //ROW TYPE1
                  children: [
                    Container(
                      color: Colors.orange,
                      margin: EdgeInsets.all(25.0),
                      child: Image.asset("images/ethereum.jpg",
                      ),
                    ),
                    Text('Ethereum                            ',textAlign : TextAlign.left),
                    Text("$ethereum",
                        textAlign: TextAlign.right
                    )
                  ]
              ),
              Row( //ROW TYPE1
                  children: [
                    Container(
                      color: Colors.orange,
                      margin: EdgeInsets.all(25.0),
                      child: Image.asset("images/cardano.png",
                      ),
                    ),
                    Text('Cardano                              ',textAlign : TextAlign.left),
                    Text("$cardano",
                        textAlign: TextAlign.right
                    )
                  ]
              ),
              Row( //ROW TYPE1
                  children: [
                    Container(
                      color: Colors.orange,
                      margin: EdgeInsets.all(25.0),
                      child: Image.asset("images/tether.png",
                      ),
                    ),
                    Text('Tether                                  ',textAlign : TextAlign.left),
                    Text("$tether")
                  ]
              ),

              Row( //ROW TYPE1
                  children: [
                    Container(
                      color: Colors.orange,
                      margin: EdgeInsets.all(25.0),
                      child: Image.asset("images/xrp.png",
                      ),
                    ),
                    Text('XRP                                   ',textAlign : TextAlign.left),
                    Text("$xrp",
                        textAlign: TextAlign.right
                    )
                  ]
              ),
              Row( //ROW TYPE1
                  children: [
                    Container(
                      color: Colors.orange,
                      margin: EdgeInsets.all(25.0),
                      child: Image.asset("images/binance.jpg",
                      ),
                    ),
                    Text('Binance                             ',textAlign : TextAlign.left),
                    Text("$binance",
                        textAlign: TextAlign.right
                    )
                  ]
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child : Align(
                      alignment : Alignment.bottomLeft,
                      child : TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Enter Amount in Dollars",
                        ),

                        controller: t1,
                      ),
                    )
                  ),
                  Container(
                    child: ElevatedButton(
                      child: Text("Calculate", style: TextStyle(fontSize: 20),),
                      onPressed: doCalculate,
                    )
                  ),
                ],
              ),
            ]
          )
        )
    );
  }
}

