// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type_lm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonTypeLM _$PokemonTypeLMFromJson(Map<String, dynamic> json) =>
    PokemonTypeLM(
      id: json['id'] as String,
      weaknessList: (json['weakness'] as List<dynamic>?)
          ?.map((e) => PokemonTypeLM.fromJson(e as Map<String, dynamic>))
          .toList(),
      resistanceList: (json['resistance'] as List<dynamic>?)
          ?.map((e) => PokemonTypeLM.fromJson(e as Map<String, dynamic>))
          .toList(),
      ineffectivenessList: (json['ineffectiveness'] as List<dynamic>?)
          ?.map((e) => PokemonTypeLM.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonTypeLMToJson(PokemonTypeLM instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weakness': instance.weaknessList,
      'resistance': instance.resistanceList,
      'ineffectiveness': instance.ineffectivenessList,
    };
