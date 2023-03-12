import 'package:flutter/material.dart';
import 'package:inventory_system/core/style/size_apps.dart';

class ErrorNoDataPage extends StatelessWidget {
  final String messages;
  final GestureTapCallback? onTap;
final double height;
  const ErrorNoDataPage({Key? key, required this.messages, this.onTap,  this.height=200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeApps.width(context, size: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/no-data.png', height: height, width: 200,),
          Text(messages, style: const TextStyle(
            color: Colors.grey,
            fontSize: 16,

          )
          ),
        ],
      ),
    );
  }
}