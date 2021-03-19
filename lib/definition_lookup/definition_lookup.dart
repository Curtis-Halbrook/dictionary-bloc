import 'package:dictionary_bloc/definition_lookup/bloc/definition_lookup_blocs.dart';
import 'package:dictionary_bloc/definition_results/definition_results.dart';
import 'package:dictionary_bloc/definition_results/defnition_results_bloc.dart';
import 'package:dictionary_bloc/dictionary_rdss/data_store/memory_dictionary_datastore.dart';
import 'package:dictionary_bloc/dictionary_rdss/repository/basic_dictionary_repository.dart';
import 'package:dictionary_bloc/dictionary_rdss/service/wordsapi_dictionary_service.dart';
import 'package:dictionary_bloc/search_bar/searchbar.dart';
import 'package:dictionary_bloc/search_bar/searchbar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class DefinitionLookup extends StatefulWidget {
  @override
  _DefinitionLookupState createState() => _DefinitionLookupState();
}

class _DefinitionLookupState extends State<DefinitionLookup> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => DefinitionLookupBlocs(
        BasicDictionaryRepository(
          MemoryDictionaryDataStore(),
          WordsApiDictionaryService(),
        ),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<SearchBarBloc>(
              create: (context) =>
                  context.read<DefinitionLookupBlocs>().searchBarBloc),
          BlocProvider<DefinitionResultsBloc>(
              create: (context) =>
                  context.read<DefinitionLookupBlocs>().definitionResultsBloc),
        ],
        child: Container(
          child: Column(
            children: [
              SearchBar(),
              const Padding(padding: EdgeInsets.all(12)),
              Expanded(
                child: DefinitionResults(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
