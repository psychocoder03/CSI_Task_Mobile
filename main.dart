import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'nomics.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cryptocurrency Calculator",
      home: Scaffold(
        appBar: AppBar(title: const Text("Cryptocurrency Calculator")),
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {

  const MyWidget({Key? key}) : super(key: key);

  @override

  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {


  String bitcoin = "0" , binance = "0", xrp = "0", ethereum = "0", tether = "0", cardano = "0", hex = "0", dogecoin = "0";
  int maxFractionDigits = 5;

  final TextEditingController t1 = TextEditingController(text: "0");

  void doCalculate() {
    updateCurrencies();
    setState(() {
      bitcoin = (int.parse(t1.text) / getCurrencyValue("BTC")).toStringAsFixed(maxFractionDigits);
      binance = (int.parse(t1.text) / getCurrencyValue("BNB")).toStringAsFixed(maxFractionDigits);
      hex = (int.parse(t1.text) / getCurrencyValue("HEX")).toStringAsFixed(maxFractionDigits);
      cardano = (int.parse(t1.text) / getCurrencyValue("ADA")).toStringAsFixed(maxFractionDigits);
      ethereum = (int.parse(t1.text) / getCurrencyValue("ETH")).toStringAsFixed(maxFractionDigits);
      tether = (int.parse(t1.text) / getCurrencyValue("USDT")).toStringAsFixed(maxFractionDigits);
      xrp = (int.parse(t1.text) / getCurrencyValue("XRP")).toStringAsFixed(maxFractionDigits);
      dogecoin = (int.parse(t1.text) / getCurrencyValue("DOGE")).toStringAsFixed(maxFractionDigits);
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(

        child: DataTable(
          columnSpacing: 0,
          columns: <DataColumn>[
            DataColumn(
              label: Container(
                width: width * .25,
                child: Text(
                  'Symbol',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Container(
                width: width * .35,
                child: Text(
                  'Crypto Name',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              )
            ),
            DataColumn(
              label: Container(
                width: width * .35,
                child: Text(
                  'Number',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              )
            ),
          ],
          rows:  <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(
                    Image.asset("images/binance.jpg", height: 45)),
                DataCell(Text('Binance')),
                DataCell(Text("$binance")),
              ],
            ),

            DataRow(
              cells: <DataCell>[
                DataCell(
                    Image.asset("images/bitcoin.png", height: 45)),
                DataCell(Text('Bitcoin')),
                DataCell(Text("$bitcoin")),
              ],
            ),

            DataRow(
              cells: <DataCell>[
                DataCell(
                    Image.asset("images/cardano.png", height: 45)),
                DataCell(Text('Cardano')),
                DataCell(Text("$cardano")),
              ],
            ),

            DataRow(
              cells: <DataCell>[
                DataCell(
                    Image.asset("images/hex.png", height: 45)),
                DataCell(Text('HEX')),
                DataCell(Text("$hex")),
              ],
            ),

            DataRow(
              cells: <DataCell>[
                DataCell(Image.asset(
                    "images/ethereum.jpg", height: 45)),
                DataCell(Text('Ethereum')),
                DataCell(Text("$ethereum")),
              ],
            ),

            DataRow(
              cells: <DataCell>[
                DataCell(
                    Image.asset("images/tether.png", height: 45)),
                DataCell(Text('Tether')),
                DataCell(Text("$tether")),
              ],
            ),

            DataRow(
              cells: <DataCell>[
                DataCell(
                    Image.asset("images/xrp.png", height: 45)),
                DataCell(Text('XRP')),
                DataCell(Text("$xrp")),
              ],
            ),

            /*DataRow(
              cells: <DataCell>[
                DataCell(
                    Image.asset("images/dogecoin.png", height: 45)),
                DataCell(Text('Dogecoin')),
                DataCell(Text("$dogecoin")),
              ],
            ),*/

            DataRow(
              cells: <DataCell>[
                DataCell(
                    Image.asset("images/dollar.jpg", height: 45)),
                DataCell(TextField(
                  inputFormatters: [
                    WhitelistingTextInputFormatter(RegExp(r"^\d{0,10}"))
                  ],
                  decoration: InputDecoration(
                    hintText: "Enter Amount in Dollars",),
                  controller: t1,
                )
                ),

                DataCell(ElevatedButton(
                    child: Text("Calculate", style: TextStyle(fontSize: 20),),
                    onPressed: doCalculate )),

              ],
            ),
          ],
        )
    );
  }
}

