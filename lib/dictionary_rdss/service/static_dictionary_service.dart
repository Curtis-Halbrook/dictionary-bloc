import 'package:dictionary_bloc/dictionary_rdss/model/dictionary_model.dart';
import 'package:dictionary_bloc/dictionary_rdss/service/dictionary_service.dart';

class StaticDictionaryService extends DictionaryService {
  @override
  Future<List<Definition>?> findDefinitions(String word) async {
    return Future<List<Definition>?>.microtask(() => [
          Definition('Flat-topped butt-resting thing', 'noun'),
          Definition('Character from PeeWee\'s Playhouse', 'noun')
        ]);
  }
}
