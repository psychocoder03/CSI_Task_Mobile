import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

Map<String, Album> albumMap = HashMap();

Future<List<Album>> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://api.nomics.com/v1/currencies/ticker?key=005e96472ca8c534f3ef3c77cf49d0453ec40097&ids=BTC,BNB,ADA,ETH,USDT,XRP,DOGE,HEX&interval=1d&per-page=100&page=1'));

  if (response.statusCode == 200) {
    print(response.body);
    Iterable l = json.decode(response.body);
    List<Album> albumList = List<Album>.from(l.map((model)=> Album.fromJson(model)));
    return albumList;
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final String id;
  final double price;

  Album({
    required this.id,
    required this.price
  });

  factory Album.fromJson(json) {
    return Album(
      id: json['id'],
      price: double.parse(json['price'])
    );
  }
}

updateCurrencies() {
  Future<List<Album>> albumListFuture = fetchAlbum();
  albumListFuture.then((albumList) => {
    albumList.forEach((album) { albumMap[album.id] = album; })
  });
}



double getCurrencyValue(String id) {
  return albumMap[id]!.price;
}