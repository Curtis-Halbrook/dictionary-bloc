import 'dart:async';

import 'package:dictionary_bloc/definition_results/defnition_results_bloc.dart';
import 'package:dictionary_bloc/dictionary_rdss/repository/dictionary_repository.dart';
import 'package:dictionary_bloc/search_bar/searchbar_bloc.dart';
import 'package:flutter/material.dart';

class DefinitionLookupBlocs {
  final SearchBarBloc searchBarBloc = SearchBarBloc();
  final DefinitionResultsBloc definitionResultsBloc = DefinitionResultsBloc();

  DictionaryRepository _dictionaryRepository;
  late StreamSubscription _searchBarBlocSubscription;

  DefinitionLookupBlocs(this._dictionaryRepository) {
    //Here, we will set up the listeners and behaviors between our two
    //blocs and our Repo to coordinate user activity to network lookups
    //and results

    //First, we need to know when the user changes the SearchBar using
    //the SearchBarBloc we'll be giving to the Widget.
    //Then, we'll look up the definitions, and pipe the results to the
    //definition results bloc via an Updated event.
    _searchBarBlocSubscription = searchBarBloc.stream.listen((state) async {
      final searchText = state.text;
      final definitions =
          await _dictionaryRepository.findDefinitions(searchText);
      if (definitions != null) {
        definitionResultsBloc.add(DefinitionResultsUpdated(definitions));
      }
    });
  }

  void dispose() {
    _searchBarBlocSubscription.cancel();
  }
}
