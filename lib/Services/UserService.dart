import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as  http;
import 'package:myfarmed/PackagesContenues/bottomBar.dart';
import 'package:myfarmed/Pages/HomePage.dart';
import 'package:myfarmed/Pages/loginPage.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Globals/globalConstant.dart';

class UserService{
  var client = http.Client();
  Future<http.Response> saveUser(BuildContext context,String nom,String prenom,String username,String email, String adresse, String password, int statut) async{
     // Ajouter le paramètre BuildContext ici

    var uri = Uri.parse('$baseUrl/signup/${statut}');
    Map data = {
      'username': username,
      'nom': nom,
      'prenom': prenom,
      'adresse':adresse,
      'email': email,
      'password': password,
      'statut':'$statut'

    };
    var body = json.encode(data, toEncodable: (value) => value.toString(),);
    var encodedBody = utf8.encode(body);
    http.Response  response = await http.post(uri,headers:headers ,body:encodedBody );



    Map<String, dynamic> responseData = json.decode(response.body);

    bool status = responseData['status'];



    if (status) {
    QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          title: "Succès",
          text: responseData['message'],
        barrierDismissible: false,
        onConfirmBtnTap: ()=>{
            Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage()))
        }
      );  
    } else {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
        title: "Erreur",
        text: responseData['message'],
        barrierDismissible: true
      );

    }
    return response;
  }




  //::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::  SIGNIN :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

Future<Object> Sigin(BuildContext context,String username, String password) async{


    var url = Uri.parse('$baseUrl/signin');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(
        {'usernameOrEmail': username, 'password': password});

    var response = await client.post(url, body: data, headers: headers);

    if (response.statusCode == 200) {
      prefs.setBool("loggedIn", true);
      Map<String, dynamic> json = jsonDecode(response.body);
      prefs.setString("token", json['accessToken']);
      var token = json['accessToken'];
      prefs.setInt("id", json['id']);
     var id = json['id'];
      print("Bienvenue ${json['accessToken']} !".toUpperCase());
      Navigator.push(context, MaterialPageRoute(builder: (context)=>bottomBar()));
      return "Bienvenue ${json['username']} !".toUpperCase();

    } else {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          title: "Erreur",
          text: "Identifiants incorrects !",
          barrierDismissible: true
      );
      return  response;
    }
}


}



