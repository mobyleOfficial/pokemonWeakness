class PokemonType {
  const PokemonType({
    required this.id,
    this.weaknessList = const [],
    this.resistanceList = const [],
    this.ineffectivenessList = const [],
  });

  final String id;
  final List<String> weaknessList;
  final List<String> resistanceList;
  final List<String> ineffectivenessList;
}
