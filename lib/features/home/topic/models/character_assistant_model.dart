class CharacterAssistant {
  final int id;
  final String name;
  final String description;
  final String iconUrl;
  final String bgImageUrl;
  final bool premiumActive;
  CharacterAssistant({
    required this.id,
    required this.name,
    required this.description,
    required this.iconUrl,
    required this.bgImageUrl,
    required this.premiumActive,
  });

  factory CharacterAssistant.fromJson(Map<String, dynamic> json) {
    return CharacterAssistant(
      id: json['id'] as int,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      iconUrl: json['iconUrl'] ?? '',
      bgImageUrl: json['bgImageUrl'] ?? '',
      premiumActive: json['premiumActive'] as bool,
    );
  }
}
