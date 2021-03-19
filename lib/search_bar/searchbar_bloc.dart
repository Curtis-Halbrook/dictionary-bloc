import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

//
//Events
@immutable
abstract class SearchBarEvent extends Equatable {
  const SearchBarEvent();
}

class SearchBarTextChanged extends SearchBarEvent {
  final String newText;

  const SearchBarTextChanged(this.newText);

  @override
  List<Object> get props => [newText];
}

//
//State
//Could have just been a String, but I want to test class behavior here
class SearchBarState extends Equatable {
  final String text;

  const SearchBarState(this.text);

  @override
  List<Object> get props => [text];
}

//
//The Bloc!
class SearchBarBloc extends Bloc<SearchBarEvent, SearchBarState> {
  SearchBarBloc() : super(SearchBarState(''));

  @override
  Stream<Transition<SearchBarEvent, SearchBarState>> transformEvents(
    Stream<SearchBarEvent> events,
    Stream<Transition<SearchBarEvent, SearchBarState>> Function(
      SearchBarEvent event,
    )
        transitionFn,
  ) {
    return events
        .debounceTime(const Duration(milliseconds: 700))
        .switchMap(transitionFn);
  }

  @override
  Stream<SearchBarState> mapEventToState(SearchBarEvent event) async* {
    //We only have one Event, but let's do the "if..is if..is else" dance
    //for practice
    if (event is SearchBarTextChanged) {
      final String text = event.newText;
      yield SearchBarState(text);
    }
  }
}
