import 'package:floor/floor.dart';

@entity
class Caderno {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String? titulo;
  final String? topicos;
  final String? anotacoes;
  final String? sumario;
  final String? atualizadoEm;

  Caderno(this.id, this.titulo, this.topicos, this.anotacoes, this.sumario,
      this.atualizadoEm);
}
