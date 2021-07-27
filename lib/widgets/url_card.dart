import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UrlCard extends StatelessWidget {
  const UrlCard({Key? key}) : super(key: key);
  //TODO: add the class for the urlCard

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 52,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.cyan,
        ),
      ),
      child: TextButton(
        //TODO: Implement open URl
        onPressed: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: FaIcon(
                FontAwesomeIcons.twitch,
                color: Colors.cyan,
              ),
            ),
            VerticalDivider(
              width: 25,
              thickness: 2,
              indent: 8,
              endIndent: 8,
              color: Colors.cyan.withOpacity(.5),
            ),
            Text(
              "Twitch",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
