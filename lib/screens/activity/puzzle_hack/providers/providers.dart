import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/box2d_controller.dart';
import '../controllers/config_controller.dart';
import '../controllers/game_controller.dart';
import '../controllers/puzzle_controller.dart';
import '../state/box2d_state.dart';
import '../state/config_state.dart';
import '../state/game_state.dart';
import '../state/puzzle_state.dart';


/// [GameStateStatus] provider.
final gameStateStatusProvider = Provider<GameStateStatus>(
  (ref) => ref.watch(gameControllerProvider).gameStateStatus,
);

/// [PuzzleStatus] provider.
final puzzleStatusProvider = Provider<PuzzleStatus>(
  (ref) => ref.watch(puzzleControllerProvider).puzzleStatus,
);

abstract class Providers {
  static StateNotifierProvider<GameController, GameState> get gameController =>
      gameControllerProvider;

  static StateNotifierProvider<PuzzleController, PuzzleState>
      get puzzleController => puzzleControllerProvider;

  static StateNotifierProvider<Box2DController, Box2dState>
      get box2dController => box2DControllerProvider;

  static StateNotifierProvider<ConfigController, ConfigState>
      get configController => configControllerProvider;

  static Provider<GameStateStatus> get gameStateStatus =>
      gameStateStatusProvider;

  static Provider<PuzzleStatus> get puzzleStatus => puzzleStatusProvider;
}
