import 'package:flutter/material.dart';
import 'library.dart';
import 'searchbar.dart';
import 'bookstats.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes:{
      '/': (context) => LibraryPage(),
      '/SearchBarOP': (context) => SearchBarOP(),
      '/bookstats': (context) => BookStats(),
    },
    debugShowCheckedModeBanner: false,
  ));
}


