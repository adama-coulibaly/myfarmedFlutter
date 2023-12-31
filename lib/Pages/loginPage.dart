import 'package:flutter/material.dart';


void main() => runApp(loginPage());

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              color: Colors.green,
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Container(
                    height: 160,
                    width: 160,
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/images/logo.png"),
                    ),
                  ),

                  SizedBox(height: 35,),

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

                          SizedBox(height: 35,),

                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: "Adresse email ou phone",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.mail_outline,color: Colors.green,),

                            ),
                          ),

                          SizedBox(height: 35,),
                          TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Mot de passe",
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.lock,color: Colors.green,),
                              suffixIcon: Icon(Icons.remove_red_eye_sharp,color: Colors.green,),
                            ),
                          ),


                          const SizedBox(height: 50,),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: ()=>{
                                  Navigator.pushNamed(context, "forgetLogin")
                                },
                                child: const Text("Mot de passe oublié ?",
                                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,
                                fontSize: 18),),
                              )
                            ],
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
                            }, child: const Text("Connexion",style:
                            TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25
                            ),),
                            ),
                          ),
                          const SizedBox(height: 110,),
                          Container(
                            child: TextButton(onPressed: () {
                              Navigator.pushNamed(context, "RegisterPage");
                            }, child: const Text("Vous n'avez pas de compte ?",style:
                            TextStyle(
                                fontSize: 17,
                                color: Colors.green,
                                fontWeight: FontWeight.bold
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

