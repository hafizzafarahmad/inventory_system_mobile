import 'package:flutter/material.dart';

import '../../../core/style/app_color.dart';

//all Button of this app customize here
class ButtonWidget{
  // this constructor prevents instantiation and extension.
  ButtonWidget._();

  static Widget light({VoidCallback? onPress, required String text, double? fontSize, Color? color}){
    return ElevatedButton(
      onPressed: onPress ?? (){},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        side:  BorderSide(width: 1, color: color == null ? AppColor.mainColor : Colors.white,),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10),)
        ),
        backgroundColor: color ?? Colors.white,
        shadowColor: Colors.white,
      ),
      child: Text(text,
        style: TextStyle(
            color: color == null ? AppColor.mainColor : Colors.white,
            fontSize: fontSize ?? 13
        ),
      ),
    );
  }

  static Widget submit({VoidCallback? onPress, required String text, double? fontSize}){
    return ElevatedButton(
      onPressed: onPress ?? (){},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        side:  const BorderSide(width: 2, color: AppColor.mainColor,),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10),)
        ),
        backgroundColor:  AppColor.mainColor,
        shadowColor: Colors.white,
      ),
      child: Text(text,
        style: TextStyle(
            color: Colors.white,
            fontSize: fontSize ?? 13
        ),
      ),
    );
  }
}

