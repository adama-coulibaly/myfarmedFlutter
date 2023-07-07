

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

Future createUser(BuildContext context,String nom,String prenom,String username,String email, String adresse, String password, int statut) async{

  // :::::::::::::::::::::::::  REFERENCE DU DOCUMENT FIREBASE SUR FIRE STORE:::::::::::::::::::::::

  final userDoc = FirebaseFirestore.instance.collection('users').doc('my-id');
  final json = {
    'username': username,
    'nom': nom,
    'prenom': prenom,
    'adresse':adresse,
    'email': email,
    'adresse': adresse,
    'password': password,
    'statut':'$statut',
  };

  // :::::::::::::::::::::: CREATION DU DOCUMENT ET ENREGISTREMENT DANS  FIREBASE STORE:::::::::::::::::
  await userDoc.set(json);
}