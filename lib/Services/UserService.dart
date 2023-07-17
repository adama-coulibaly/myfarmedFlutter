import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as  http;
import 'package:myfarmed/Pages/loginPage.dart';
import 'package:quickalert/quickalert.dart';
import '../Globals/globalConstant.dart';

class UserService{
  Future<http.Response> saveUser(BuildContext context,String nom,String prenom,String username,String email, String adresse, String password, int statut) async{
     // Ajouter le paramètre BuildContext ici

    var uri = Uri.parse('$lien/signup/${statut}');
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


}



