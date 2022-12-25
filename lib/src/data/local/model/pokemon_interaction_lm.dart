import 'package:json_annotation/json_annotation.dart';
import 'package:pokemon_weakness/src/data/local/model/pokemon_type_lm.dart';

part 'pokemon_interaction_lm.g.dart';

@JsonSerializable()
class PokemonInteractionLM {
  const PokemonInteractionLM({
    required this.defensive,
  });

  final List<PokemonTypeLM> defensive;

  factory PokemonInteractionLM.fromJson(Map<String, dynamic> json) =>
      _$PokemonInteractionLMFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonInteractionLMToJson(this);
}
