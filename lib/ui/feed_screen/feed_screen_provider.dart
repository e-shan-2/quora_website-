import 'package:flutter_riverpod/flutter_riverpod.dart';

final handleState = StateProvider.autoDispose<List<bool>>(
    (ref) => List<bool>.generate(5, (_) => false));

final handleStateTwo = StateProvider.autoDispose<bool>(((ref) => false));

class HandlingButtonState extends StateNotifier<List<bool>> {
  HandlingButtonState()
      : super(List<bool>.generate(5, (n) => n == 0 ? true : false));

  void onTap(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) true else false
    ];
  }
}

final buttonStateProvider =
    StateNotifierProvider<HandlingButtonState, List<bool>>((ref) {
  return HandlingButtonState();
});
