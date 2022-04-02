import 'dart:io';
import 'dart:typed_data';

import 'package:cornell_notes/entity/caderno.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PrintedNotebook {
  final Caderno caderno;

  PrintedNotebook(this.caderno);

  Future<void> print() async {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final Uint8List fontData =
          File('fonts/PatrickHand-Regular.ttf').readAsBytesSync();
      final ttf = Font.ttf(fontData.buffer.asByteData());
      final pdf = Document();
      pdf.addPage(Page(
        pageFormat: format,
        build: (Context context) {
          return Column(children: [
            Text(
              caderno.titulo ?? 'n/a',
              style: TextStyle(
                font: ttf,
                fontSize: 32,
              ),
            ),
            Expanded(
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Text(
                      caderno.topicos ?? 'n/a',
                      style: TextStyle(font: ttf, fontSize: 14),
                    ),
                    height: double.infinity,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: double.infinity,
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      caderno.anotacoes ?? 'n/a',
                      style: TextStyle(font: ttf, fontSize: 14),
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Text(
              caderno.sumario ?? 'n/a',
              style: TextStyle(font: ttf, fontSize: 16),
            ),
          ]);
        },
      ));
      return await pdf.save();
    });
  }
}
