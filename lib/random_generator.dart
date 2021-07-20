import 'dart:math';
// import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'random_generator.freezed.dart';
// part 'random_generator.g.dart';

@freezed
class RandomizerState with _$RandomizerState {
  const RandomizerState._();
  const factory RandomizerState({
    @Default(0) int min,
    @Default(0) int max,
    int? randomNumber,
  }) = _RandomizerState;
}

class RandomizerNotifier extends StateNotifier<RandomizerState> {
  RandomizerNotifier() : super(RandomizerState());

  final random = Random();

  setMin(value) {
    state = state.copyWith(min: value);
  }
  setMax(value) {
    state = state.copyWith(max: value);
  }
  // setMax(value) => state.copyWith(max: value);

  generateRandomNumber() {
    state = state.copyWith(
        randomNumber: state.min + random.nextInt(state.max + 1 - state.min));
  }
}

// class RandomizeChangeNotifier extends StateNotifier {
//   final random = Random();

//   int? _randomNumber;

//   RandomizeChangeNotifier(state) : super(state);

//   get randomNumber => _randomNumber;

//   int min = 0;
//   int max = 0;

//   generateRandomNumber() {
//     _randomNumber = min + random.nextInt(max + 1 - min);
//     // notifyListeners();
//   }
// }
