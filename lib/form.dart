import 'package:cornell_notes/main.dart';
import 'package:cornell_notes/ui/painter/notebook_painter.dart';
import 'package:flutter/material.dart';

import 'package:cornell_notes/const.dart';
import 'package:cornell_notes/models.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({Key? key, this.caderno}) : super(key: key);

  final Caderno? caderno;

  @override
  _NoteFormState createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _focusTitulo = FocusNode();
  final _titulo = TextEditingController(text: 'Caderno/Folha');
  final _sumario = TextEditingController();
  final _topicos = TextEditingController();
  final _anotacoes = TextEditingController();
  late int? _id;

  @override
  void initState() {
    super.initState();
    if (widget.caderno != null) {
      _sumario.text = widget.caderno!.sumario!;
      _titulo.text = widget.caderno!.titulo!;
      _topicos.text = widget.caderno!.topicos!;
      _anotacoes.text = widget.caderno!.anotacoes!;
      _id = widget.caderno!.id;
    } else {
      _id = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextField(
          focusNode: _focusTitulo,
          controller: _titulo,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.white,
                fontFamily: 'PatrickHand',
              ),
          textAlign: TextAlign.center,
          cursorColor: Colors.white,
          onTap: () => _titulo.selection =
              TextSelection(baseOffset: 0, extentOffset: _titulo.text.length),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Caderno caderno = Caderno(
                  _titulo.text,
                  anotacoes: _anotacoes.text,
                  sumario: _sumario.text,
                  topicos: _topicos.text,
                );
                if (_id != null) {
                  caderno.id = _id!;
                }
                objectBox.cadernoBox.put(caderno);
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.save,
                color: Colors.white,
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 9,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Text(
                              'Tópicos',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _topicos,
                                minLines: null,
                                maxLines: null,
                                expands: true,
                                decoration:
                                    InputDecoration(hintText: 'Lorem ipsum'),
                                style: TextStyle(fontSize: notebookLineSize),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                          children: [
                            Text('Anotações e perguntas',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      fontFamily: 'PatrickHand',
                                    )),
                            Expanded(
                              child: CustomPaint(
                                painter: NotebookPainter(),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: notebookLineSize - 7,
                                  ),
                                  child: TextField(
                                    controller: _anotacoes,
                                    minLines: null,
                                    maxLines: null,
                                    expands: true,
                                    decoration: const InputDecoration(
                                      hintText: 'Lorem ipsum',
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                    style: const TextStyle(
                                      fontSize: notebookLineSize - 6.5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text('Sumário',
                        style: Theme.of(context).textTheme.headline5),
                    Expanded(
                      child: TextField(
                        controller: _sumario,
                        minLines: null,
                        maxLines: null,
                        expands: true,
                        decoration: InputDecoration(hintText: 'Lorem ipsum'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
