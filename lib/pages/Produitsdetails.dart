
// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_const

import 'package:projetfinal/Product.dart';
import 'package:flutter/material.dart';
import 'package:projetfinal/main.dart';

class Produitsdetails extends StatelessWidget {
  final Product product;
  const Produitsdetails({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final levelIndicator = Container(
      child: Container(
        child: LinearProgressIndicator(
            backgroundColor: d_red,
            value: product.indicatorValue,
            valueColor: const AlwaysStoppedAnimation(Colors.blue)
          ),
        ),
      );
      final coursePrice = Container(
        padding: const EdgeInsets.all(7.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5.0)),
        child: Text(
          "\$${product.price}",
          style: const TextStyle(color: Colors.white),
        ),
      );

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 120.0),
        const Icon(
          Icons.directions_car,
          color: Colors.white,
          size: 40.0,
        ),
        Container(
          width: 90.0,
          child: const Divider(color: Colors.green),
        ),
        const SizedBox(height: 10.0),
        Text(
          product.title,
          style: const TextStyle(color: Colors.white, fontSize: 30.0),
        ),
        const SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(flex: 1, child: levelIndicator),
            Expanded(
              flex: 6,
              child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  product.level,
                  style: const TextStyle(color: Colors.white),
                )
              )
            ),
            Expanded(flex: 1, child: coursePrice)
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 10.0),
          height: MediaQuery.of(context).size.height * 0.5,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: const AssetImage("assets/images/img2.jpg"),
              fit: BoxFit.cover,
            ),
          )
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: d_red),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      product.content,
      style: const TextStyle(fontSize: 18.0),
    );
    final readButton = Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      width: MediaQuery.of(context).size.width,
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () => {},
        color: d_red,
        child: const Text("Acheter cette Robe", style: TextStyle(color: Colors.white)),
      )
    );
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}