import 'package:drinkdeck/src/shared/constants.dart';

class DeckItem {
  final String id;
  final String text;
  final DeckItemType type;
  final DeckItemCategory category;
  final DateTime createdAt;
  final DeckItemSource source;

  DeckItem({
    required this.id,
    required this.text,
    required this.type,
    required this.category,
    required this.createdAt,
    required this.source,
  });

  factory DeckItem.fromJson(Map<String, dynamic> json) {
    return DeckItem(
      id: json['id'] as String,
      text: json['text'] as String,
      type: DeckItemType.fromString(json['type'] as String),
      category: DeckItemCategory.fromString(json['category'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      source: DeckItemSource.fromString(json['source'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'type': type.name,
      'category': category.name,
      'created_at': createdAt.toIso8601String(),
      'source': source.name,
    };
  }
}
