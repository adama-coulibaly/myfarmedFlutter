import 'package:flutter/material.dart';

import '../Services/UserService.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
     String? valueChoose;
 final  List lisItem = [
    "Nom fermier","Fermier"
  ];

  @override
  Widget build(BuildContext context) {
    final _formfield =GlobalKey<FormState>();
    TextEditingController nomController = TextEditingController();
    TextEditingController prenomController = TextEditingController();
    TextEditingController mailontroller = TextEditingController();
    TextEditingController usernameontroller = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController adresseController = TextEditingController();





    UserService service = UserService();



    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: Colors.green,
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      backgroundImage: AssetImage("assets/images/logo.png"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: _formfield,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      // height: 600,
                      // color: Colors.green,
                      decoration: const BoxDecoration(
                          color: Color(0xFFEDECF2),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          )),
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: nomController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                labelText: "Nom",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.supervised_user_circle,
                                  color: Colors.green,
                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Le nom est obligatoire";
                                }
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: prenomController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                labelText: "Prénom",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.supervised_user_circle,
                                  color: Colors.green,
                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Prénom obligatoire";
                                }
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            DropdownButtonFormField(

                              hint: Text("Statut"),
                              items: lisItem.map((name) {
                                return DropdownMenuItem<String>(
                                    value: name,
                                    child: Text(name)
                                );
                              }).toList(),
                              onChanged: (String? value) =>setState(() {
                                this.valueChoose = value;

                                print(valueChoose);
                              }),   validator: (value){
                              if(value == 0){
                                return "Votre statut !";
                              }
                            },
                            ),

                            const SizedBox(
                              height: 35,
                            ),
                            TextFormField(
                              controller: mailontroller,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                labelText: "Adresse email",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color: Colors.green,
                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Email obligatoire";
                                }
                                bool emailValid = RegExp(r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(value);
                                if(!emailValid){
                                  return "Email non valide ";
                                }

                              },

                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: usernameontroller,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                labelText: "Numéro de phone",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.green,
                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Numéro invalide";
                                }
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),




                            TextFormField(
                              controller: passwordController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: "Mot de passe",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.green,
                                ),
                                suffixIcon: Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: Colors.green,
                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Votre mot de passe";
                                }
                                else if(passwordController.text.length < 8){
                                  return " Mot de passe trop court 8 caractère au minimum";
                                }
                              },
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: "Confirmé le mot de passe",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.green,
                                ),
                                suffixIcon: Icon(
                                  Icons.remove_red_eye_sharp,
                                  color: Colors.green,
                                ),

                              ),
                              validator: (value){
                              if(value!.isEmpty){
                                return "Veuillez confirmer le mot de passe";
                              }
                            },
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                onPressed: () {
                                  if(_formfield.currentState!.validate()){
                              print("Succes");
                              nomController.clear();
                                  }
                                  int valeur ;
                                  if(valueChoose == "Fermier"){
                                    valeur = 1;
                                  }
                                  else{valeur = 2;}

                                /*  service.saveUser(
                                      nomController.text,
                                      prenomController.text,
                                      usernameontroller.text,
                                      mailontroller.text,
                                      adresseController.text,
                                      passwordController.text,
                                      valeur
                                  );*/
                                },
                                child: const Text(
                                  "Inscription",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, "loginpage");
                                },
                                child: const Text(
                                  "Vous avez déjà un compte ?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

    );

  }
}


