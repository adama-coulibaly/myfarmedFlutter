import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:myfarmed/Models/Themes.dart';
import 'package:http/http.dart' as http;
import 'package:myfarmed/Pages/forumPage.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Globals/globalConstant.dart';
import '../Pages/loginPage.dart';

class ThemeService{

  Future<Response> addTheme(BuildContext context, String titretheme) async {
    SharedPreferences Prefs = await SharedPreferences.getInstance();
    var UID = Prefs.getInt("id");
    var uri = Uri.parse("http://10.0.2.2:8080/theme/ajouter/${UID}");
    String? token = Prefs.getString("token");


    Map data = {
      'titretheme': titretheme

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
            context.findAncestorStateOfType()
            //Navigator.push(context, MaterialPageRoute(builder: (context) => forumPage()))
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

  Future<List<Themes>> allThemes() async {
    var uri = Uri.parse("http://10.0.2.2:8080/theme/liste");
    Response res = await http.get(uri);

    if (res.statusCode == 200 && res.body != null) {
      List<Themes> themes = [];
      var jsonData = json.decode(res.body);

      for (var u in jsonData) {
        Themes allThems = Themes();

        allThems.idtheme = u["idtheme"];
        allThems.titretheme = u["titretheme"];
        allThems.nbreCommentaire = u["nbreCommentaire"];
        allThems.dateposte = u["dateposte"];
        allThems.user = u["user"];
        themes.add(allThems);
      }
      // Tri des thèmes par ordre de date la plus récente
      themes.sort((a, b) => DateTime.parse(b.dateposte!).compareTo(DateTime.parse(a.dateposte!)));

      return themes;
    } else {
      throw "Unable to retrieve stock data.";
    }
  }
}


