import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'dao/caderno_dao.dart';
import 'entity/caderno.dart';

part 'database.g.dart';

@Database(version: 1, entities: [Caderno])
abstract class AppDatabase extends FloorDatabase {
  CadernoDao get cadernoDao;
}
