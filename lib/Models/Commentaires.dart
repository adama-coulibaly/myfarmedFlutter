import 'dart:convert';


class Commentaires{

  int? idcommentaire;
  String? descriptioncom;
  String? datecom;
  Map<String, dynamic>? user;
  Map<String, dynamic>? themes;

 Commentaires({
    this.idcommentaire,
   this.descriptioncom,
   this.datecom,
   this.user,
   this.themes
});

  Map<String, dynamic> toJson() => {
    'idcommentaire': idcommentaire,
    'descriptioncom': descriptioncom,
    'datecom': datecom,
    'user': user,
    'themes': themes,
  };

  static Commentaires fromJson(Map<String, dynamic> json) => Commentaires(
    idcommentaire: json['idcommentaire'],
    descriptioncom: json['descriptioncom'],
    datecom: json['datecom'],
    user: json['user'],
    themes: json['themes'],
  );

}

Commentaires CommentairesJson(String str) => Commentaires.fromJson(json.decode(str));
String CommentairesToJson(Commentaires commentaires) => json.encode(commentaires.toJson());
