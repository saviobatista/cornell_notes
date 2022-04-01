import 'dart:async';

import 'package:cornell_notes/dao/caderno_dao.dart';
import 'package:cornell_notes/form.dart';
import 'package:cornell_notes/entity/caderno.dart';
import 'package:cornell_notes/database.dart';
import 'package:flutter/material.dart';
import 'components/notebook.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('cornell.notes').build();
  final dao = database.cadernoDao;
  runApp(CornellNotes(dao));
}

class CornellNotes extends StatelessWidget {
  final CadernoDao dao;
  const CornellNotes(this.dao, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cornell Notes',
      theme: ThemeData(
        fontFamily: 'PatrickHand',
        primarySwatch: Colors.brown,
        textSelectionTheme:
            const TextSelectionThemeData(selectionColor: Colors.grey),
      ),
      home: Home(dao),
    );
  }
}

class Home extends StatefulWidget {
  final CadernoDao dao;
  const Home(this.dao, {Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NoteForm(widget.dao)));
        },
      ),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (v) => setState(() => _search = v),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(20),
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                hintText: 'Pesquise...',
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Caderno>>(
                stream: widget.dao
                    .findCadernoByTitulo(_search == null ? '%' : '%$_search%'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return Text(snapshot.error.toString());
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 150,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, idx) => Notebook(
                      widget.dao,
                      caderno: snapshot.data![idx],
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
