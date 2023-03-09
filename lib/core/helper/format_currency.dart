
import 'package:intl/intl.dart';

//Format Currency
formattedCurrency(nominal){
  String result;
  try{
    final formatMoney = NumberFormat("#,##0", "en_US");
    result = formatMoney.format(int.parse(nominal.toString())).replaceAll(',', '.');
  }on FormatException catch(e){
    result = '-';
  }
  return result;
}