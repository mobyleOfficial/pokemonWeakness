import 'package:json_annotation/json_annotation.dart';

part 'pokemon_type_lm.g.dart';

@JsonSerializable()
class PokemonTypeLM {
  const PokemonTypeLM({
    required this.id,
    this.weaknessList,
    this.resistanceList,
    this.ineffectivenessList,
  });

  final String id;

  @JsonKey(name: "weakness")
  final List<PokemonTypeLM>? weaknessList;

  @JsonKey(name: "resistance")
  final List<PokemonTypeLM>? resistanceList;

  @JsonKey(name: "ineffectiveness")
  final List<PokemonTypeLM>? ineffectivenessList;

  factory PokemonTypeLM.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeLMFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeLMToJson(this);
}
