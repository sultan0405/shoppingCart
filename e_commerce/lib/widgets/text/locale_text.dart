import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/init/extension/string_extencion.dart';



class LocaleText extends StatelessWidget {

  final String text;
  TextStyle? style;
   LocaleText({Key? key, required this.text, this.style}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Text(text.locale, style: style,);
  }
}