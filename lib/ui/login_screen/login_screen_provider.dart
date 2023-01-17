import 'package:flutter_riverpod/flutter_riverpod.dart';

final colourProvider = StateProvider.autoDispose<bool>((ref) => false);

class HoverNotifier extends StateNotifier<List<bool>> {
  HoverNotifier() : super(List<bool>.generate(9, (_) => false));

  void onHover(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) true else false
    ];
  }

  void onExit(int index) {
    state = [for (int i = 0; i < state.length; i++) false];
  }
}

final hovervalueProvider =
    StateNotifierProvider<HoverNotifier, List<bool>>((ref) {
  return HoverNotifier();
});

class TextFieldNotifier extends StateNotifier<List<String>> {
  TextFieldNotifier() : super([""]);

  void onChanging(List<String> value) {
    state = value;
  }
}

final textFieldProvider =
    StateNotifierProvider<TextFieldNotifier, List<String>>((ref) {
  return TextFieldNotifier();
});
























// final textttFormField=


