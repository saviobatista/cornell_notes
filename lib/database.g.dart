// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CadernoDao? _cadernoDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Caderno` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `titulo` TEXT, `topicos` TEXT, `anotacoes` TEXT, `sumario` TEXT, `atualizadoEm` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CadernoDao get cadernoDao {
    return _cadernoDaoInstance ??= _$CadernoDao(database, changeListener);
  }
}

class _$CadernoDao extends CadernoDao {
  _$CadernoDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _cadernoInsertionAdapter = InsertionAdapter(
            database,
            'Caderno',
            (Caderno item) => <String, Object?>{
                  'id': item.id,
                  'titulo': item.titulo,
                  'topicos': item.topicos,
                  'anotacoes': item.anotacoes,
                  'sumario': item.sumario,
                  'atualizadoEm': item.atualizadoEm
                },
            changeListener),
        _cadernoDeletionAdapter = DeletionAdapter(
            database,
            'Caderno',
            ['id'],
            (Caderno item) => <String, Object?>{
                  'id': item.id,
                  'titulo': item.titulo,
                  'topicos': item.topicos,
                  'anotacoes': item.anotacoes,
                  'sumario': item.sumario,
                  'atualizadoEm': item.atualizadoEm
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Caderno> _cadernoInsertionAdapter;

  final DeletionAdapter<Caderno> _cadernoDeletionAdapter;

  @override
  Future<List<Caderno>> findAllCadernos() async {
    return _queryAdapter.queryList('SELECT * FROM Caderno',
        mapper: (Map<String, Object?> row) => Caderno(
            row['id'] as int?,
            row['titulo'] as String?,
            row['topicos'] as String?,
            row['anotacoes'] as String?,
            row['sumario'] as String?,
            row['atualizadoEm'] as String?));
  }

  @override
  Stream<List<Caderno>> findAllCadernosAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Caderno',
        mapper: (Map<String, Object?> row) => Caderno(
            row['id'] as int?,
            row['titulo'] as String?,
            row['topicos'] as String?,
            row['anotacoes'] as String?,
            row['sumario'] as String?,
            row['atualizadoEm'] as String?),
        queryableName: 'Caderno',
        isView: false);
  }

  @override
  Stream<Caderno?> findCadernoById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Caderno WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Caderno(
            row['id'] as int?,
            row['titulo'] as String?,
            row['topicos'] as String?,
            row['anotacoes'] as String?,
            row['sumario'] as String?,
            row['atualizadoEm'] as String?),
        arguments: [id],
        queryableName: 'Caderno',
        isView: false);
  }

  @override
  Stream<List<Caderno>> findCadernoByTitulo(String titulo) {
    return _queryAdapter.queryListStream(
        'SELECT * FROM Caderno WHERE titulo LIKE ?1',
        mapper: (Map<String, Object?> row) => Caderno(
            row['id'] as int?,
            row['titulo'] as String?,
            row['topicos'] as String?,
            row['anotacoes'] as String?,
            row['sumario'] as String?,
            row['atualizadoEm'] as String?),
        arguments: [titulo],
        queryableName: 'Caderno',
        isView: false);
  }

  @override
  Future<void> truncateCadernoSequence() async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM SQLITE_SEQUENCE WHERE name LIKE \'Caderno\'');
  }

  @override
  Future<void> truncateCaderno() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Caderno');
  }

  @override
  Future<void> insertCaderno(Caderno caderno) async {
    await _cadernoInsertionAdapter.insert(caderno, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteCaderno(Caderno caderno) async {
    await _cadernoDeletionAdapter.delete(caderno);
  }

  @override
  Future<void> deleteAllCadernos() async {
    if (database is sqflite.Transaction) {
      await super.deleteAllCadernos();
    } else {
      await (database as sqflite.Database)
          .transaction<void>((transaction) async {
        final transactionDatabase = _$AppDatabase(changeListener)
          ..database = transaction;
        await transactionDatabase.cadernoDao.deleteAllCadernos();
      });
    }
  }
}
