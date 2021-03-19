import 'package:dictionary_bloc/search_bar/searchbar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBarBloc, SearchBarState>(
      builder: (context, state) {
        return Container(
          child: TextFormField(
            initialValue: state.text,
            onChanged: (text) =>
                context.read<SearchBarBloc>().add(SearchBarTextChanged(text)),
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () =>
                    context.read<SearchBarBloc>().add(SearchBarTextChanged('')),
              ),
            ),
          ),
        );
      },
    );
  }
}
