import 'package:drinkdeck/src/data/deck_repository.dart';
import 'package:drinkdeck/src/features/home/widgets/deck_back_widget.dart';
import 'package:drinkdeck/src/features/home/widgets/deck_front_widget.dart';
import 'package:drinkdeck/src/models/deck_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  DeckItem? _currentItem;
  bool _isRevealed = false;

  late final AnimationController _shuffleController;

  @override
  void initState() {
    super.initState();
    _shuffleController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _shuffleController.dispose();
    super.dispose();
  }

  void _onTapCard() {
    if (_shuffleController.isAnimating) return;

    _shuffleController.forward(from: 0.0).then((_) {
      final newItem = ref.read(deckRepositoryProvider.notifier).getRandomItem();

      setState(() {
        _currentItem = newItem;
        _isRevealed = true;
      });
    });
  }

  void _onTapNext() {
    setState(() {
      _isRevealed = false;
    });
  }

  void _onShare(DeckItem item) {
    Share.share('DrinkDeck: ${item.type.displayName}\n\n${item.text}');
  }

  @override
  Widget build(BuildContext context) {
    final deckAsync = ref.watch(deckRepositoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DrinkDeck'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/create'),
          ),
        ],
      ),
      body: Center(
        child: deckAsync.when(
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Erro ao carregar deck: $err'),
          data: (deck) {
            if (deck.isEmpty) {
              return const Text('Nenhuma carta no baralho.');
            }

            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: _isRevealed && _currentItem != null
                  ? DeckFrontWidget(
                      key: ValueKey(_currentItem!.id),
                      item: _currentItem!,
                      onNext: _onTapNext,
                      onShare: () => _onShare(_currentItem!),
                    )
                  : DeckBackWidget(
                      key: const ValueKey('back'),
                      controller: _shuffleController,
                      onTap: _onTapCard,
                    ),
            );
          },
        ),
      ),
    );
  }
}
