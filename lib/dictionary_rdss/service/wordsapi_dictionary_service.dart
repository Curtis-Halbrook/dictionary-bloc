import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dictionary_bloc/dictionary_rdss/model/wordsapi_model.dart';
import 'package:dictionary_bloc/dictionary_rdss/model/dictionary_model.dart';
import 'package:dictionary_bloc/dictionary_rdss/service/dictionary_service.dart';

class WordsApiDictionaryService extends DictionaryService {
  @override
  Future<List<Definition>?> findDefinitions(String word) async {
    var host = 'wordsapiv1.p.rapidapi.com';
    var api = 'words/$word/definitions';
    var uri = Uri.https(host, api);
    var headers = {
      "x-rapidapi-key": "1c3cf44911mshe46545b61220b7cp176b0djsn99c74eac6a4c",
      "x-rapidapi-host": "wordsapiv1.p.rapidapi.com"
    };

    final response = await http.get(uri, headers: headers);

    switch (response.statusCode) {
      case 200:
        var result = response.body;
        if (result.length > 0) {
          final json = jsonDecode(result);
          return WordsAPIResult.fromJson(json).definitions;
        } else {
          return null;
        }

      case 404:
        return null;

      default:
        throw Exception('Response Code: $response.statusCode');
    }
  }
}
