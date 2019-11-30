import 'package:flutter/material.dart';
import 'package:rss_reader/widgets/texte.dart';

class Chargement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new Texte(
        "Chargement en cours...",
        fontSize: 30.0,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}