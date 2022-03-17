import 'package:cornell_notes/models.dart';

import 'objectbox.g.dart';

class ObjectBox {
  late final Store store;

  late final Box<Caderno> cadernoBox;

  late final Stream<Query<Caderno>> queryStream;

  ObjectBox._create(this.store) {
    cadernoBox = Box<Caderno>(store);

    final qBuilder = cadernoBox.query()
      ..order(Caderno_.id, flags: Order.descending);
    queryStream = qBuilder.watch(triggerImmediately: true);

    if (cadernoBox.isEmpty()) {
      _addExemplos();
    }
  }

  static Future<ObjectBox> create() async {
    final store = openStore(
      //macosApplicationGroup: 'ZWNG9622DW.cornellNotes',
      macosApplicationGroup: 'ZWNG9622DW.com.saviobatista',
    );
    return ObjectBox._create(store);
  }

  void _addExemplos() {
    cadernoBox.putMany([
      Caderno(
        'Teste',
        anotacoes: 'Lorem ipsum',
        sumario: 'lorem ipsum dolor',
        topicos: 'Ipsum dilit meat der meat',
      ),
    ]);
  }
}
