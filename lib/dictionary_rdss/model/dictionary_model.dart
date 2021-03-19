class Definition {
  final String definition;
  final String partOfSpeech;

  Definition(this.definition, this.partOfSpeech);

  Definition.fromJson(Map<String, dynamic> json)
      : definition = json["definition"],
        partOfSpeech = json["partOfSpeech"];
}
