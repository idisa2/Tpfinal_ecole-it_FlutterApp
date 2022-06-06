// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();

}

class _LoginState extends State<Login>{

  bool _isloading = false;

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("commander votre robe de mariage"),
        centerTitle: true,
        
      ),
      body:Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue,
            Colors.teal,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,

        ),
      ),

      child: _isloading ? Center(child:CircularProgressIndicator()) : ListView(
        children:<Widget>[
          Image(
          //image:AssetImage("images/img1.png"),
          
            image: NetworkImage('https://i0.wp.com/www.charmfoumariage.com/wp-content/uploads/Boutique-Charm-Fou-Mariage-Collection-2019-et-plus-Robe-de-mariee-Valenti-Bres-Aout-2019-1-1024x1024.jpeg'),
              width: 300,
              height: 250,
              ),
          headerSection(),
          textSection(),
          buttonSecton(),

         ],
      ),
    ),
   );

  }

  signIn(String email, String password) async {
    
    Map data ={
      'email':email,
      'password':password,
    };

    // ignore: avoid_init_to_null
    var jsData = null;
    
    var response = await http.post(Uri.parse("https://reqres.in/api/login"), body:data);
    
    if (response.statusCode==200){
      jsData = json.decode(response.body);

      setState(() {
        _isloading =false;
        Navigator.pushNamed(context, '/Accueil');
        
      });

  
    }
    else{
      print(response.body);
      Navigator.pushNamed(context, '/');

    }
  }

  Container buttonSecton(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height:40.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(top:30.0),
      child: RaisedButton(
        onPressed: emailController.text == "" || passwordController.text == "" ? null :(){
          setState(() {
            _isloading = true;
          });
          signIn(emailController.text,passwordController.text);
        },
        elevation: 0.0,
        color: Color.fromARGB(255, 8, 48, 32),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),

      child: Text("connexion", style: TextStyle(fontSize: 30.0,color:Colors.white70)),
      )
     
    );
      
  }

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  Container textSection(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(top:30.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailController,
            cursorColor: Colors.white,

            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.white70),
              hintText: "Email",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),

          ),
          SizedBox(height: 30.0),

          TextFormField(
            controller: passwordController,
            cursorColor: Colors.white,
            obscureText: true,
            style: TextStyle(color: Colors.white70),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white70),
              hintText: "Password",
              border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),

      ],
        
        )
        
      
    );

  }

  TextFormField txtEmail(String title,IconData icon){
    return TextFormField(
      controller: emailController,
      obscureText: true,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        hintText:title,
        hintStyle: TextStyle(color: Colors.white70),
        icon: Icon(icon)
      ),

    );
  }

  TextFormField txtPassword(String title,IconData icon){
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      style: TextStyle(color: Colors.white70),
      decoration: InputDecoration(
        hintText:title,
        hintStyle: TextStyle(color: Colors.white70),
        icon: Icon(icon)
      ),

    );
  }

  Container headerSection(){
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
      child: Text("Connectez-vous et trouver les meilleurs robes de mariage", style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: Colors.white),
      
      ),
    );

  }

  
}