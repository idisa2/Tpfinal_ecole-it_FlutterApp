// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:projetfinal/Product.dart';
import 'package:flutter/material.dart';
import 'package:projetfinal/main.dart';
import 'package:projetfinal/pages/Produitsdetails.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_new
    return new MaterialApp(
      title: 'test test',
      theme: ThemeData(
          primaryColor: Color.fromARGB(253, 226, 228, 231), fontFamily: 'Raleway'
          ),
      home: const Produits(title: 'Liste de Robes'),
      // home: DetailPage(),
    );
  }
}

class Produits extends StatefulWidget {
  const Produits({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ProduitsState createState() => _ProduitsState();
}

class _ProduitsState extends State<Produits> {
  late List products;

  @override
  void initState() {
    products = getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Product product) => ListTile(
      contentPadding:
        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 12.0),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: 1.0, color: Colors.white24)
            )
          ),
          child: Icon(Icons.autorenew, color: Colors.white),
          ),
          title: Text(
            product.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: LinearProgressIndicator(
                    backgroundColor: d_red,
                    value: product.indicatorValue,
                    valueColor: AlwaysStoppedAnimation(Colors.blue)
                  ),
                )
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(product.level,
                    style: TextStyle(color: Colors.white)
                  )
                ),
              )
            ],
          ),
          trailing:Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Produitsdetails(product: product)
              )
            );
          },
        );
        Card makeCard(Product lesson) => Card(
          elevation: 8.0,
          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: makeListTile(lesson),
          ),
        );
        final makeBody = Container(
          // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return makeCard(products[index]);
            },
          ),
        );

    
    

    return Scaffold(
      backgroundColor: d_red,
      body: makeBody,
      
    );
  }
}

List getProducts() {
  return [
    Product(
      
        title: "Robe Rouge",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 200,
        content:
          "Est dolor corrupti At accusantium quae in numquam laboriosam aut sunt praesentium qui nobis voluptas. Ut odio praesentium tempora minus aut consequatur sint est quisquam beatae 33 galisum voluptas. Quo nemo fugit ad quae est minima aliquid non totam tempora et dolores debitis. Rem necessitatibus quasi aut omnis repellendus aut natus dolor."),
    Product(
        title: "Robe Verte",
        level: "Beginner",
        indicatorValue: 0.33,
        price: 500,
        content:
          "Est dolor corrupti At accusantium quae in numquam laboriosam aut sunt praesentium qui nobis voluptas. Ut odio praesentium tempora minus aut consequatur sint est quisquam beatae 33 galisum voluptas. Quo nemo fugit ad quae est minima aliquid non totam tempora et dolores debitis. Rem necessitatibus quasi aut omnis repellendus aut natus dolor."),
    Product(
        title: "Robe Blanche",
        level: "Intermidiate",
        indicatorValue: 0.66,
        price: 300,
        content:
          "Est dolor corrupti At accusantium quae in numquam laboriosam aut sunt praesentium qui nobis voluptas. Ut odio praesentium tempora minus aut consequatur sint est quisquam beatae 33 galisum voluptas. Quo nemo fugit ad quae est minima aliquid non totam tempora et dolores debitis. Rem necessitatibus quasi aut omnis repellendus aut natus dolor."),
    Product(
        title: "Robe Rose",
        level: "Intermidiate",
        indicatorValue: 0.66,
        price: 300,
        content:
          "Est dolor corrupti At accusantium quae in numquam laboriosam aut sunt praesentium qui nobis voluptas. Ut odio praesentium tempora minus aut consequatur sint est quisquam beatae 33 galisum voluptas. Quo nemo fugit ad quae est minima aliquid non totam tempora et dolores debitis. Rem necessitatibus quasi aut omnis repellendus aut natus dolor."),
    Product(
        title: "Robe Violette",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 500,
        content:
          "Est dolor corrupti At accusantium quae in numquam laboriosam aut sunt praesentium qui nobis voluptas. Ut odio praesentium tempora minus aut consequatur sint est quisquam beatae 33 galisum voluptas. Quo nemo fugit ad quae est minima aliquid non totam tempora et dolores debitis. Rem necessitatibus quasi aut omnis repellendus aut natus dolor."),
    Product(
        title: "Robe Noir",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 500,
        content:
          "Est dolor corrupti At accusantium quae in numquam laboriosam aut sunt praesentium qui nobis voluptas. Ut odio praesentium tempora minus aut consequatur sint est quisquam beatae 33 galisum voluptas. Quo nemo fugit ad quae est minima aliquid non totam tempora et dolores debitis. Rem necessitatibus quasi aut omnis repellendus aut natus dolor."),
    Product(
        title: "Robe Saumon",
        level: "Advanced",
        indicatorValue: 1.0,
        price: 500,
        content:
          "Est dolor corrupti At accusantium quae in numquam laboriosam aut sunt praesentium qui nobis voluptas. Ut odio praesentium tempora minus aut consequatur sint est quisquam beatae 33 galisum voluptas. Quo nemo fugit ad quae est minima aliquid non totam tempora et dolores debitis. Rem necessitatibus quasi aut omnis repellendus aut natus dolor."),
  ];
}