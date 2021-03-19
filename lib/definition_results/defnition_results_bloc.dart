import 'package:dictionary_bloc/dictionary_rdss/model/dictionary_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

//
//Events
abstract class DefinitionResultsEvent extends Equatable {
  const DefinitionResultsEvent();
}

class DefinitionResultsUpdated extends DefinitionResultsEvent {
  final List<Definition> newDefinitions;

  const DefinitionResultsUpdated(this.newDefinitions);

  @override
  List<Object> get props => [newDefinitions];
}

//
//State
class DefinitionResultsState extends Equatable {
  final List<Definition> definitions;
  const DefinitionResultsState(this.definitions);

  @override
  List<Object> get props => [definitions];
}

//
//Bloc
class DefinitionResultsBloc
    extends Bloc<DefinitionResultsEvent, DefinitionResultsState> {
  DefinitionResultsBloc() : super(DefinitionResultsState([]));

  @override
  Stream<DefinitionResultsState> mapEventToState(
      DefinitionResultsEvent event) async* {
    if (event is DefinitionResultsUpdated) {
      final List<Definition> defs = event.newDefinitions;
      yield DefinitionResultsState(defs);
    }
  }
}
