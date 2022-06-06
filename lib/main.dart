
import 'package:flutter/material.dart';
import 'package:projetfinal/pages/Contact.dart';
import 'dart:async';
import 'package:projetfinal/pages/Login.dart';
import 'package:projetfinal/pages/Accueil.dart';
import 'package:projetfinal/pages/Produits.dart';
import 'package:projetfinal/Product.dart';
import 'package:projetfinal/pages/Produitsdetails.dart';


void main() {
  runApp( const MyApp());
}

const d_red = const Color(0xFFE9717D);
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  get product => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon Site',
      routes: {
        '/' : (context) => Login(),
        '/Accueil' : (context) => Accueil(),
        '/Produits' : (context) => Produits(title: '',),
        '/Produitsdetails' : (context) => Produitsdetails(product: product,),
        '/Contact' : (context) => Contact(),
      },
    );
  }
}

