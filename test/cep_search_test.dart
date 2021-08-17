

import 'package:cep_search/cep_search.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Consumir api viacep', () async {
    final viacepSearch = await ViaCepSearch.getInstance('15060035');
    expect(viacepSearch, isA<ViaCepSearch>());
  });
}
