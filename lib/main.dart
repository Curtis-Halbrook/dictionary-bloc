import 'package:dictionary_bloc/definition_lookup/definition_lookup.dart';
import 'package:dictionary_bloc/dictionary_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

void main() {
  Bloc.observer = DictionaryBlocObserver(); //Allows global bloc debugging
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Definitions',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Find Definitions'),
        ),
        body: Container(
          child: DefinitionLookup(),
        ),
      ),
    );
  }
}
