import 'package:flutter/material.dart';

class forgetLogin extends StatelessWidget {
  const forgetLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
              elevation: 0,
              title: Container(
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => {
                        Navigator.pop(context)
                      },
                      child: Icon(Icons.arrow_back,size: 30,),
                    ),
                    SizedBox(width: 45,),
                    Container(
                      child: const Text("Mot de passe oublié",style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                    ),
                  ],
                ),
              ),
              ),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.green,
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Container(
                    height: 150,
                    width: 150,

                    child: const Icon(Icons.lock_person,size: 160,
                    color: Colors.white,),
                  ),

                  SizedBox(height: 55,),

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
                      child:  Column(
                        children: [

                          SizedBox(height: 55,),

                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: "Adresse email ou Téléphone",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.mail_outline,color: Colors.green,),

                            ),
                          ),

                       const SizedBox(height: 50,),
                          Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)
                            ),

                            child: TextButton(onPressed: () {
                              Navigator.pushNamed(context, "bottomBar");
                              print("object");
                            }, child: const Text("Envoyer",style:
                            TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),),
                            ),
                          ),
                          const SizedBox(height: 130,),
                          Container(
                            child: TextButton(onPressed: () {
                              Navigator.pushNamed(context, "loginpage");
                            }, child: const Text("Revenir sur la page de connexion",style:
                            TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                            ),),

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
        )
    );
  }
}

