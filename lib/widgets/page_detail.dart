import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/image_properties.dart';
import 'package:rss_reader/models/date_convertisseur.dart';
import 'package:rss_reader/widgets/texte.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/domain/rss_item.dart';

class PageDetail extends StatelessWidget {

  RssItem item;

  PageDetail(RssItem item) {
    this.item = item;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Détail de l'article"),
        centerTitle: true,
      ),
      body: new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            padding(),
            new Texte(item.title, fontSize: 25.0),
            padding(),
            new Card(
              elevation: 7.5,
              child: new Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: item.enclosure != null ?
                new Image.network(item.enclosure.url, fit: BoxFit.fill) :
                null,
              ),
            ),
            padding(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Texte(item.author ?? ""),
                new Texte(new DateConvertisseur().convertirDate(item.pubDate ?? ""), color: Colors.red,),
              ],
            ),
            padding(),
            new Html(
              data: item.description,
              padding: EdgeInsets.all(8.0),
              defaultTextStyle: new TextStyle(
                color: Colors.black87,
                fontSize: 15.0
              ),
              linkStyle: new TextStyle(
                  fontSize: 16.0,
                  color: Colors.indigo[700],
                  fontWeight: FontWeight.bold
              ),
              onLinkTap: (url) {
                launchURL(url);
              },
              blockSpacing: 10.0,
              imageProperties: new ImageProperties(
                fit: BoxFit.fitWidth,
              ),
            ),
            padding()
          ],
        ),
      ),
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Padding padding() {
    return new Padding(padding: EdgeInsets.only(top: 20.0, right: 2.5, left: 2.5));
  }
}
