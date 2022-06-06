// ignore_for_file: file_names, prefer_const_constructors

//import 'package:projetfinal/delayed_animation.dart';
//import 'package:projetfinal/main.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../delayed_animation.dart';
import '../main.dart';


class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

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
        title: const Text('Formulaire De Contact'),
        backgroundColor: d_red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                    "Laissez-nous un message",
                    style: GoogleFonts.poppins(
                      color: d_red,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                    ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Form(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 9.0),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("Nom et Prenom"),
                        border: OutlineInputBorder()
                      ),
                    ),
                    Divider(),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("Adresse E-mail"),
                        border: OutlineInputBorder()
                      ),
                    ),
                    Divider(),
                    TextFormField(
                      decoration: InputDecoration(
                        label: Text("Objet du Message"),
                        border: OutlineInputBorder()
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}

