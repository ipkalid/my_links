import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_tree/model/url_class.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlCard extends StatelessWidget {
  const UrlCard({Key? key, required this.urlItem}) : super(key: key);
  final UrlClass urlItem;

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
        onPressed: () {
          _launchURL(urlItem.url);
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: FaIcon(
                urlItem.icon,
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
              urlItem.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.cyan,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
