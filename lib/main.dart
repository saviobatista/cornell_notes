import 'dart:async';

import 'package:cornell_notes/models.dart';
import 'package:cornell_notes/store.dart';
import 'package:flutter/material.dart';
import 'components/notebook.dart';

late ObjectBox objectBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cornell Notes',
      theme: ThemeData(
        fontFamily: 'PatrickHand',
        primarySwatch: Colors.brown,
        textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.grey),
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _listController = StreamController<List<Caderno>>(sync: true);

  @override
  void initState() {
    super.initState();

    setState(() {});

    _listController.addStream(objectBox.queryStream.map((q) => q.find()));
  }

  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          print('adicionou');
        },
      ),
      body: SafeArea(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
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
                stream: _listController.stream,
                builder: (context, snapshot) => GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 150,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemBuilder: (context, idx) => Notebook(
                        id: snapshot.data![idx].id,
                        rotulo: snapshot.data![idx].titulo ?? '--',
                      ),
                    )),
          ),
        ]),
      ),
    );
  }
}
