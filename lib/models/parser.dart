import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart';

class Parser {
  final macrumors = "http://feeds.macrumors.com/MacRumors-All";
  final url = "https://www.france24.com/fr/rss";

  void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  Future chargerRSS() async {
    final reponse = await get(macrumors);
    if (reponse.statusCode == 200) {
      final feed = RssFeed.parse(reponse.body);
      return feed;
    } else {
      print("Error \n" + reponse.body);
    }
  }
}