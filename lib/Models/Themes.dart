import 'dart:convert';
import 'package:myfarmed/Models/users.dart';


class Themes{

   int? idtheme;
   String? titretheme;
   String? dateposte;
   int? nbreCommentaire;
   Map<String, dynamic>? user;

  Themes({
  this.idtheme,
     this.titretheme,
     this.dateposte,
     this.nbreCommentaire,
     this.user,

  });

  Map<String, dynamic> toJson() => {
    'idtheme': idtheme,
    'titretheme': titretheme,
    'dateposte': dateposte,
    'nbreCommentaire': nbreCommentaire,
    'user': user,
  };

  static Themes fromJson(Map<String, dynamic> json) => Themes(
      idtheme: json['idtheme'],
      titretheme: json['titretheme'],
      dateposte: json['dateposte'],
      nbreCommentaire: json['nbreCommentaire'],
      user: json['user'],
  );

}

Themes ThemesJson(String str) => Themes.fromJson(json.decode(str));
String ThemesToJson(Themes themes) => json.encode(themes.toJson());
