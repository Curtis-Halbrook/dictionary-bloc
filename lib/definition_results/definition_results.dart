import 'package:dictionary_bloc/definition_results/defnition_results_bloc.dart';
import 'package:dictionary_bloc/dictionary_rdss/model/dictionary_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefinitionResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DefinitionResultsBloc, DefinitionResultsState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.definitions.length,
          padding: EdgeInsets.symmetric(vertical: 0.0),
          itemBuilder: (context, index) =>
              DefinitionResultTile(state.definitions[index]),
        );
      },
    );
  }
}

class DefinitionResultTile extends StatelessWidget {
  final Definition definition;

  DefinitionResultTile(this.definition);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 0.0,
      ),
      child: ListTile(
        isThreeLine: true,
        title: Text(definition.definition),
        subtitle: Text(definition.partOfSpeech),
      ),
    );
  }
}
