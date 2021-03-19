part of 'dictionary_bloc.dart';

//We extend Equatable so that we can compare instances of DictionarEvent;
// by default, the equality operator returns true if and only if this and
//other are the same instance.

@immutable
abstract class DictionaryEvent extends Equatable {
  const DictionaryEvent();
}

class TextChanged extends DictionaryEvent {
  final String text;

  const TextChanged(this.text);

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'TextChanged { text: $text }';
}
