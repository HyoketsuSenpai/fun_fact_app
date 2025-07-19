class Fact {
  final String funFactText;

  Fact({this.funFactText = 'Loading...'});

  factory Fact.fromJson(Map<String, dynamic> json) {
    return Fact(funFactText: json['text']);
  }
}
