import 'package:intl/intl.dart';

class DateConvertisseur {

  String convertirDate(String str) {
    String il = "il y a";
    String format = "EEE, dd MMM yyyy HH:mm:ss Z";
    var formateur = DateFormat(format);
    DateTime dateTime = formateur.parse(str);

    if (dateTime == null) {
      return "Date inconnue";
    } else {
      var difference = new DateTime.now().difference(dateTime);
      var jours = difference.inDays;
      var heures = difference.inHours;
      var minutes = difference.inMinutes;

      if (jours > 1) {
        return "$il $jours jours";
      } else if (jours == 1) {
        return "$il 1 jour";
      } else if (heures > 1) {
        return "$il $heures heures";
      } else if (heures == 1) {
        return "$il 1 heure";
      } else if (minutes > 1) {
        return "$il $minutes minutes";
      } else if (minutes == 1) {
        return "$il 1 minute";
      } else {
        return "$il 0 minute";
      }
    }
  }
}