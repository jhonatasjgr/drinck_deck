import 'package:drinkdeck/src/shared/theme.dart';
import 'package:flutter/material.dart';

enum DeckItemType {
  verdade,
  desafio,
  eu_nunca,
  vote,
  regra,
  acao_rapida;

  static DeckItemType fromString(String type) {
    return DeckItemType.values.firstWhere(
      (e) => e.name == type,
      orElse: () => DeckItemType.desafio,
    );
  }

  String get displayName {
    switch (this) {
      case DeckItemType.verdade:
        return 'Verdade';
      case DeckItemType.desafio:
        return 'Desafio';
      case DeckItemType.eu_nunca:
        return 'Eu Nunca';
      case DeckItemType.vote:
        return 'Vote';
      case DeckItemType.regra:
        return 'Regra';
      case DeckItemType.acao_rapida:
        return 'Ação Rápida';
    }
  }
}

enum DeckItemCategory {
  leve,
  medio,
  pesado;

  static DeckItemCategory fromString(String category) {
    return DeckItemCategory.values.firstWhere(
      (e) => e.name == category,
      orElse: () => DeckItemCategory.leve,
    );
  }

  String get displayName {
    switch (this) {
      case DeckItemCategory.leve:
        return 'Leve';
      case DeckItemCategory.medio:
        return 'Médio';
      case DeckItemCategory.pesado:
        return 'Pesado';
    }
  }

  Color get displayColor {
    switch (this) {
      case DeckItemCategory.leve:
        return AppColors.categoryLeve;
      case DeckItemCategory.medio:
        return AppColors.categoryMedio;
      case DeckItemCategory.pesado:
        return AppColors.categoryPesado;
    }
  }
}

enum DeckItemSource {
  builtin,
  session;

  static DeckItemSource fromString(String source) {
    return DeckItemSource.values.firstWhere(
      (e) => e.name == source,
      orElse: () => DeckItemSource.builtin,
    );
  }
}
