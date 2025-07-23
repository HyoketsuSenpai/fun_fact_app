import 'dart:convert';

import 'package:fun_fact_app_flutter/model/fact.dart';
import 'package:http/http.dart' as http;

class FunFactRepository {
  static Future<Fact> loadFunFact() async {
    final Fact fact;

    try {
      final uri = Uri.parse(
        'https://uselessfacts.jsph.pl/api/v2/facts/random?language=en',
      );

      final response = await http.get(uri).timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body) as Map<String, dynamic>;
        fact = Fact.fromJson(parsed);
      } else {
        throw Exception("Couldn't load fun fact");
      }
    } catch (e) {
      throw Exception("Couldn't load fun fact");
    }

    return fact;
  }
}
