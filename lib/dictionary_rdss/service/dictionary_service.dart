import 'package:dictionary_bloc/dictionary_rdss/model/dictionary_model.dart'
    show Definition;

abstract class DictionaryService {
  Future<List<Definition>?> findDefinitions(String word);
}
