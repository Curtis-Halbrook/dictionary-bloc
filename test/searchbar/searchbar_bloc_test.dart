import 'package:dictionary_bloc/search_bar/searchbar_bloc.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('Test core behavior of the SearchBarBloc', () {
    blocTest(
      'Emits [] when initialized',
      build: () => SearchBarBloc(),
      expect: () => [],
    );
    blocTest<SearchBarBloc, SearchBarState>(
      "Emits [SearchBarState('text') when SearchBarTextChanged('text') is sent",
      build: () => SearchBarBloc(),
      act: (bloc) => bloc.add(
        SearchBarTextChanged('test'),
      ),
      expect: () => [SearchBarState('test')],
    );
  });
}
