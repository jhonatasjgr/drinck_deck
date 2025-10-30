import 'package:drinkdeck/src/data/deck_repository.dart';
import 'package:drinkdeck/src/models/deck_item.dart';
import 'package:drinkdeck/src/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class CreatePage extends ConsumerStatefulWidget {
  const CreatePage({super.key});

  @override
  ConsumerState<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends ConsumerState<CreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  DeckItemType? _selectedType = DeckItemType.desafio;
  DeckItemCategory? _selectedCategory = DeckItemCategory.medio;

  final _uuid = const Uuid();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedType == null || _selectedCategory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Por favor, selecione tipo e categoria.')),
        );
        return;
      }

      final newItem = DeckItem(
        id: _uuid.v4(),
        text: _textController.text,
        type: _selectedType!,
        category: _selectedCategory!,
        createdAt: DateTime.now(),
        source: DeckItemSource.session,
      );

      ref.read(deckRepositoryProvider.notifier).addSessionItem(newItem);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Desafio adicionado à sessão!')),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Novo Desafio'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'Texto da dinâmica',
                  hintText: 'Ex: Beba 2 goles se...',
                ),
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'O texto é obrigatório.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<DeckItemType>(
                value: _selectedType,
                decoration: const InputDecoration(
                  labelText: 'Tipo de Dinâmica',
                ),
                items: DeckItemType.values.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type.displayName),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedType = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<DeckItemCategory>(
                value: _selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Intensidade',
                ),
                items: DeckItemCategory.values.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category.displayName),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _onSave,
                child: const Text('Salvar na Sessão'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
