import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_tree/model/url_class.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlCard extends StatelessWidget {
  const UrlCard(
      {Key? key,
      required this.urlItem,
      this.isEditable = true,
      this.deliteFunction})
      : super(key: key);
  final UrlClass urlItem;
  final isEditable;
  final void Function()? deliteFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 52,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.white,
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
                color: Colors.white,
              ),
            ),
            VerticalDivider(
              width: 25,
              thickness: 2,
              indent: 8,
              endIndent: 8,
              color: Colors.white.withOpacity(.5),
            ),
            Expanded(
              child: Text(
                urlItem.label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (isEditable)
              IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: deliteFunction,
              ),
          ],
        ),
      ),
    );
  }
}

void _launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
