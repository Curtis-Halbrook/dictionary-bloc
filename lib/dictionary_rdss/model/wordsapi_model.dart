import 'dictionary_model.dart';

class WordsAPIResult {
  final String word;
  final List<Definition> definitions;

  WordsAPIResult(this.word, this.definitions);

  factory WordsAPIResult.fromJson(Map<String, dynamic> json) {
    return WordsAPIResult(
        json["word"],
        (json['definitions'] as List)
            .map((def) => Definition.fromJson(def))
            .toList());
  }
}
