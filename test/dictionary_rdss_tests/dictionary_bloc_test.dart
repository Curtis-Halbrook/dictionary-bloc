import 'package:dictionary_bloc/dictionary_rdss/data_store/memory_dictionary_datastore.dart';
import 'package:dictionary_bloc/dictionary_rdss/model/dictionary_model.dart';
import 'package:dictionary_bloc/dictionary_rdss/repository/basic_dictionary_repository.dart';
import 'package:dictionary_bloc/dictionary_rdss/service/static_dictionary_service.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:dictionary_bloc/dictionary_rdss/bloc/dictionary_bloc.dart';

void main() {
  final testRepo = BasicDictionaryRepository(
    MemoryDictionaryDataStore(),
    StaticDictionaryService(),
  );

  final successfulStaticRepoReturn = DictionaryLookupSuccess([
    Definition('Flat-topped butt-resting thing', 'noun'),
    Definition('Character from PeeWee\'s Playhouse', 'noun'),
  ]);

  group('DictionaryBloc', () {
    blocTest<DictionaryBloc, DictionaryState>(
      'Just Initialized, should be at empty state, it emits nothing',
      build: () => DictionaryBloc(testRepo),
      expect: () => [],
    );
    // blocTest<DictionaryBloc, DictionaryState>(
    //   'Init, conduct search, get back results',
    //   build: () => DictionaryBloc(testRepo),
    //   act: (bloc) => bloc.add(TextChanged('Doesnt Matter')),
    //   expect: () => [
    //     DictionarySearching(),
    //     successfulStaticRepoReturn,
    //   ],
    // );
  });
}
