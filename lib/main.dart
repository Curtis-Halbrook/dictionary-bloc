import 'package:dictionary_bloc/definition_lookup/definition_lookup.dart';
import 'package:dictionary_bloc/dictionary_bloc_observer.dart';
import 'package:dictionary_bloc/dictionary_rdss/data_store/memory_dictionary_datastore.dart';
import 'package:dictionary_bloc/dictionary_rdss/repository/basic_dictionary_repository.dart';
import 'package:dictionary_bloc/dictionary_rdss/service/wordsapi_dictionary_service.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = DictionaryBlocObserver(); //Allows global bloc debugging
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Definitions',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Find Definitions'),
        ),
        body: RepositoryProvider(
          create: (context) => BasicDictionaryRepository(
            MemoryDictionaryDataStore(),
            WordsApiDictionaryService(),
          ),
          child: Container(
            child: DefinitionLookup(),
          ),
        ),
      ),
    );
  }
}
