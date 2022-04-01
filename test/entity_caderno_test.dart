import 'package:test/test.dart';
import 'package:cornell_notes/entity/caderno.dart';

void main() {
  test('Create and Caderno entity with defaults', () {
    final dateTest = DateTime.now();
    final caderno = Caderno(
      null,
      'Título',
      'Tópicos',
      'Anotações',
      'Sumário',
      dateTest.toString(),
    );
    expect(caderno.id, null);
    expect(caderno.atualizadoEm, dateTest.toString());
  });
}
