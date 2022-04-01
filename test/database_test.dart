import 'package:cornell_notes/entity/caderno.dart';
import 'package:test/test.dart';
import 'package:cornell_notes/database.dart';

void main() async {
  test('Complete test of database connection', () async {
    /// Connection, cornell_tests.notes to avoid erase production data
    final database =
        await $FloorAppDatabase.databaseBuilder('cornell_tests.notes').build();

    /// Data Access Object
    final dao = database.cadernoDao;

    /// Erase all table data
    await dao.deleteAllCadernos();

    /// Check rows count
    final count1 = await dao.findAllCadernos();
    expect(count1.length, 0);

    /// Insert
    Caderno caderno = Caderno(
      null,
      'Título',
      'Tópicos',
      'Anotações',
      'Sumário',
      DateTime.now().toString(),
    );
    dao.insertCaderno(caderno);

    /// Check insert
    final count2 = await dao.findAllCadernos();
    expect(count2.length, 1);

    /// First record inser should have id = 1
    expect(count2[0].id, 1);

    /// Delete
    dao.deleteCaderno(count2[0]);
    final count3 = await dao.findAllCadernos();
    expect(count3.length, 0);
  });
}
