import 'dart:convert';

import 'package:http/http.dart';
import 'package:myfarmed/Models/Themes.dart';
import 'package:http/http.dart' as http;

import '../Models/Commentaires.dart';

class CommentaireService{

  Future<List<Commentaires>> allCommentairesById(int idtheme) async {
    var uri = Uri.parse("http://10.0.2.2:8080/commentaire/listepartheme/${idtheme}");
    Response res = await http.get(uri);

    if (res.statusCode == 200 && res.body != null) {
      List<Commentaires> commentaires = [];
      var jsonData = json.decode(res.body);
      print("COMMENTAIRE OK  ${jsonData}");

      for (var u in jsonData) {
        Commentaires allCommentaires = Commentaires();

        allCommentaires.idcommentaire = u["idcommentaire"];
        allCommentaires.descriptioncom = u["descriptioncom"];
        allCommentaires.datecom = u["datecom"];
        allCommentaires.user = u["user"];
        allCommentaires.themes = u["themes"];

        commentaires.add(allCommentaires);
      }
      commentaires.sort((a, b) => DateTime.parse(b.datecom!).compareTo(DateTime.parse(a.datecom!)));

      return commentaires;
    } else {
      print("Nooooooooooooooooo");
      throw "Unable to retrieve stock data.";
    }
  }
}


