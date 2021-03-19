import 'package:dictionary_bloc/dictionary_rdss/model/dictionary_model.dart';

abstract class DictionaryDataStore {
  Future<List<Definition>?> getDefinitions(String word);

  Future<void> saveDefinitions(List<Definition> definitions, String word);
}
