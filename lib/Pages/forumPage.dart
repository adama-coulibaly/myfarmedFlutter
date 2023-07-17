import 'package:flutter/material.dart';
import 'package:myfarmed/Models/Commentaires.dart';

import '../Models/Themes.dart';
import '../Services/CommentaireService.dart';
import '../Services/ThemeService.dart';

class forumPage extends StatefulWidget {
  const forumPage({Key? key}) : super(key: key);

  @override
  State<forumPage> createState() => _forumPageState();
}

class _forumPageState extends State<forumPage> {
  ThemeService service = ThemeService();

  late Future<List<Themes>> themes = service.allThemes();
  // Initialisation directe
  @override
  void initState() {
    super.initState();
    themes = service.allThemes();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: width / 4,
                child: Text("Forum"),
              ),
              Container(
                //margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: width / 1.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5),
                      height: 50,
                      width: width / 2,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Recherche ici"),
                      ),
                    ),
                    Spacer(),
                    const Icon(
                      Icons.keyboard_voice,
                      size: 27,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
          backgroundColor: Colors.green,
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.only(top: 15),
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.only(top: 25, left: 10, right: 10),
            decoration: const BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                )),
            child: Container(
              child: FutureBuilder<List<Themes>>(
                  future: themes,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Themes>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      print("ERRR ${snapshot.error}");
                      return const Center(child: Icon(Icons.error));
                    }

                    if (snapshot.hasData) {
                      return ListView.separated(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 180,
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                border: const Border(
                                  top:
                                      BorderSide(color: Colors.green, width: 2),
                                  bottom:
                                      BorderSide(color: Colors.green, width: 2),
                                  right:
                                      BorderSide(color: Colors.green, width: 2),
                                  left:
                                      BorderSide(color: Colors.green, width: 2),
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      blurRadius: 2.0,
                                      spreadRadius: .05)
                                ],
                                color: Colors.white),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          border: const Border(
                                            top: BorderSide(
                                                color: Colors.green, width: 2),
                                            bottom: BorderSide(
                                                color: Colors.green, width: 2),
                                            right: BorderSide(
                                                color: Colors.green, width: 2),
                                            left: BorderSide(
                                                color: Colors.green, width: 2),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                blurRadius: 2.0,
                                                spreadRadius: .05)
                                          ]),
                                      child: const CircleAvatar(
                                        backgroundImage: AssetImage(
                                          "assets/images/logo.png",
                                          //"${snapshot.data![index].user?["avatar"]} ",
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      width: 265,
                                      child: Text(
                                        "${snapshot.data?[index].titretheme}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black87),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(right: 10),
                                      child: Text(
                                        "Par: ${snapshot.data![index].user?["nom"]} ${snapshot.data![index].user?["prenom"]} le ${snapshot.data![index].dateposte}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            color: Colors.grey),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child: Center(
                                              child: Text(
                                                "${snapshot.data![index].nbreCommentaire}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Text(
                                            "Commentaire(s)",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(right: 5, left: 5),
                                      decoration: const BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              bottomLeft: Radius.circular(20))),
                                      child: TextButton(
                                          onPressed: () => {
                                                print(
                                                    "ID : ${snapshot.data?[index].idtheme}"),
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            detailForum(
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .idtheme,
                                                                snapshot
                                                                    .data![
                                                                        index]
                                                                    .titretheme)))
                                              },
                                          child: const Text(
                                            "Voir plus",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.white),
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            height: 20,
                            thickness: 2,
                          );
                        },
                      );
                    }

                    return const Center(child: Text('Aucun thème trouvé.'));
                  }),
            ),
          ),
        ),
        floatingActionButton: bouttonPoster(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),

    );
  }
}

class detailForum extends StatelessWidget {
  int? idtheme;
  String? titretheme;
  detailForum(this.idtheme, this.titretheme, {Key? key}) : super(key: key);

  CommentaireService commentaireService = CommentaireService();

  late Future<List<Commentaires>> commentaire =
      commentaireService.allCommentairesById(idtheme!);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "$titretheme",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        child: Container(
          height: height,
          width: width,
          padding: EdgeInsets.only(top: 25, left: 10, right: 10),
          decoration: const BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              )),
          child: Container(
            child: FutureBuilder<List<Commentaires>>(
                future: commentaire,
                builder: (BuildContext context,
                    AsyncSnapshot<List<Commentaires>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    print("ERRR ${snapshot.error}");
                    return const Center(child: Icon(Icons.error));
                  }
                  if (snapshot.data!.isEmpty) {
                    print("ERRR ${snapshot.error}");
                    return const Center(
                        child: Text(
                      "Auccun commentaire !",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ));
                  }

                  if (snapshot.hasData) {
                    return ListView.separated(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          //height: 180,
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              border: const Border(
                                top: BorderSide(color: Colors.green, width: 2),
                                bottom:
                                    BorderSide(color: Colors.green, width: 2),
                                right:
                                    BorderSide(color: Colors.green, width: 2),
                                left: BorderSide(color: Colors.green, width: 2),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 2.0,
                                    spreadRadius: .05)
                              ],
                              color: Colors.white),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        border: const Border(
                                          top: BorderSide(
                                              color: Colors.green, width: 2),
                                          bottom: BorderSide(
                                              color: Colors.green, width: 2),
                                          right: BorderSide(
                                              color: Colors.green, width: 2),
                                          left: BorderSide(
                                              color: Colors.green, width: 2),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              blurRadius: 2.0,
                                              spreadRadius: .05)
                                        ]),
                                    child: const CircleAvatar(
                                      backgroundImage: AssetImage(
                                        "assets/images/logo.png",
                                        //"${snapshot.data![index].user?["avatar"]} ",
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    width: 265,
                                    child: Text(
                                      "${snapshot.data![index].descriptioncom}",
                                      style: const TextStyle(
                                          fontSize: 16, color: Colors.black87),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text(
                                      "Par: ${snapshot.data![index].user?["nom"]} ${snapshot.data![index].user?["prenom"]} le ${snapshot.data![index].datecom}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.grey),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(right: 5, left: 5),
                                    decoration: const BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            bottomLeft: Radius.circular(20))),
                                    child: TextButton(
                                        onPressed: () => {
                                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=>detailForum( snapshot.data![index].idtheme )))
                                            },
                                        child: const Text(
                                          "Voir plus",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.white),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 20,
                          thickness: 2,
                        );
                      },
                    );
                  }

                  return const Center(child: Text('Aucun commentaire trouvé.'));
                }),
          ),
        ),
      ),
      floatingActionButton: bouttonCommenter(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}

Widget bouttonPoster() =>
    FloatingActionButton.extended(onPressed: () {},

        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        icon: Icon(Icons.add_circle_outline),
        label: Text("Poster ici"));

Widget bouttonCommenter() =>
    FloatingActionButton.extended(onPressed: () {},
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        icon: Icon(Icons.sms_outlined),
        label: Text("Commenter"));
