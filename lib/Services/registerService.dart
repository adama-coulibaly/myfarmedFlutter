import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as  http;
class registerService{
  Future<http.Response> saveUser(String nom,String prenom,String username,String email, String adresse, String password) async{
     int userStatut = 2;
     String lien = "http://localhost:8080/api/auth";
    var uri = Uri.parse('$lien/signup/${userStatut}');
    Map<String,String> headers = {"Content-type": "application/json"};
    Map data = {
      'username': '$username',
      'nom': '$nom',
      'prenom': '$prenom',
      'email': '$email',
      'adresse': '$adresse',
      'password': '$password',

    };
    var body = json.encode(data);
    http.Response  response = await http.post(uri,headers:headers ,body:body );
    
    print("${response.body}");
    return response;
  }
}