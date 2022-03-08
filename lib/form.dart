import 'package:cornell_notes/ui/painter/notebook_painter.dart';
import 'package:flutter/material.dart';

import 'package:cornell_notes/const.dart';

class NoteForm extends StatefulWidget {
  const NoteForm({Key? key}) : super(key: key);

  @override
  _NoteFormState createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _focusTitulo = FocusNode();
  final _controlTitulo = TextEditingController(text: 'Caderno/Folha');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextField(
          focusNode: _focusTitulo,
          controller: _controlTitulo,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.white,
                fontFamily: 'PatrickHand',
              ),
          textAlign: TextAlign.center,
          cursorColor: Colors.white,
          onTap: () => _controlTitulo.selection = TextSelection(
              baseOffset: 0, extentOffset: _controlTitulo.text.length),
        ),
        actions: [
          TextButton(
              onPressed: () {},
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    fontFamily: 'PatrickHand',
                                  ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: TextEditingController(text: ''),
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
                                    controller: TextEditingController(
                                        text:
                                            'slakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflk slakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflk slakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflk slakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflk slakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflkslakfhaslkf aslkfhaslfkashf lkashf aslkf halskfh aslfkha sflkahsf lsakhf aslkfh aslkfhaslfkashflk'),
                                    minLines: null,
                                    maxLines: null,
                                    expands: true,
                                    decoration: const InputDecoration(
                                      hintText: 'Lorem ipsum',
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      fontFamily: 'PatrickHand',
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
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontFamily: 'PatrickHand',
                            )),
                    Expanded(
                      child: TextField(
                        controller: TextEditingController(text: ''),
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
