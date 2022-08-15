import 'package:flutter/material.dart';

import 'package:guiadobixo/src/widgets/text.dart';

class Paragraph extends StatelessWidget {
  final List<TextSpan> children;
  final TextAlign? textAlign;

  const Paragraph({Key? key, required this.children, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: NormalText.withChildren(text: "", children: children),
      textAlign: textAlign == null ? TextAlign.center : textAlign!,
    );
  }
}
