import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../Models/users.dart';
import '../../Pages/loginPage.dart';

class usersRegistration {
  Future createUser(
      BuildContext context,
      String nom,
      String prenom,
      String username,
      String email,
      String adresse,
      String password,
      String statut) async {
    // :::::::::::::::::::::::::  REFERENCE DU DOCUMENT FIREBASE SUR FIRE STORE:::::::::::::::::::::::

    final userDoc = FirebaseFirestore.instance.collection('usersId').doc();

    final user = User(
      id: userDoc.id,
      username: username,
      nom: nom,
      prenom: prenom,
      adresse: adresse,
      email: email,
      password: password,
      statut: statut,
    );
    final json = user.toJson();
    // :::::::::::::::::::::: CREATION DU DOCUMENT ET ENREGISTREMENT DANS  FIREBASE STORE:::::::::::::::::
    await userDoc.set(json);

    QuickAlert.show(
        context: context,
        type: QuickAlertType.success,
        title: "Succès",
        text: "Compte créer avec succès",
        barrierDismissible: false,
        onConfirmBtnTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => loginPage()))
            });
  }

//::::::::::::::::::::::::::::::::: READ USERS :::::::::::::::::::::::::::::::::
  Stream<List<User>> allUsers() => FirebaseFirestore.instance
      .collection('usersId')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
}
