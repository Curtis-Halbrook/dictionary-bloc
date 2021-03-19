part of 'dictionary_bloc.dart';

@immutable
abstract class DictionaryState extends Equatable {
  const DictionaryState();

  @override
  List<Object> get props => [];
}

//Starting State, or state where nothing is going on
class DictionaryEmpty extends DictionaryState {}

//Loading definitions, if any
class DictionarySearching extends DictionaryState {}

//We found definitions, or none
class DictionaryLookupSuccess extends DictionaryState {
  final List<Definition> definitions;

  const DictionaryLookupSuccess(this.definitions);

  @override
  List<Object> get props => [definitions];

  @override
  String toString() =>
      'DictionaryLookupSuccess { definitions : ${definitions.length}}';
}

class DictionaryLookupError extends DictionaryState {
  final String error;

  const DictionaryLookupError(this.error);

  @override
  List<Object> get props => [error];
}
