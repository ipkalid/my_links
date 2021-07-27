import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_tree/model/url_class.dart';
import 'package:my_tree/widgets/url_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 101',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Name"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            UrlCard(
              urlItem: UrlClass(
                label: "FaceBook",
                url: "https://www.facebook.com",
                icon: FontAwesomeIcons.facebook,
              ),
            ),
            UrlCard(
              urlItem: UrlClass(
                label: "Twitter",
                url: "https://www.Twitter.com",
                icon: FontAwesomeIcons.twitter,
              ),
            ),
            UrlCard(
              urlItem: UrlClass(
                label: "FaceBook",
                url: "https://www.Instagram.com",
                icon: FontAwesomeIcons.instagram,
              ),
            )
          ],
        ),
      ),
    );
  }
}
