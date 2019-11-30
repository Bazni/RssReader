import 'package:flutter/material.dart';
import 'package:rss_reader/widgets/chargement.dart';
import 'package:rss_reader/widgets/grille.dart';
import 'package:rss_reader/widgets/liste.dart';
import 'package:webfeed/webfeed.dart';
import 'package:rss_reader/models/parser.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  RssFeed feed;

  @override
  void initState() {
    super.initState();
    parse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  feed = null;
                  parse();
                });
              })
        ],
      ),
      body: choixDuBody(),
    );
  }

  Widget choixDuBody() {
    if (feed == null) {
      return new Chargement();
    } else {
      Orientation orientation = MediaQuery.of(context).orientation;
      if (orientation == Orientation.portrait) {
        return new Liste(feed);
      } else {
        return new Grille(feed);
      }
    }
  }

  Future<Null> parse() async {
    RssFeed recu = await Parser().chargerRSS();
    if(recu != null) {
      setState(() {
        feed = recu;
        //print(feed.items.length);
        feed.items.forEach((feedItem) {
          RssItem item = feedItem;
          //print(item.title);
          //print(item.description);
          //if (item.enclosure != null) {
          //  print(item.enclosure.url);
          //}
        });
      });
    }
  }
}