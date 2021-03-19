import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dictionary_bloc/dictionary_rdss/model/dictionary_model.dart';
import 'package:dictionary_bloc/dictionary_rdss/repository/dictionary_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'dictionary_event.dart';
part 'dictionary_state.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  final DictionaryRepository dictionaryRepository;

  DictionaryBloc(this.dictionaryRepository) : super(DictionaryEmpty());

  @override
  Stream<DictionaryState> mapEventToState(DictionaryEvent event) async* {
    if (event is TextChanged) {
      final String searchTerm = event.text;
      if (searchTerm.isEmpty) {
        yield DictionaryEmpty();
      } else {
        yield DictionarySearching();
        try {
          final definitions =
              await dictionaryRepository.findDefinitions(searchTerm);
          yield DictionaryLookupSuccess(definitions ?? []);
        } catch (error) {
          yield DictionaryLookupError("Something went wrong");
        }
      }
    }
  }
}
