import 'package:flutter/material.dart';
import 'package:rss_reader/models/date_convertisseur.dart';
import 'package:rss_reader/widgets/page_detail.dart';
import 'package:rss_reader/widgets/texte.dart';
import 'package:webfeed/domain/rss_feed.dart';
import 'package:webfeed/domain/rss_item.dart';

class Liste extends StatefulWidget {
  RssFeed feed;

  Liste(RssFeed feed) {
    this.feed = feed;
  }

  @override
  _ListeState createState() => new _ListeState();
}

class _ListeState extends State<Liste> {

  @override
  Widget build(BuildContext context) {

    final taille = MediaQuery.of(context).size.width / 2.5;

    return new ListView.builder(
      itemCount: widget.feed.items.length,
      itemBuilder: (context, i) {
        RssItem item = widget.feed.items[i];
        return new Container(
          child: new Card(
              elevation: 10.0,
              child: new InkWell(
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
                    return new PageDetail(item);
                  }));
                },
                child: new Column(
                  children: <Widget>[
                    padding(),
                    new Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Texte(item.author ?? ""),
                        new Texte(new DateConvertisseur().convertirDate(item.pubDate ?? ""), color: Colors.red,),
                      ],
                    ),
                    padding(),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Card(
                          elevation: 7.5,
                          child: new Container(
                            width: taille,
                            child: item.enclosure != null ?
                            new Image.network(item.enclosure.url, fit: BoxFit.fill) :
                            new Image.asset("images/imagination.png", fit: BoxFit.fill),
                          ),
                        ),
                        new Container(
                          width: taille,
                          margin: EdgeInsets.only(right: 15),
                          child: new Texte(item.title),
                        )
                      ],
                    ),
                    padding()
                  ],
                ),
              )
          ),
          padding: EdgeInsets.only(right: 7.5, left: 7.5),
        );
      },
    );
  }

  Padding padding() {
    return new Padding(padding: EdgeInsets.only(top: 10.0, right: 2.5, left: 2.5));
  }
}