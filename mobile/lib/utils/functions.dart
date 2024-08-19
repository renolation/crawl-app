import 'dart:convert';

List<String> getNonNullProperties(Object instance) {
  Map<String, dynamic> instanceMap = jsonDecode(jsonEncode(instance));
  List<String> nonNullProperties = [];

  instanceMap.forEach((key, value) {
    if (value != null && key != 'id' && key != 'itemCounts' && key != 'items') {
      key = convertBackToNormal(key);
      nonNullProperties.add('$key: $value');
    }
  });

  return nonNullProperties;
}


Map<String, String> getProperties(Object instance) {
  Map<String, dynamic> instanceMap = jsonDecode(jsonEncode(instance));
  Map<String, String> nonNullProperties = {};

  instanceMap.forEach((key, value) {
    if (value != null && key != 'id' && key != 'itemCounts' && key != 'items' && key!= 'ascension_max_level') {
      key = convertBackToNormal(key);
      nonNullProperties[key] = value.toString();
    }
  });
  return nonNullProperties;
}

String convertBackToNormal(String str) {
  return str
      .replaceAll('_', ' ') // Replace underscores with spaces
      .replaceAll('percent', '%') // Replace 'percent' with '%'
      .split(' ')
      .map((word) => word[0].toUpperCase() + word.substring(1)) // Capitalize first letter of each word
      .join(' ')
      .replaceAll('Atk', 'ATK') // Convert 'Atk' to 'ATK'
      .replaceAll('Atk %', 'ATK %') //
       .replaceAll('hp', 'HP') // Convert 'Atk' to 'ATK'
       .replaceAll('Hp', 'HP') // Convert 'Atk' to 'ATK'
       .replaceAll('Def', 'DEF') // Convert 'Atk' to 'ATK'
      .replaceAll('Hp %', 'HP %') // Convert 'Atk %' to 'ATK %'
      .replaceAll('Crit', 'Crit.') // Convert 'crit_rate' to 'Crit. Rate'
      .replaceAll('Dmg', 'DMG'); // Convert 'crit_dmg' to 'Crit. DMG'

}