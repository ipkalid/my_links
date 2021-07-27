import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UrlClass {
  UrlClass({
    required this.url,
    required this.label,
    this.icon = FontAwesomeIcons.globe,
  });

  String url;
  String label;
  IconData? icon;
}
