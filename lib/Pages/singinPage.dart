import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:myfarmed/Pages/lesUtilisateurs.dart';
import 'package:myfarmed/Services/FireBase/usersRegistration.dart';
import 'package:myfarmed/Services/UserService.dart';

class singinPage extends StatefulWidget {
  const singinPage({Key? key}) : super(key: key);

  @override
  State<singinPage> createState() => _singinPageState();
}

class _singinPageState extends State<singinPage> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController mailontroller = TextEditingController();
  TextEditingController usernameontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  String? valueChoose;
  final List lisItem = ["Nom fermier", "Fermier"];

  final _formfieldStep1 = GlobalKey<FormState>();
  final _formfieldStep2 = GlobalKey<FormState>();


//usersRegistration service = usersRegistration();
  UserService service = UserService();


  List<Step> lesSteppers() => [
        Step(
          state: _activeIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeIndex >= 0,
          title: Text("Cordonnées"),
          content: Form(
            key: _formfieldStep1,
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

                  validator: (value) {

                    if (value!.isEmpty) {
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
                  validator: (value) {
                    if (value!.isEmpty) {
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
                        value: name, child: Text(name));
                  }).toList(),
                  onChanged: (String? value) => setState(() {
                    this.valueChoose = value;

                    print(valueChoose);
                  }),
                  validator: (value) {
                    if (value == null) {
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email obligatoire";
                    }
                    bool emailValid = RegExp(
                            r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")
                        .hasMatch(value);
                    if (!emailValid) {
                      return "Email non valide ";
                    }
                  },
                ),

                const SizedBox(
                  height: 25,
                ),

              ],
            ),
          ),
        ),
        Step(
            state: _activeIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeIndex >= 1,
            title: Text("Status"),
            content: Form(
             key: _formfieldStep2,
                child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: adresseController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Adresse",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.maps_home_work_outlined,
                      color: Colors.green,
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Adresse invalide";
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                IntlPhoneField(
                  invalidNumberMessage: 'Ce numéro est invalide !',
                  initialCountryCode: '+223',
                  dropdownIconPosition: IconPosition.trailing,
                  searchText: "Choisissez un pays",
                  languageCode: 'fr',
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
                  validator: (value) {
                    if (value!.number.isEmpty) {
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Votre mot de passe";
                    } else if (passwordController.text.length < 8) {
                      return " Mot de passe trop court 8 caractère au minimum";
                    }
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: confirmPasswordController,
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Veuillez confirmer le mot de passe";
                    }else if (confirmPasswordController.text.length < 8) {
                      return " Mot de passe trop court 8 caractère au minimum";
                    }
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ))),

      ];

  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text("Inscription"),
        actions: [
          IconButton(
              onPressed: ()=>{
                Navigator.push(context, MaterialPageRoute(builder: (context) => allUsers()))
              },
              icon: Icon(Icons.supervised_user_circle_outlined))
        ],
      ),
      body: Theme(
        data: Theme.of(context).copyWith(colorScheme:ColorScheme.light(primary: Colors.green)),

        child: Stepper(
          steps: lesSteppers(),
          type: StepperType.horizontal,
          currentStep: _activeIndex,
          onStepTapped: (step) => setState(() {
            if (_activeIndex == 0 && _formfieldStep1.currentState!.validate()) {
              _activeIndex = step;
            }
            if (_activeIndex == 1 && _formfieldStep2.currentState!.validate()) {
              _activeIndex = step;
            }
          } ),
          onStepContinue: () {
            int valeur ;
            if(valueChoose == "Fermier"){
              valeur = 1;
            }
            else{valeur = 2;}
            if(_activeIndex == 0 && _formfieldStep1.currentState!.validate() ){
              _activeIndex +=1;
            }
            if(_activeIndex == 1 && _formfieldStep2.currentState!.validate() ){
              if(passwordController.text != confirmPasswordController.text){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:Container(
                        height: 50,
                        child:const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Oups !",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),),
                            Spacer(),
                            Text("Les mots de passe ne correspondent pas ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white), maxLines: 2,overflow: TextOverflow.ellipsis,),

                          ],
                        ),
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                    )
                );
              }
              else{

                service.saveUser(context,
                    nomController.text,
                    prenomController.text,
                    usernameontroller.text,
                    mailontroller.text,
                    adresseController.text,
                    passwordController.text,
                    valeur
                );
              }
            }










            setState(() {});
          },
          onStepCancel: () {
            if (_activeIndex == 0) {
              return;
            }
            _activeIndex -= 1;

            setState(() {});
          },



        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        child:  Container(
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
        ),
      ),
    );
  }
}
