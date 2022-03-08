import 'package:objectbox/objectbox.dart';

@Entity()
class Caderno {
  int id = 0;
  String? titulo;
  String? topicos;
  String? anotacoes;
  String? sumario;
  DateTime atualizadoEm = DateTime.now();

  Caderno(this.titulo, {this.topicos, this.anotacoes, this.sumario});
}
