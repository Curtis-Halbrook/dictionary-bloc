import 'package:dictionary_bloc/dictionary_rdss/model/dictionary_model.dart';

import 'dictionary_datastore.dart';

class MemoryDictionaryDataStore extends DictionaryDataStore {
  MemoryDictionaryDataStore() {
    this._storage = new Map<String, List<Definition>>();
  }

  @override
  Future<List<Definition>?> getDefinitions(String word) async {
    return Future.microtask(() => _storage[word]);
  }

  @override
  Future<void> saveDefinitions(
      List<Definition> definitions, String word) async {
    return Future.microtask(() => _storage[word] = definitions);
  }

  var _storage;
}
