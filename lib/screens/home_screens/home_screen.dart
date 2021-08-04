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
  List<UrlClass> links = [];

  @override
  void initState() {
    super.initState();

    links = [
      UrlClass(
        label: "FaceBook",
        url: "https://www.facebook.com",
        icon: FontAwesomeIcons.facebook,
      ),
      UrlClass(
        label: "Twitter",
        url: "https://www.Twitter.com/ikalhazmi",
        icon: FontAwesomeIcons.twitter,
      ),
      UrlClass(
        label: "Instagram",
        url: "https://www.Instagram.com",
        icon: FontAwesomeIcons.instagram,
      ),
      UrlClass(
        label: "FaceBook",
        url: "https://www.facebook.com",
        icon: FontAwesomeIcons.facebook,
      ),
      UrlClass(
        label: "Twitter",
        url: "https://www.Twitter.com",
        icon: FontAwesomeIcons.twitter,
      ),
      UrlClass(
        label: "Instagram",
        url: "https://www.Instagram.com",
        icon: FontAwesomeIcons.instagram,
      ),
      UrlClass(
        label: "FaceBook",
        url: "https://www.facebook.com",
        icon: FontAwesomeIcons.facebook,
      ),
      UrlClass(
        label: "Twitter",
        url: "https://www.Twitter.com",
        icon: FontAwesomeIcons.twitter,
      ),
      UrlClass(
        label: "Instagram",
        url: "https://www.Instagram.com",
        icon: FontAwesomeIcons.instagram,
      ),
    ];
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
                    backgroundImage: NetworkImage("s"),
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
              Expanded(
                child: ListView.builder(
                  itemCount: links.length,
                  itemBuilder: (BuildContext context, int index) {
                    return UrlCard(
                      urlItem: links[index],
                      isEditable: isEditMode,
                      deliteFunction: () {
                        setState(() {
                          links.removeAt(index);
                        });
                      },
                    );
                  },
                ),
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
