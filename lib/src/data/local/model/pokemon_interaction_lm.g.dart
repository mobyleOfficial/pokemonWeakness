// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_interaction_lm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonInteractionLM _$PokemonInteractionLMFromJson(
        Map<String, dynamic> json) =>
    PokemonInteractionLM(
      defensive: (json['defensive'] as List<dynamic>)
          .map((e) => PokemonTypeLM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonInteractionLMToJson(
        PokemonInteractionLM instance) =>
    <String, dynamic>{
      'defensive': instance.defensive,
    };
