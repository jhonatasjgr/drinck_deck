import 'dart:convert';
import 'dart:math';

import 'package:drinkdeck/src/models/deck_item.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'deck_repository.g.dart';

@Riverpod(keepAlive: true)
class DeckRepository extends _$DeckRepository {
  @override
  Future<List<DeckItem>> build() async {
    return _loadBuiltinItems();
  }

  Future<List<DeckItem>> _loadBuiltinItems() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/data/questions.json');
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      final itemList = jsonMap['items'] as List;
      return itemList.map((itemJson) => DeckItem.fromJson(itemJson)).toList();
    } catch (e) {
      print('Erro ao carregar deck inicial: $e');
      return [];
    }
  }

  void addSessionItem(DeckItem item) {
    final currentState = state.valueOrNull ?? [];
    state = AsyncData([...currentState, item]);
  }

  DeckItem? getRandomItem() {
    final items = state.valueOrNull;
    if (items == null || items.isEmpty) {
      return null;
    }
    final random = Random();
    return items[random.nextInt(items.length)];
  }

  void removeSessionItem(String id) {
    final currentState = state.valueOrNull ?? [];
    state = AsyncData(currentState.where((item) => item.id != id).toList());
  }

  void resetSession() {
    state = const AsyncLoading();
    ref.invalidateSelf();
  }
}
