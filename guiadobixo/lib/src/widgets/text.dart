import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';


class CustomTextStyle {
  static const Color color = Color(0xff24283b);
  static const String fontFamily = "Relaway";
  static const double fontSize = 20;
}

class NormalText extends TextSpan {
  static const TextStyle customStyle = TextStyle(
    color: CustomTextStyle.color,
    fontFamily: CustomTextStyle.fontFamily,
    fontSize: CustomTextStyle.fontSize,
  );

  const NormalText({text}) : super(text: text, style: customStyle);
  const NormalText.withChildren({text, children})
      : super(text: text, children: children, style: customStyle);
}

class LinkText extends TextSpan {
  static const TextStyle customStyle = TextStyle(
    color: Colors.blue,
    fontFamily: CustomTextStyle.fontFamily,
    fontSize: CustomTextStyle.fontSize,
  );

  final String url;

  LinkText({text, required this.url}) : super(text: text, style: customStyle, recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse(url)));
}

class BoldText extends TextSpan {
  static const TextStyle customStyle = TextStyle(
    color: CustomTextStyle.color,
    fontFamily: CustomTextStyle.fontFamily,
    fontSize: CustomTextStyle.fontSize,
    fontWeight: FontWeight.bold,
  );

  const BoldText({text}) : super(text: text, style: customStyle);
  const BoldText.withChildren({text, children})
      : super(text: text, children: children, style: customStyle);
}

class TitleText extends Text {
  static const TextStyle customStyle = TextStyle(
    color: CustomTextStyle.color,
    fontFamily: CustomTextStyle.fontFamily,
    fontSize: 2 * CustomTextStyle.fontSize,
    fontWeight: FontWeight.w400,
  );

  const TitleText({super.key, text}) : super(text, style: customStyle, textAlign: TextAlign.center);
}
