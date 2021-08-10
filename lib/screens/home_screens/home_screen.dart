import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_tree/main.dart';
import 'package:my_tree/model/url_class.dart';
import 'package:my_tree/screens/auth_screens/signin_screen.dart';
import 'package:my_tree/widgets/url_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isEditMode = false;
  User? user;

  CollectionReference? collectionReference;
  DocumentReference? userDocumentReference;

  TextEditingController linkLabelTextEditingController =
      TextEditingController();
  TextEditingController linkURLTextEditingController = TextEditingController();

  Future<DocumentSnapshot<Object?>>? data;
  var links;

  void getData() async {
    user = auth.currentUser!;

    collectionReference = firestore.collection('users');
    userDocumentReference = collectionReference!.doc(user!.uid);

    data = userDocumentReference!.get();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffDA4453),
            Color(0xffDF9CCC),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("My Links"),
          leading: (!isEditMode)
              ? IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () async {
                    await auth.signOut();
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(),
                      ),
                    );
                  })
              : null,
          actions: [
            if (!isEditMode)
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  setState(() {
                    isEditMode = !isEditMode;
                  });
                },
              ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    //backgroundImage: NetworkImage(""),
                    radius: 57,
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    'User Name',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Text(
                    'Bio LAPLAPLAPLPALPAL LAPLAPLAPLPALPAL ‍💻 sd,nbfjsbdgjbdsjkg,sdm sndlsd',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                ],
              ),
              FutureBuilder(
                future: data,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data as DocumentSnapshot<Object?>;

                    links = data.get("links");

                    return Expanded(
                      child: ListView.builder(
                        itemCount: links.length,
                        itemBuilder: (BuildContext context, int index) {
                          return UrlCard(
                            urlItem: UrlClass(
                              label: links[index]['label'],
                              url: links[index]['url'],
                              icon: FontAwesomeIcons.table,
                            ),
                            isEditable: isEditMode,
                            deliteFunction: () {
                              // var temp = List.from(links);
                              links.removeAt(index);
                              userDocumentReference!
                                  .update({'links': links}).then(
                                (_) {
                                  setState(() {
                                    getData();
                                  });
                                },
                              );
                            },
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      child: Text("Error"),
                    );
                  }

                  return CircularProgressIndicator();
                },
              ),
              if (isEditMode)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          minimumSize: Size(79, 48),
                          side: BorderSide(width: 2, color: Colors.white),
                        ),
                        child: Text(
                          "Add Link +",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Add Link'),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      TextField(
                                        controller:
                                            linkLabelTextEditingController,
                                        decoration:
                                            InputDecoration(hintText: "Label"),
                                      ),
                                      TextField(
                                        controller:
                                            linkURLTextEditingController,
                                        decoration:
                                            InputDecoration(hintText: "URL"),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Add +'),
                                    onPressed: () {
                                      links.add({
                                        "label":
                                            linkLabelTextEditingController.text,
                                        "url": linkURLTextEditingController.text
                                      });
                                      userDocumentReference!
                                          .update({'links': links}).then(
                                        (_) {
                                          setState(() {
                                            getData();
                                          });
                                          linkLabelTextEditingController.text =
                                              "";
                                          linkURLTextEditingController.text =
                                              "";
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              if (isEditMode)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(233, 48),
                      side: BorderSide(width: 2, color: Colors.white),
                    ),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      setState(
                        () {
                          isEditMode = !isEditMode;
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
