import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:pokemon_weakness/src/data/local/model/pokemon_interaction_lm.dart';
import 'package:pokemon_weakness/src/data/local/model/pokemon_type_lm.dart';

abstract class PokemonTypeLDSProtocol {
  Future<List<PokemonTypeLM>> getPokemonTypeList();
}

class PokemonTypeLDS implements PokemonTypeLDSProtocol {
  final _resourcePath = "assets/json/pokemon_interaction_list.json";

  @override
  Future<List<PokemonTypeLM>> getPokemonTypeList() =>
      rootBundle.loadString(_resourcePath).then(
        (json) {
          final data = jsonDecode(json);
          return PokemonInteractionLM.fromJson(data).defensive;
        },
      );
}
