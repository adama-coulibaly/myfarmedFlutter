import 'package:flutter/material.dart';

import '../Services/registerService.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nomController = TextEditingController();
    TextEditingController prenomController = TextEditingController();
    TextEditingController mailontroller = TextEditingController();
    TextEditingController usernameontroller = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController adresseController = TextEditingController();

    registerService service = registerService();

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
                  Container(
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
                          ),
                          SizedBox(
                            height: 15,
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
                                service.saveUser(
                                    nomController.text,
                                    prenomController.text,
                                    usernameontroller.text,
                                    mailontroller.text,
                                    adresseController.text,
                                    passwordController.text);
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
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
