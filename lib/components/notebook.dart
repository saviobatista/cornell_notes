import 'package:cornell_notes/form.dart';
import 'package:flutter/material.dart';

class Notebook extends StatefulWidget {
  final int id;
  final String rotulo;

  const Notebook({Key? key, required this.id, required this.rotulo})
      : super(key: key);

  @override
  _NotebookState createState() => _NotebookState();
}

class _NotebookState extends State<Notebook> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: const BoxDecoration(
          border: Border(left: BorderSide(width: 10.0, color: Colors.black)),
        ),
        child: Container(
          width: 70.0,
          height: 100.0,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.horizontal(right: Radius.circular(10.0)),
          ),
          child: Text(
            widget.rotulo,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
      ),
      onTap: () {
        print('TAP EM ${widget.id} - ${widget.rotulo}');
      },
      onDoubleTap: () {
        print('DOUBLE TAP EM ${widget.id} - ${widget.rotulo}');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NoteForm()));
      },
    );
  }
}
