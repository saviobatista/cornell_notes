import 'package:flutter/material.dart';
import 'package:cornell_notes/const.dart';

class NotebookPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //Step 1
    final paintgrey = Paint()..color = Colors.grey;
    var rrectRed =
        RRect.fromLTRBR(0, 0, size.width, size.height, Radius.circular(8.0));
    canvas.drawRRect(rrectRed, paintgrey);
    //Step 2
    final paintwhite = Paint()..color = Colors.white;
    var rrectWhite =
        RRect.fromLTRBR(5, 0, size.width, size.height, Radius.circular(8.0));
    canvas.drawRRect(rrectWhite, paintwhite);
    //Step 3
    final paintdarkgrey = Paint()
      ..color = Colors.blueGrey
      ..strokeWidth = 1.0;
    final lineHeight = notebookLineSize;
    for (int i = 1; i < size.height / lineHeight; i++) {
      canvas.drawLine(
        Offset(5, (i * lineHeight).toDouble()),
        Offset(size.width.toDouble(), (i * lineHeight).toDouble()),
        paintdarkgrey,
      );
    }
  }

  @override
  bool shouldRepaint(NotebookPainter oldDelegate) {
    //TODO Implement shouldrepait
    return true;
  }

  @override
  bool shouldRebuildSemantics(NotebookPainter oldDelegate) {
    //TODO Implement shouldrebuildsemantics
    return true;
  }
}
