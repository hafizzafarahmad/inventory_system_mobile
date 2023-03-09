
import 'package:intl/intl.dart';

class FormatDate {
  FormatDate._();

  static setPlainDate(String date, {String from = "yyyy-MM-dd", String format = "dd MMMM yyyy"}){
    String formatted;
    try{
      DateFormat dateFormat = DateFormat(from);
      DateTime dateTime = dateFormat.parse(date);
      var formatter = new DateFormat(format);
      formatted = formatter.format(dateTime);
    }on FormatException catch(e){
      formatted = '-';
    }
    return formatted;
  }

  static setFormattedDate(String date){
    String formatted;
    try{
      DateFormat dateFormat = DateFormat("yyyy-MM-dd");
      DateTime dateTime = dateFormat.parse(date);
      var formatter = new DateFormat('yyyy-MM-dd');
      formatted = formatter.format(dateTime);

    }on FormatException catch(e){
      formatted = '';
    }
    return formatted;
  }

  static getFormatedDate(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(_date.toString());
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }
}