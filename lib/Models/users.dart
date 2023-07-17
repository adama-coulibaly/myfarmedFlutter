import 'dart:core';

class User {
  late String id;
  late String username;
  late String nom;
  late String prenom;
  late String adresse;
  late String email;
  late String password;
  late String statut;

  User({
    required this.id,
    required this.username,
    required this.nom,
    required this.prenom,
    required this.adresse,
    required this.email,
    required this.password,
    required this.statut,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'nom': nom,
        'prenom': prenom,
        'adresse': adresse,
        'email': email,
        'password': password,
        'statut': statut,
      };

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      username: json['username'],
      nom: json['nom'],
      prenom: json['prenom'],
      adresse: json['adresse'],
      email: json['email'],
      password: json['password'],
      statut: json['statut']
  );
}
