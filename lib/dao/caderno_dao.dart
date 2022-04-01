import 'package:cornell_notes/entity/caderno.dart';
import 'package:floor/floor.dart';

@dao
abstract class CadernoDao {
  @Query('SELECT * FROM Caderno')
  Future<List<Caderno>> findAllCadernos();

  @Query('SELECT * FROM Caderno')
  Stream<List<Caderno>> findAllCadernosAsStream();

  @Query('SELECT * FROM Caderno WHERE id = :id')
  Stream<Caderno?> findCadernoById(int id);

  @Query('SELECT * FROM Caderno WHERE titulo LIKE :titulo')
  Stream<List<Caderno>> findCadernoByTitulo(String titulo);

  @transaction
  Future<void> deleteAllCadernos() async {
    await truncateCaderno();
    await truncateCadernoSequence();
  }

  @Query('DELETE FROM SQLITE_SEQUENCE WHERE name LIKE \'Caderno\'')
  Future<void> truncateCadernoSequence();

  @Query('DELETE FROM Caderno')
  Future<void> truncateCaderno();

  @insert
  Future<void> insertCaderno(Caderno caderno);

  @delete
  Future<void> deleteCaderno(Caderno caderno);
}
