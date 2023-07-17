import 'dart:convert';

import 'package:http/http.dart';
import 'package:myfarmed/Models/Themes.dart';
import 'package:http/http.dart' as http;

class ThemeService{

  Future<List<Themes>> allThemes() async {
    var uri = Uri.parse("http://10.0.2.2:8080/theme/liste");
    Response res = await http.get(uri);

    if (res.statusCode == 200 && res.body != null) {
      List<Themes> themes = [];
      var jsonData = json.decode(res.body);
      print("OKKKKKKKKKKKKKKKKKKKK  ${jsonData}");

      for (var u in jsonData) {
        Themes allThems = Themes();

        allThems.idtheme = u["idtheme"];
        allThems.titretheme = u["titretheme"];
        allThems.nbreCommentaire = u["nbreCommentaire"];
        allThems.dateposte = u["dateposte"];
        allThems.user = u["user"];

        themes.add(allThems);
      }
      print("Users  ${themes}");
      return themes;
    } else {
      print("Nooooooooooooooooo");
      throw "Unable to retrieve stock data.";
    }
  }
}


