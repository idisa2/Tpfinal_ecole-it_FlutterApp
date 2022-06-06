// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:projetfinal/delayed_animation.dart';
//import 'package:projetfinal/main.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../delayed_animation.dart';
import '../main.dart';


class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: MyBody(),   
    );
    
  }
}

class MyBody extends StatelessWidget {
  const MyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      appBar: AppBar(
        title: Text('Accueil'),
        backgroundColor: d_red,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:[
            DrawerHeader(
              child: null,
            ),
            ListTile(
              title: Text('Menu Principal', style: TextStyle(color: Colors.white, fontSize: 24),),
              tileColor: d_red,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Accueil'),
              onTap: () {
                Navigator.pushNamed(context, '/Accueil');
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('Modéle de Robes'),
              onTap: () {
                Navigator.pushNamed(context, '/Produits');
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Contactez-Nous'),
              onTap: () {
                Navigator.pushNamed(context, '/Contact');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Deconnection'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            )
          ],
        ), 
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 300,
              //child: Image.asset('assets/images/img3.jpg'),
            ),
            Container(
            margin: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DelayedAnimation(
                  delay: 1500,
                  child: Text(
                    "Bienvenue Chez Nous, Chez Vous",
                    style: GoogleFonts.poppins(
                      color: d_red,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                    ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  DelayedAnimation(
                    delay: 2500,
                    child: Text(
                      "Les dernières tendances de la saison et tous les essentiels au meilleur prix. Trouvez une robe de mariée princesse parmi les robes de différents style chez Nel-Idriss, Confectionnée à la Perfection pour Vous Satisfaire.",
                      style: GoogleFonts.poppins(
                        color: Colors.grey[600],
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
     
    );
  }
}

