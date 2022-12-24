class PokemonType {
  const PokemonType({
    required this.name,
    this.weaknessList = const [],
    this.resistanceList = const [],
    this.ineffectivenessList = const [],
  });

  final String name;
  final List<String> weaknessList;
  final List<String> resistanceList;
  final List<String> ineffectivenessList;
}
