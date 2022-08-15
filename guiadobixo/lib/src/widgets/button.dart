import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';

class CopyButton extends StatefulWidget {
  final String text;
  final List<String> toCopy;

  const CopyButton({super.key, required this.text, required this.toCopy});

  @override
  State<CopyButton> createState() => _CopyButtonState();
}

class _CopyButtonState extends State<CopyButton> {
  num clicks = -1;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (widget.toCopy.isEmpty) {
          return;
        }

        clicks = (clicks + 1) % widget.toCopy.length;

        String textToCopy = widget.toCopy[clicks.toInt()];

        Clipboard.setData(ClipboardData(text: textToCopy));
        Fluttertoast.showToast(msg: "$textToCopy copiado");
      },
      child:
          Text(widget.text, style: const TextStyle(color: Colors.black, fontSize: 18)),
    );
  }
}
