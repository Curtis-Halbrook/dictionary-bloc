import 'package:dictionary_bloc/dictionary_rdss/data_store/dictionary_datastore.dart';
import 'package:dictionary_bloc/dictionary_rdss/model/dictionary_model.dart';
import 'package:dictionary_bloc/dictionary_rdss/repository/dictionary_repository.dart';
import 'package:dictionary_bloc/dictionary_rdss/service/dictionary_service.dart';

class BasicDictionaryRepository extends DictionaryRepository {
  BasicDictionaryRepository(this._dataStore, this._service);

  @override
  Future<List<Definition>?> findDefinitions(String word) async {
    //First, check the data store.
    //If it isn't there, check the service.
    //If it is there, save it in the data store
    //Return whatever we have left
    List<Definition>? retVal;
    try {
      retVal = await _dataStore.getDefinitions(word);
      if (retVal == null) {
        retVal = await _service.findDefinitions(word);
        if (retVal != null) {
          await _dataStore.saveDefinitions(retVal, word);
        }
      }
      return retVal;
    } catch (Exception) {
      return retVal; //So, for this simple example, we'll just eat any exceptions
    }
  }

  final DictionaryDataStore _dataStore;
  final DictionaryService _service;
}
